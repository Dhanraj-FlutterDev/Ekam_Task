import 'package:flutter/material.dart';

class BottomButtonWidget extends StatelessWidget {

final String title;
final VoidCallback? onTap;

  const BottomButtonWidget({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     padding: const EdgeInsets.symmetric(
       horizontal: 16,vertical: 14
     ),
     decoration: BoxDecoration(
       color: Colors.white,
       border: Border.all(
         color: Colors.grey
       ),
       borderRadius: const BorderRadius.only(
         topLeft: Radius.circular(10),
         topRight: Radius.circular(10),
       )
     ),
     child: GestureDetector(
      onTap: onTap,
       child: Container(
         height: 50,
         decoration: BoxDecoration(
           color: Colors.blueAccent.shade700,
           borderRadius: BorderRadius.circular(30),
           
         ),
         child:  Center(
           child: Text(title,style: const TextStyle(
             color: Colors.white,fontSize: 16
           ),),
         ),
       ),
     ),
    );
  }
}