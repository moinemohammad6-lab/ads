import 'package:flutter/material.dart';

class AppButon extends StatelessWidget {
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final String text;
  final Color? textColor;
  final VoidCallback onPressed;

  const AppButon({super.key,
   this.backgroundColor = Colors.blue,
    this.width,
    this.height = 50,
    required this.text,
    this.textColor = const Color(0xffffffff),
    required this.onPressed,});

  @override
Widget build(BuildContext context) {
    return SizedBox(
      width: width??double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: () => onPressed(),
      
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          disabledBackgroundColor: Colors.grey,
          
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12),
          ),
        ),
      
        child: Text(text, style: TextStyle(color: textColor, fontSize: 15)),
      ),
    );
  }
}
