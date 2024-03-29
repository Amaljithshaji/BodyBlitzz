import 'package:bodyblitz/controller/home.controller.dart';
import 'package:bodyblitz/models/database.dart';
import 'package:bodyblitz/utills/Database/Database1.dart';
import 'package:bodyblitz/utills/constant/colors_constant/colors_const.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../utills/Database/FImageDatabase.dart';
import '../../utills/Database/MImageDatabase.dart';
import 'componets/workouts.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  var imagedata;
 
  @override
  Widget build(BuildContext context) {
    var addcontroll = Provider.of<WorkoutController>(context);
    addcontroll.loadData();
    DateTime? _selectedDate;
   if(addcontroll.getValues['gender'] == 'Male'){
     imagedata = MImageDatabase();
   }else {
    imagedata = FImageDatabase();
   } 
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(width: 1,),
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
              'WORKOUT',
              style: GoogleFonts.aDLaMDisplay(fontSize: 28),
              
            ),
            centerTitle: true,
            elevation: 0,
      ),
      
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Container(width: 400,
                
                height: 15.h,
               
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10),
                      //   child: Text('WEEK GOAL',style: GoogleFonts.aDLaMDisplay(fontSize: 16),),
                      // ),
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
                        dayColor: Theme.of(context).colorScheme.primary,
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
                Workouts(Level: 'BEGINER',workoutlevel: Database1().beginner,length: Database1().beginner.length,images: imagedata.BegImagedata),
                SizedBox(
                  height: 1.h,
                ),
                Workouts(Level: 'INTERMEDIATE',workoutlevel: Database1().intermediate,length: Database1().intermediate.length,images: imagedata.InterImagedata),
                SizedBox(
                  height: 1.h,
                ),
                Workouts(Level: 'ADVANCED',workoutlevel: Database1().advanced,length: Database1().advanced.length,images: imagedata.AdvImagedata),
                SizedBox(height: 10.h,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
