import 'package:flutter/material.dart';
import 'package:flutter_ekam_task/screens/doctor_details_screen.dart';

class TaskStartScreen extends StatelessWidget {
  const TaskStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Ekam App Task',style: TextStyle(
          color: Colors.black
        ),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=> const DoctorDetailsScreen() ) );
        }, child: const Text('Go to Doctor Details Screen') ),
      ),
    );
  }
}