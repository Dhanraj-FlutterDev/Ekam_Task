import 'package:flutter/material.dart';
import 'package:flutter_ekam_task/screens/select_package_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/api_services.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/bottom_button_widget.dart';

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({super.key});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {

var apiService =  ApiServices();
bool isLoading = false;
 List _doctorDetailsResponse = [];
 var _daylist = [];
 var _timelist = [];
 var availability;
 var selectedDay;
 var selectedTime;


getDoctorDetails()async{

        setState(() {
          isLoading = true;
        });
var map   =  await  apiService.getRequestApi('https://my-json-server.typicode.com/githubforekam/doctor-appointment/doctors');
  _doctorDetailsResponse = map;
  availability = _doctorDetailsResponse[0]['availability'];
  _daylist = _doctorDetailsResponse[0]['availability'].keys.toList();
  // _timelist = _doctorDetailsResponse[0]['availability'].values.toList();
print('response $availability ');
        setState(() {
          isLoading = false;
        });
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDoctorDetails();
  }



  @override
  Widget build(BuildContext context) {

    return   Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(preferredSize: Size.fromHeight(kTextTabBarHeight), child: AppBarWidget(
        title: 'Book Appointment',
      ) ),
       bottomNavigationBar:  BottomButtonWidget(
    title: 'Make Appointment',
    onTap: (){
      if(selectedDay==null || selectedTime==null){
        Fluttertoast.showToast(
        msg: "Please Select Day and Time",
        toastLength: Toast.LENGTH_SHORT,
     
    );
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (context)=> SelectPackageScreen(
        doctorInfo: _doctorDetailsResponse[0],
        selectedDay: selectedDay,
        selectedTime: selectedTime,
      )) );
      }
      
    },
   ),
      body:isLoading?const Center(
        child: CircularProgressIndicator(),
      ): Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
                Row(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: Stack(
                children: [
                   CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.amber,
                    backgroundImage: NetworkImage('${_doctorDetailsResponse[0]['image']}'),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 10,
                    child: Icon(Icons.verified,color: Colors.blueAccent.shade700,
                    size: 30,
                    ))
                ],
              ),
            ),
             Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text('${_doctorDetailsResponse[0]['doctor_name']}',style: const TextStyle(
                  fontSize: 16,fontWeight: FontWeight.w500
                ),),
                Text('${_doctorDetailsResponse[0]['speciality']}',style: const TextStyle(
                  fontSize: 14,color: Colors.grey
                ),),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Icon(Icons.location_on,color: Colors.blueAccent.shade700,
                    
                    ),
                  Text('${_doctorDetailsResponse[0]['location']}',style: const TextStyle(
                  fontSize: 14,color: Colors.grey
                ),)
                  ],
                )
              ],
            ))
          ],
        )
      ,const Divider(
        indent: 16,
        endIndent: 16,
      ),
      Padding(padding: const EdgeInsets.only(
        top: 16,left: 16,right: 16
      ),
      child: Row(
        children: [
          Expanded(child: Column(

            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueAccent.shade100
                ),
                child: Center(
                  child: Icon(Icons.person_2,color: Colors.blueAccent.shade700,),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text('${_doctorDetailsResponse[0]['patients_served']}+',style: TextStyle(
                  fontSize: 16,color: Colors.blueAccent.shade700,fontWeight: FontWeight.w500
                ),),
                const Text('Patients',style: TextStyle(
                  fontSize: 14,color: Colors.grey
                ),)
            ],
          )),
          Expanded(child: Column(

            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueAccent.shade100
                ),
                child: Center(
                  child: Icon(Icons.badge ,color: Colors.blueAccent.shade700,),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text('${_doctorDetailsResponse[0]['years_of_experience']}+',style: TextStyle(
                  fontSize: 16,color: Colors.blueAccent.shade700,fontWeight: FontWeight.w500
                ),),
                const Text('Years of Experience',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 14,color: Colors.grey
                ),)
            ],
          )),
          Expanded(child: Column(

            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueAccent.shade100
                ),
                child: Center(
                  child: Icon(Icons.star,color: Colors.blueAccent.shade700,),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text('${_doctorDetailsResponse[0]['rating']}+',style: TextStyle(
                  fontSize: 16,color: Colors.blueAccent.shade700,fontWeight: FontWeight.w500
                ),),
                const Text('Rating',style: TextStyle(
                  fontSize: 14,color: Colors.grey
                ),)
            ],
          )),
          Expanded(child: Column(

            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueAccent.shade100
                ),
                child: Center(
                  child: Icon(Icons.messenger_sharp ,color: Colors.blueAccent.shade700,),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text('${_doctorDetailsResponse[0]['number_of_reviews']}',style: TextStyle(
                  fontSize: 16,color: Colors.blueAccent.shade700,fontWeight: FontWeight.w500
                ),),
                const Text('Reviews',style: TextStyle(
                  fontSize: 14,color: Colors.grey
                ),)
            ],
          )),
        ],
      ),
      ),
      const Padding(padding: EdgeInsets.only(
        top: 30,left: 16
      ),
      child: Text('Book Appointment',style: TextStyle(
        color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 14
      ),),
      ),
      const Padding(padding: EdgeInsets.only(
        top: 16,left: 16
      ),
      child: Text('Day',style: TextStyle(
        fontWeight: FontWeight.w500,fontSize: 16
      ),),
      ),
      
      SizedBox(
        height: 50,
        child: ListView.builder(
          padding: const EdgeInsets.only(
            top: 10,left: 16
          ),
          scrollDirection: Axis.horizontal,
          itemCount: _daylist.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                setState(() {
                  selectedDay = _daylist[index];
                  _timelist = availability[selectedDay];
                });
                debugPrint('slots $_timelist ');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: selectedDay == _daylist[index]?Colors.blueAccent.shade700:Colors.white,
                  border: Border.all(
                    color: Colors.blueAccent.shade700
                  )
                ),
                margin:  const EdgeInsets.only(right: 16),
                child: Center(child: Text('${_daylist[index]}',style: TextStyle(
                 color: selectedDay == _daylist[index]?Colors.white :Colors.black
                ),)),
              ),
            );
          }),
      ),
      
      const Padding(padding: EdgeInsets.only(
        top: 16,left: 16
      ),
      child: Text('Time',style: TextStyle(
        fontWeight: FontWeight.w500,fontSize: 16
      ),),
      ),SizedBox(
        height: 50,
        child: _timelist.isEmpty? const Center(
          child: Text('Select Day/No Slots Available'),
        ): ListView.builder(
          padding: const EdgeInsets.only(
            top: 10,left: 16
          ),
          scrollDirection: Axis.horizontal,
          itemCount: _timelist.length,
          itemBuilder: (context,index){
            debugPrint('${_timelist[index]}');
            return GestureDetector(
               onTap: (){
                setState(() {
                  selectedTime = _timelist[index];
                });
                debugPrint('time $selectedTime ');
              },
              child: Container(
                 padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: selectedTime == _timelist[index]?Colors.blueAccent.shade700:Colors.white,
                    border: Border.all(
                      color: Colors.blueAccent.shade700
                    )
                  ),
                margin: const EdgeInsets.only(right: 16),
                child: Center(
                  child: Text('${_timelist[index]}',style: TextStyle(
                    color: selectedTime == _timelist[index]?Colors.white :Colors.black
                  ),),
                ),
              ),
            );
          }),
      ),

        ],
      )
    );
  }
}

