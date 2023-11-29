import 'package:bodyblitz/view/Register/setup/GoalScreen.dart';
import 'package:bodyblitz/view/Register/setup/start.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';


import '../../../utills/constant/colors_constant/colors_const.dart';
import '../../bottomNavigation/Bottomnavigator.dart';

class PushUp extends StatefulWidget {
  const PushUp({super.key});

  @override
  State<PushUp> createState() => _PushUpState();
}

class _PushUpState extends State<PushUp> {
  List<Color> _containerColors = List.filled(5, Colors.transparent); // Initialize all containers to red

  void _changeColor(int index) {
    setState(() {
      // Change the color of the pressed container to blue, others to red
      _containerColors = List.generate(5, (i) => (i == index) ? Color_const.myButton : Colors.transparent);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Goal_Screen(),
                  ));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color_const.myButton,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Bottom_Naviagator(),));
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(color: Color_const.myButton, fontSize: 16),
                    ))),
          )
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Center(
              child: Container(
                  width: 350,
                  child: Text(
                    'How many push-ups can you do at one time ?',
                    style: GoogleFonts.aDLaMDisplay(
                      fontSize: 28,
                    ),
                    textAlign: TextAlign.center,
                  ))),
                  SizedBox(
            height: 5.h,
          ),
          for (int i = 0; i < 3; i++)
          GestureDetector(
            onTap: () {
              _changeColor(i);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: 15.h,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _containerColors[i],
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary, width: 2)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(_getText(i),style: GoogleFonts.aDLaMDisplay(fontSize: 28)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 50),
                              child: Center(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(_getBodyPartText(i),style: GoogleFonts.aDLaMDisplay(fontSize: 28),),
                                  ),SizedBox(height: 5,),
                                  Text(_getsubText(i),style: TextStyle(fontSize: 16),)
                                ],
                              )),
                            ),
                          ],
                        ),
              ),
            ),
          ),
           SizedBox(height: 5.h,),
          InkWell(
            onTap: (){
             Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Start_Screen(),) );
            },
            child: Container(
              width: 350,
              height: 60,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Color_const.myButton),
              child: Center(child: Text('NEXT',style: GoogleFonts.aDLaMDisplay(fontSize: 28),),),
            ),
          )
        ],
      ),
    );
  }
  String _getBodyPartText(int index) {
    switch (index) {
      case 0:
        return 'Beginner';
      case 1:
        return 'Intermediate';
      case 2:
        return 'Advanced';
      default:
        return '';
    }
  }
  String _getText(int index) {
    switch (index) {
      case 0:
        return '☝️';
      case 1:
        return '✌️';
      case 2:
        return '👍';
      default:
        return '';
    }
  }
   String _getsubText(int index) {
    switch (index) {
      case 0:
        return '3-5 push-ups';
      case 1:
        return '5-10 push-ups';
      case 2:
        return 'Atleast 10 ';
      default:
        return '';
    }
  }

}