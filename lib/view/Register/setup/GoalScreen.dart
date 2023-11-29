import 'package:bodyblitz/view/Register/setup/Filtter_Screen.dart';
import 'package:bodyblitz/view/Register/setup/pushup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';


import '../../../utills/constant/colors_constant/colors_const.dart';
import '../../bottomNavigation/Bottomnavigator.dart';

class Goal_Screen extends StatefulWidget {
  const Goal_Screen({super.key});

  @override
  State<Goal_Screen> createState() => _Goal_ScreenState();
}

class _Goal_ScreenState extends State<Goal_Screen> {
  
  List<Color> _containerColors = List.filled(5, Colors.transparent); // Initialize all containers to red

  void _changeColor(int index) {
    setState(() {
      // Change the color of the pressed container to blue, others to red
      _containerColors = List.generate(5, (i) => (i == index) ? Color_const.myButton : Colors.transparent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Filtter_Screen(),
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
                  width: 300,
                  child: Text(
                    'What are your main goals ?',
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
                        child: Center(child: Text(_getBodyPartText(i),style: GoogleFonts.aDLaMDisplay(fontSize: 28),)),
              ),
            ),
          ),
           SizedBox(height: 4.h,),
          GestureDetector(
            onTap: (){
             Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => PushUp(),) );
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
        return 'Lose Weigth';
      case 1:
        return 'Build muscle';
      case 2:
        return 'Keep fit';
      default:
        return '';
    }
  }
}
