import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../theme/color.dart';
import 'dashboard_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: getTabs(),
      floatingActionButton: FloatingActionButton(
        
        onPressed: (){
        setState(() {
          pageIndex =4;
        });
      },
      child: Icon(AntDesign.creditcard,size: 25,),
      backgroundColor: primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // ---------------------------------
    body: getBody(),
    
    );
  }
  Widget getTabs(){
    List<IconData> iconsItems = [
      MaterialCommunityIcons.view_grid,
       MaterialCommunityIcons.comment,
        MaterialCommunityIcons.bell,
         MaterialCommunityIcons.account_circle,

    ];
    return AnimatedBottomNavigationBar(
      icons : iconsItems,
      activeColor: primary,
      splashColor: secondary,
      inactiveColor: black.withOpacity(0.5),
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      rightCornerRadius: 10,
      activeIndex: pageIndex,
      onTap: (index){
        setState(() {
          pageIndex= index;
        });
          
      },);
  }
  // ------------------------------
  Widget getBody(){
    return IndexedStack(
      index: pageIndex,
      children: [
        Dashboardpage(),
        // --------------------------------
             Center(child: Text("Chat page",
        style: TextStyle(fontSize: 20,
        fontWeight: FontWeight.bold),),),
             Center(child: Text("Notification page",
        style: TextStyle(fontSize: 20,
        fontWeight: FontWeight.bold),),),
             Center(child: Text("Account page",
        style: TextStyle(fontSize: 20,
        fontWeight: FontWeight.bold),),),
             Center(child: Text("Credit card page",
        style: TextStyle(fontSize: 20,
        fontWeight: FontWeight.bold),),),

      ],
    );
  }
}