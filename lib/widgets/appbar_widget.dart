import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool showSearch;
  
   const AppBarWidget({
    super.key,
   required this.title,
   this.showSearch = false,
   this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton.outlined(onPressed: onTap??(){
        Navigator.pop(context);
      }, icon: const Icon(Icons.arrow_back) ),
      // elevation: 0.0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title:  Text(title,style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 16

      ),),
      actions: [
      showSearch?  IconButton.outlined(onPressed: onTap??(){
       }, icon: const Icon(Icons.search) ):const SizedBox.shrink()
      ],
    );
  }
}