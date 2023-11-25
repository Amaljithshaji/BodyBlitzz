import 'package:bodyblitz/utills/constant/colors_constant/colors_const.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'componets/workouts.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  

  @override
  Widget build(BuildContext context) {
    DateTime? _selectedDate;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
              child: Text(
            'WORKOUT',
            style: GoogleFonts.aDLaMDisplay(fontSize: 28),
          )),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 788,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(width: 400,
                  height: 150,
                 
                    child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('WEEK GOAL',style: GoogleFonts.aDLaMDisplay(fontSize: 16),),
                        ),
                        CalendarTimeline(
                          showYears: false,
                          shrink: false,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now().subtract(const Duration(days: 0)),
                          lastDate: DateTime.now().add(const Duration(days: 7)),
                          onDateSelected: (date) =>
                              setState(() => _selectedDate = date),
                          leftMargin: 20,
                          monthColor: Colors.transparent,
                          dayColor: Colors.white,
                          dayNameColor: const Color(0xFF333A47),
                          activeDayColor: Colors.white,
                          activeBackgroundDayColor: Color_const.myButton,
                          dotsColor: const Color(0xFF333A47),
                         // selectableDayPredicate: (date) => date.day != 23,
                          locale: 'en',
                        ),
                      ],
                    ),
                  ),
                  Workouts(Level: 'BEGINER',),
                  SizedBox(
                    height: 10,
                  ),
                  Workouts(Level: 'INTERMEDIATE',),
                  SizedBox(
                    height: 10,
                  ),
                  Workouts(Level: 'ADVANCED',),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
