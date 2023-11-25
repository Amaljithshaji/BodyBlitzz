
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
              height: 500,
              child: Column(
                children: [
                  Image.asset('assets/img/Reg_logo.png'),
                   Container(
              width: 350,
              child: Text(
                'You are all set now, let’s reach your goals together with us',
                style: GoogleFonts.aDLaMDisplay(fontSize: 24),
                textAlign: TextAlign.center,
              )),
                ],
              )),
          
          SizedBox(
            height: 200,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Bottom_Naviagator(),
                  ));
            },
            child: Container(
              width: 350,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color_const.myButton),
              child: Center(
                child: Text(
                  'let’s Start',
                  style: GoogleFonts.aDLaMDisplay(fontSize: 28),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
