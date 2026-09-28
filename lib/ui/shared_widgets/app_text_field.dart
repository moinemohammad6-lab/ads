import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final hintText;
  final String? errorText;
  final Widget? prefixIcon;
 final Widget? suffixIcon;
 final TextEditingController controller;
  final String? Function(String?)? validator;
  const AppTextField({super.key,
  required this.hintText,
   this.errorText,
  this.prefixIcon,
  this.suffixIcon,
  required this.controller,
  this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
       controller: controller,
       validator: validator,
       decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorText: errorText, 
      ),
    );
  }
}