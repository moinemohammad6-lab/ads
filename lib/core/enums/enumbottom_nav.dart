import 'package:flutter/material.dart';

enum BottomNavItem{
home,
message,
adda,
archives,
profile;
  

  IconData get icon {
    switch (this) 
    {
      case BottomNavItem.home:
         return Icons.home_outlined;
      case BottomNavItem.message:
        return Icons.message_outlined; 
       case BottomNavItem.adda:
       return Icons.add_outlined;
        case BottomNavItem.archives:
        return Icons.bookmark_outlined;
         case BottomNavItem.profile:
         return Icons.person_outlined;

    }
  }
 IconData get activeIcon {
  switch(this){
    case BottomNavItem.home:
        return Icons.home;
      case BottomNavItem.message:
        return Icons.message;
      case BottomNavItem.adda:
        return Icons.add;
      case BottomNavItem.archives:
        return Icons.archive;
    case BottomNavItem.profile:
         return Icons.person;
    

  }

 }

 String get title {
    switch (this) {
      case BottomNavItem.home:
        return "الرئيسة";
      case BottomNavItem.message:
        return "الرسائل";
      case BottomNavItem.adda:
        return "  ";
      case BottomNavItem.archives:
        return "المحفوظات";
      case BottomNavItem.profile:
        return "الملف الشخصي";
    }
  }
String get route {
    switch (this) {
      case BottomNavItem.home:
        return "/home";
      case BottomNavItem.message:
        return "/message";
      case BottomNavItem.adda:
        return "/adda";
      case BottomNavItem.archives:
        return  "/archives";
      case BottomNavItem.profile:
        return "/profile";
    }
    
  }



}