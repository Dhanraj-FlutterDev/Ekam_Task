import 'package:flutter/material.dart';

import '../utils/api_services.dart';
import '../widgets/appbar_widget.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({super.key});

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {

var apiService =  ApiServices();
bool isLoading = false;
 List _viewBookingsResponseModal = [];


getMyBooking()async{

        setState(() {
          isLoading = true;
        });
var map   =  await  apiService.getRequestApi('https://my-json-server.typicode.com/githubforekam/doctor-appointment/appointments');
  _viewBookingsResponseModal = map;
print('response $_viewBookingsResponseModal ');
        setState(() {
          isLoading = false;
        });
}


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMyBooking();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
           appBar: const PreferredSize(preferredSize:Size.fromHeight(kTextTabBarHeight), child: AppBarWidget(title: 'My Bookings',showSearch: true,) ),
 body: isLoading?const Center(
  child: CircularProgressIndicator(),
 ):  ListView.builder(
  itemCount: _viewBookingsResponseModal.length,
  padding: const EdgeInsets.only(
    top: 16,left: 16,right: 16
  ),
  itemBuilder: (context,index){
  return Container(
    margin: const EdgeInsets.only(
      bottom: 16
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 10,vertical: 16
    ),
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey,
        
        
      ),
      borderRadius: BorderRadius.circular(8)
    ),
    child:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text('${_viewBookingsResponseModal[index]['appointment_date']}, ${_viewBookingsResponseModal[index]['appointment_time']} ',style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500
        ),),
        const Divider(
          height: 30,
        ),
        Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: const DecorationImage(image: NetworkImage('https://img.freepik.com/free-photo/female-doctor-hospital-with-stethoscope_23-2148827776.jpg'),fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(8),
                color: Colors.blueAccent.shade100
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               Text('${_viewBookingsResponseModal[index]['doctor_name']}',style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500
                    ),),    
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
              Icon(Icons.location_on_outlined,size: 18,color: Colors.blueAccent.shade700,),
              Text('${_viewBookingsResponseModal[index]['location']}',style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500,color: Colors.grey
                    ),),
                      ],
                    ),
              
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
              const Icon(Icons.bookmark ,size: 18,),
              const Text('Booking ID : ',style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500,color: Colors.grey
                    ),),
                       Text('${_viewBookingsResponseModal[index]['booking_id']}',style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500,color: Colors.blueAccent.shade700
                    ),),
                      ],
                    )
                ],
              ),
            )
          ],
        )
    , const Divider(
      height: 30,
    ),
    Row(
      children: [
        Expanded(
          child: GestureDetector(
              onTap: (){},
               child: Container(
           height: 50,
           decoration: BoxDecoration(
             color: Colors.blueAccent.shade100,
             borderRadius: BorderRadius.circular(30),
             
           ),
           child:   Center(
             child: Text('Cancel',style: TextStyle(
               color: Colors.blueAccent.shade700,fontSize: 16
             ),),
           ),
               ),
             ),
        ),
        const SizedBox(
          width: 16,
        ),
     Expanded(
       child: GestureDetector(
        onTap: (){},
         child: Container(
           height: 50,
           decoration: BoxDecoration(
             color: Colors.blueAccent.shade700,
             borderRadius: BorderRadius.circular(30),
             
           ),
           child:  const Center(
             child: Text('Reschedule',style: TextStyle(
               color: Colors.white,fontSize: 16
             ),),
           ),
         ),
       ),
     ),
      ],
    )
      ],
    ),
  );
 }),
    );
  }
}