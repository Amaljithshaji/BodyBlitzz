import 'dart:async';

import 'package:bodyblitz/controller/home.controller.dart';
import 'package:bodyblitz/view/Workout/workout_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'components/Workout_Timer.dart';

class Workout_Starter extends StatefulWidget {
  const Workout_Starter({super.key});

  @override
  State<Workout_Starter> createState() => _Workout_StarterState();
}

class _Workout_StarterState extends State<Workout_Starter> {
   late WorkoutController controller;
  @override
  void initState() {
   controller =Provider.of<WorkoutController>(context, listen: false);
    Timer(Duration(seconds: 15), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Workout_page(duration: controller.workouts[controller.workout_count].duration,
                          workdemo: controller.workouts[controller.workout_count].workoutDemo,
                          workoutName: controller.workouts[controller.workout_count].workoutName,
                          count: controller.workouts[controller.workout_count].count,),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<WorkoutController>(context);
      var workoutz = Provider.of<WorkoutController>(context).workouts;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.primary,
            )),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 40.h,
            color: Colors.transparent,
            child: Lottie.asset(controller.workouts[0].workoutDemo,fit: BoxFit.fill),
          ),
          SizedBox(
            height: 18,
          ),
          Text(
            'Ready to GO',
            style: GoogleFonts.aDLaMDisplay(fontSize: 28),
          ),
          Text(
            'Jumping Jacks',
            style: GoogleFonts.aDLaMDisplay(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 140, right: 30),
                  child: Workout_Timer(),
                ),
                IconButton(
                  onPressed: () {
                   
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Workout_page(duration: workoutz[controller.workout_count].duration,
                          workdemo: workoutz[controller.workout_count].workoutDemo,
                          workoutName: workoutz[controller.workout_count].workoutName,
                          count: workoutz[controller.workout_count].count,
                          ),
                        ));
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
