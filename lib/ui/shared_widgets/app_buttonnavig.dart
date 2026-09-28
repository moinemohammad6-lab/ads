import 'package:flutter/material.dart';

class AppButtonnavig extends StatelessWidget {
  final String text;
  final IconData icon;
  const AppButtonnavig({super.key,
  required this.text,
  required this.icon,
  


  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Row(
       children: [
        Column(
        children: [
          Icon(icon),
          Text(text),
        ],
        ),
        Column(
          children: [
            Icon(icon),
            Text(text),
          ],
        ),
        
       ],

      ),
    );
  }
}