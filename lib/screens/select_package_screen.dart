import 'package:flutter/material.dart';
import 'package:flutter_ekam_task/screens/review_screen.dart';
import 'package:flutter_ekam_task/widgets/appbar_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/api_services.dart';
import '../widgets/bottom_button_widget.dart';

class SelectPackageScreen extends StatefulWidget {
  const SelectPackageScreen({super.key,
   required this.doctorInfo,
   required this.selectedDay,required this.selectedTime
    });

final  Map doctorInfo;
final dynamic selectedDay;
final dynamic selectedTime;

  @override
  State<SelectPackageScreen> createState() => _SelectPackageScreenState();
}

class _SelectPackageScreenState extends State<SelectPackageScreen> {

var dropdownvalue;

var apiService =  ApiServices();
bool isLoading = false;
Map packageData = {};

// List of items in our dropdown menu
var duration = [	
	
];
var packages = [];
var selectedOption;

getPackages()async{

        setState(() {
          isLoading = true;
        });
var map   =  await  apiService.getRequestApi('https://my-json-server.typicode.com/githubforekam/doctor-appointment/appointment_options');
packageData = map;
duration = packageData['duration'];
packages = packageData['package'];
print('response $packages ');
        setState(() {
          isLoading = false;
        });
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPackages();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(preferredSize:Size.fromHeight(kTextTabBarHeight), child: AppBarWidget(title: 'Select Package') ),
    body:isLoading?const Center(
      child: CircularProgressIndicator(),
    ):  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            top: 16,left: 16
          ),
          child: Text('Select Duration',style: TextStyle(
            fontSize: 16,fontWeight: FontWeight.w500
          ),),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              
            ),
            borderRadius: BorderRadius.circular(10)
          ),
          padding: const EdgeInsets.only(left: 16,right: 16),
          margin: const EdgeInsets.only(left: 16,right: 16),
          child: Row(
            children: [
              const Icon(Icons.schedule,color: Colors.blueAccent,),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      value: dropdownvalue,
                      isExpanded: true,
                      hint:  const Text('Duration'),
                      icon:  const Icon(Icons.keyboard_arrow_down,color: Colors.blueAccent),	
                      items: duration.map((items) {
                        return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                         dropdownvalue = newValue!;
                        });
                      },
                      ),
                ),
              ),
            ],
          ),
        ),
     const Padding(
          padding: EdgeInsets.only(
            top: 16,left: 16
          ),
          child: Text('Select Package',style: TextStyle(
            fontSize: 16,fontWeight: FontWeight.w500
          ),),
        ),
        ListView.builder(
          padding: const EdgeInsets.only(
            top: 16,left: 16,right: 16
          ),
          shrinkWrap: true,
          itemCount: packages.length,
          itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
               setState(() {
                    selectedOption = packages[index];
                  });
            },
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 16
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
          
                ),
                borderRadius: BorderRadius.circular(10)
                
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,vertical: 6
              ),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueAccent.shade100
                    ),
                    child: Center(
                      child: Icon(packages[index]=='Messaging'?Icons.message:packages[index]=='Voice Call'?Icons.call:packages[index]=='Video Call'?Icons.video_call:Icons.person,color: Colors.blueAccent.shade700,),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                   Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${packages[index]}',style: const TextStyle(
                        fontWeight: FontWeight.w500,fontSize: 14
                      ),),
                      const Text('Chat with doctor',style: TextStyle(
                        fontWeight: FontWeight.w500,fontSize: 12,color: Colors.grey
                      ),)
                    ],
                  ) ),
                  Radio(value: '${packages[index]}', groupValue: '$selectedOption', onChanged: (value){
                    setState(() {
                      selectedOption = packages[index];
                    });
                  } )
                ],
              ),
            ),
          );
        })
      ],
    ),
   bottomNavigationBar:  BottomButtonWidget(
    title: 'Next',
    onTap: (){
      if(dropdownvalue==null||selectedOption==null){
          Fluttertoast.showToast(
        msg: "Please Select Duration and Package",
        toastLength: Toast.LENGTH_SHORT);
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ReviewScreen(
        doctorInfo: widget.doctorInfo,
        package: selectedOption,
        duration: dropdownvalue,
        dataTime: '${widget.selectedDay}, ${widget.selectedTime}',
      ) ) );
      }
      
    },
   ),
   
    );
  }
}



