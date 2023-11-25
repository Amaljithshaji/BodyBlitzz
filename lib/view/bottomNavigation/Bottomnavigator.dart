import 'package:bodyblitz/view/Home/Home.dart';
//import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../utills/constant/colors_constant/colors_const.dart';
import '../discover/discover.dart';
import '../progress/progress.dart';
import '../settings/settings.dart';

class Bottom_Naviagator extends StatefulWidget {
  const Bottom_Naviagator({super.key});

  @override
  State<Bottom_Naviagator> createState() => _Bottom_NaviagatorState();
}

class _Bottom_NaviagatorState extends State<Bottom_Naviagator> with TickerProviderStateMixin {
  int index = 0;
  final List<Widget> _pages = [
    Home_Screen(),
    Discover_Screen(),
   Progress_Screen(),
   Settings_Screen()
  ];
  @override
  Widget build(BuildContext context) {
    
    // var anim = AnimationController(
    //   vsync: this,
    //   value: 1,
    //   duration: const Duration(milliseconds: 500),
    //);
    return Scaffold(
      extendBody: true,
      body: _pages[index],
      bottomNavigationBar:Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BottomNavigationBar(
              onTap: (i) => setState(() => index = i),
              currentIndex: index,
               backgroundColor: Color_const.myButton,
               selectedItemColor: Colors.white ,
               type: BottomNavigationBarType.shifting,
               
               
              items:
             [
              BottomNavigationBarItem( icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Color_const.myButton,),
              BottomNavigationBarItem( icon: Icon(Icons.explore),label: 'Explore',
              backgroundColor:Color_const.myButton, ),
              BottomNavigationBarItem( icon:Icon( Icons.stacked_bar_chart, ),label: 'Report',
              backgroundColor: Color_const.myButton,),
              BottomNavigationBarItem( icon: Icon(Icons.settings),label: 'Settings',
              backgroundColor: Color_const.myButton,),
            
              ],),
          ),
        ),
      )
    );
  }
}

//  Padding(
//           padding: EdgeInsets.only(bottom: 20),
//           child: SingleChildScrollView(
//             child: DotNavigationBar(
//               margin: EdgeInsets.only(left: 0, right: 0),
//               currentIndex: index,
//               backgroundColor: Color_const.myButton,
//               dotIndicatorColor: Colors.white,
//               unselectedItemColor: Theme.of(context).colorScheme.background,
//               splashBorderRadius: 50,
//               borderRadius: 100,
//               enablePaddingAnimation:true,
//                enableFloatingNavBar: true,
               
//               onTap: (i) => setState(() => index = i),
//               items: [
//                 /// Home
//                 DotNavigationBarItem(
//                   icon: Icon(Icons.home),
//                   selectedColor: Colors.white,
//                 ),
                
//                 /// Likes
//                 DotNavigationBarItem(
//                   icon: Icon(Icons.explore),
//                   selectedColor: Colors.white,
//                 ),
                
//                 /// Search
//                 DotNavigationBarItem(
//                   icon:Icon( Icons.stacked_bar_chart, ),
//                   selectedColor: Colors.white,
//                 ),
                
//                 /// Profile
//                 DotNavigationBarItem(
//                   icon: Icon(Icons.settings),
//                   selectedColor: Colors.white,
//                 ),
//               ],
//             ),
//           ),
//         ),