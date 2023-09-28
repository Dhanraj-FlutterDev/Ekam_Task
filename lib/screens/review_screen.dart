import 'package:flutter/material.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/bottom_button_widget.dart';
import 'confirmation_screen.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key, required this.doctorInfo,
 required this.duration, required this.package,
 
 required this.dataTime
   });

  final Map doctorInfo;
  final dynamic duration;
  final dynamic package;
  final dynamic dataTime; 

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
           appBar: const PreferredSize(preferredSize:Size.fromHeight(kTextTabBarHeight), child: AppBarWidget(title: 'Review Summary') ),
 
    bottomNavigationBar:  BottomButtonWidget(
    title: 'Confirm',
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ConfirmationScreen() ) );
    },
   ),
    body:   Column(
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
                    backgroundImage: NetworkImage('${doctorInfo['image']}'),
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
                 Text('${doctorInfo['doctor_name']}',style: const TextStyle(
                  fontSize: 16,fontWeight: FontWeight.w500
                ),),
                Text('${doctorInfo['speciality']}',style: const TextStyle(
                  fontSize: 14,color: Colors.grey
                ),),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Icon(Icons.location_on,color: Colors.blueAccent.shade700,
                    
                    ),
                  Text('${doctorInfo['location']}',style: const TextStyle(
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
       Padding(
        padding: const EdgeInsets.only(
          top: 16,left: 16,right: 16
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date & Time',style: TextStyle(
              color: Colors.grey,fontWeight: FontWeight.w500
            ),),
            Text('$dataTime',style: const TextStyle(
            fontWeight: FontWeight.w500
            ),)
          ],
        ),
      ),
       Padding(
        padding: const EdgeInsets.only(
          top: 16,left: 16,right: 16
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Package',style: TextStyle(
              color: Colors.grey,fontWeight: FontWeight.w500
            ),),
            Text('$package',style: const TextStyle(
            fontWeight: FontWeight.w500
            ),)
          ],
        ),
      ),
       Padding(
        padding: const EdgeInsets.only(
          top: 16,left: 16,right: 16
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Duration',style: TextStyle(
              color: Colors.grey,fontWeight: FontWeight.w500
            ),),
            Text('$duration',style: const TextStyle(
            fontWeight: FontWeight.w500
            ),)
          ],
        ),
      ),
       const Padding(
        padding: EdgeInsets.only(
          top: 16,left: 16,right: 16
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Booking for',style: TextStyle(
              color: Colors.grey,fontWeight: FontWeight.w500
            ),),
            Text('Self',style: TextStyle(
            fontWeight: FontWeight.w500
            ),)
          ],
        ),
      )

      ],
    ),
    );
  }
}