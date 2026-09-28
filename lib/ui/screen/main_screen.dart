import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/enums/enumbottom_nav.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex=0;
   final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: <Widget>[
          Center(child: Text('الرئيسية'),),
           Center(child: Text('الرسائل'),),
           Center(child: Text(' add'),),
           Center(child: Text('المحفوظات'),),
           Center(child: Text('الملف الشخصي'),),
        ],
        onPageChanged: (index){
          setState(() {
            
          _currentIndex=index;
          });
        }
      ),
       bottomNavigationBar: Container(
        height: 70,
        child: Row( children: [
        Expanded(child: 
        InkWell(
          onTap: () {
            pageController.jumpToPage(0);
          },
          child: Column(children: [
            Icon(_currentIndex == 0
    ? BottomNavItem.home.activeIcon
    : BottomNavItem.home.icon,
            color: _currentIndex==0
            ?Colors.blue
            :Colors.grey),
   Text(
  BottomNavItem.home.title,
  style: TextStyle(
    color: _currentIndex == 0
        ? Colors.blue
        : Colors.grey,
  ),
)

            //))
          ],),
        ),),
        Expanded(child: 
        InkWell(
          onTap: () {
            pageController.jumpToPage(1);
          },
          child: Column(children: [
            Icon(_currentIndex == 0
    ? BottomNavItem.message.activeIcon
    : BottomNavItem.message.icon,  color: _currentIndex==1
            ?Colors.blue
            :Colors.grey),
            Text(BottomNavItem.message.title,
            style: TextStyle(
    color: _currentIndex == 1
        ? Colors.blue
        : Colors.grey,))
          ],),
        ),
        ),
        Expanded(child: 
        InkWell(
          onTap: () {
            pageController.jumpToPage(2);
          },
          child: Column(
            children: [
              Icon(_currentIndex == 0
    ? BottomNavItem.adda.activeIcon
    : BottomNavItem.adda.icon,
                color: _currentIndex==2
            ?Colors.blue
            :Colors.grey),
              Text(BottomNavItem.adda.title,
              style: TextStyle(
    color: _currentIndex == 2
        ? Colors.blue
        : Colors.grey,)
          )],
          
          ),
        ),),
        Expanded(child: 
        InkWell(
          onTap: () {
            pageController.jumpToPage(4);
          },
          child: Column(
            children: [
              Icon(_currentIndex == 0
    ? BottomNavItem.archives.activeIcon
    : BottomNavItem.archives.icon,
                color: _currentIndex==3
            ?Colors.blue
            :Colors.grey),
              Text(BottomNavItem.archives.title,
              style: TextStyle(
    color: _currentIndex == 3
        ? Colors.blue
        : Colors.grey,)
          )],
          
          ),
        ),),

        Expanded(child: 
        InkWell(
          onTap: () {
            pageController.jumpToPage(4);
          },
          child: Column(
            children: [
              Icon(_currentIndex == 0
    ? BottomNavItem.profile.activeIcon
    : BottomNavItem.profile.icon,
                color: _currentIndex==4
            ?Colors.blue
            :Colors.grey),
              Text(BottomNavItem.profile.title,
              style: TextStyle(
    color: _currentIndex == 4
        ? Colors.blue
        : Colors.grey,)
          )],
          
          ),
        ))



        ])
       )

    
     );
  }
}