


import 'package:flutter/material.dart';
import 'package:flutter_ekam_task/screens/my_booking_screen.dart';

import '../response/booking_confirmation_response_modal.dart';
import '../utils/api_services.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/bottom_button_widget.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({super.key});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {

var apiService =  ApiServices();
bool isLoading = false;
 BookingConfirmationResponseModal? _bookingConfirmationResponseModal;


getBookingConfirmation()async{

        setState(() {
          isLoading = true;
        });
Map<String,dynamic> map   =  await  apiService.getRequestApi('https://my-json-server.typicode.com/githubforekam/doctor-appointment/booking_confirmation');
_bookingConfirmationResponseModal = BookingConfirmationResponseModal.fromJson(map);
print('response $_bookingConfirmationResponseModal ');
        setState(() {
          isLoading = false;
        });
}


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBookingConfirmation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
           appBar: const PreferredSize(preferredSize:Size.fromHeight(kTextTabBarHeight), child: AppBarWidget(title: 'Confirmation') ),
 
    bottomNavigationBar:  BottomButtonWidget(
    title: 'View Appointments',
    onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyBookingScreen() ) );
 
    },
   ),
   body:isLoading?const Center(
    child: CircularProgressIndicator(),
   ): Column(
    children: [
      const SizedBox(
        height: 40,
      ),
      Center(
        child: Icon(Icons.check_circle,color: Colors.blueAccent.shade700,size: 150, ),
      ),
      const Text('Appointment Confirmed!',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,fontWeight: FontWeight.w500,
      ),),
      
      const SizedBox(
        height: 20,
      ),
      const Text('You have successfully booked appointment with',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 14,fontWeight: FontWeight.w500,
        color: Colors.grey
      ),),
      Text(_bookingConfirmationResponseModal!.doctorName.toString(),
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 16,fontWeight: FontWeight.w500,
       
      ),),
      const SizedBox(
        height: 40,
      ),
      Padding(
        padding: const EdgeInsets.only(
          top: 16,left: 16,right: 16
        ),
        child: Row(
          children: [
            Icon(Icons.person,color: Colors.blueAccent.shade700,),
            
         Text(_bookingConfirmationResponseModal!.appointmentPackage.toString(),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,fontWeight: FontWeight.w500,
         
        ),),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: 16,right: 16,top: 16
        ) ,
        child: Row(
          children: [
            Expanded(child: Row(
          children: [
            Icon(Icons.date_range,color: Colors.blueAccent.shade700,),
            
         Text(_bookingConfirmationResponseModal!.appointmentDate.toString(),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,fontWeight: FontWeight.w500,
         
        ),),
          ],
        ),),
         Expanded(child: Row(
          children: [
            Icon(Icons.schedule ,color: Colors.blueAccent.shade700,),
            
       Text(_bookingConfirmationResponseModal!.appointmentTime.toString(),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,fontWeight: FontWeight.w500,
         
        ),),
          ],
        ),)
          ],
        ),
      )
    ],
   ),
    );
  }
}