import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../utills/constant/colors_constant/colors_const.dart';
import '../../bottomNavigation/Bottomnavigator.dart';

class Start_Screen extends StatefulWidget {
  const Start_Screen({super.key});

  @override
  State<Start_Screen> createState() => _Start_ScreenState();
}

class _Start_ScreenState extends State<Start_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/startBackground.jpg'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "BodyBlitz".toUpperCase(),
                      style: GoogleFonts.roboto(fontWeight: FontWeight.bold,
                          fontSize: 45, color: Color_const.myWhite),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      'Start your fitness journey with BODYBLITZ Now.',
                      style: GoogleFonts.roboto(fontWeight: FontWeight.bold,
                          fontSize: 20, color: Colors.white60),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Bottom_Naviagator(),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 80.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color_const.myButton),
                      child: Center(
                        child: Text(
                          'let’s Start',
                          style: GoogleFonts.roboto(fontWeight: FontWeight.bold,
                              fontSize: 28, color: Color_const.myWhite),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
