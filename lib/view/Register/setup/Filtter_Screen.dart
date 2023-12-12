//import 'package:bodyblitz/view/Register/setup/next.dart';
//import 'package:bodyblitz/view/Home/Home.dart';
import 'package:bodyblitz/view/Register/setup/GoalScreen.dart';
import 'package:bodyblitz/view/Register/setup/profile_setup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../utills/constant/colors_constant/colors_const.dart';
import '../../bottomNavigation/Bottomnavigator.dart';

class Filtter_Screen extends StatefulWidget {
  const Filtter_Screen({super.key});

  @override
  State<Filtter_Screen> createState() => _Filtter_ScreenState();
}

class _Filtter_ScreenState extends State<Filtter_Screen> {
    List<bool> _isSelected = List.filled(5, false); // Initialize all containers as unselected

  void _changeSelection(int index) {
  setState(() {
    if (index == 0) {
      // Toggle the selection of "Full Body"
      _isSelected[0] = !_isSelected[0];

      if (_isSelected[0]) {
        // If "Full Body" is selected, select all other containers
        _isSelected = List.filled(5, true);
      } else {
        // If "Full Body" is unselected, unselect all other containers
        _isSelected = List.filled(5, false);
      }
    } else {
      // Toggle the selection of the pressed container
      _isSelected[index] = !_isSelected[index];

      // If all other containers are selected, also select "Full Body"
      if (_isSelected.sublist(1).every((isSelected) => isSelected)) {
        _isSelected[0] = true;
      } else {
        // If any other container is unselected, unselect "Full Body"
        _isSelected[0] = false;
      }
    }
  });
}
// void _navigateToNextScreen() {
//     // Filter out unselected containers
//     List<String> selectedContainers = [];
//     for (int i = 0; i < _isSelected.length; i++) {
//       if (_isSelected[i]) {
//         selectedContainers.add(_getBodyPartText(i));
//       }
//     }

//     // Navigate to the next screen and pass the selected containers
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => NextScreen(selectedContainers),
//       ),
//     );
//   }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(appBar: AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.background,
      leading: IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Setup_Screen(),));
      }, icon: Icon(Icons.arrow_back,color: Color_const.myButton,)),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Center(child: TextButton(onPressed: (){
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Bottom_Naviagator(),));
          },
            child: Text('Skip',style: TextStyle(color: Color_const.myButton,fontSize: 16),))),
        )
      ],
    ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(child: Text('Please choose your focus area',style:GoogleFonts.aDLaMDisplay(fontSize: 24) ,)),
            SizedBox(height: 7.h,),
             for (int i = 0; i < 5; i++)
           GestureDetector(
              onTap: (){
              _changeSelection(i);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: 260,
                  height: 8.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),color: _isSelected[i] ? Color_const.myButton: Color_const.myWhite,
                    border: Border.all(color: Theme.of(context).colorScheme.primary,width: 1)
                  ),
                  child: Center(child: Text( _getBodyPartText(i),style: GoogleFonts.aDLaMDisplay(fontSize: 20,color: _isSelected[i] ? Color_const.myWhite: Colors.black),)),
                ),
              ),
            ),
            SizedBox(height: 7.h,),
            GestureDetector(
              onTap: (){
               Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Goal_Screen(),) );
              },
              child: Container(
                width: 75.w,
                height: 6.h,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Color_const.myButton),
                child: Center(child: Text('NEXT',style: GoogleFonts.aDLaMDisplay(fontSize: 28,color: Color_const.myWhite),),),
              ),
            )
          ],
        ),
      ),
    );
  }
   String _getBodyPartText(int index) {
    switch (index) {
      case 0:
        return 'Full Body';
      case 1:
        return 'Arm';
      case 2:
        return 'Abs';
      case 3:
        return 'Butt';
      case 4:
        return 'Leg';
      default:
        return '';
    }
  }

}