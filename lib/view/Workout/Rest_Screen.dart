import 'package:bodyblitz/controller/home.controller.dart';
import 'package:bodyblitz/utills/constant/colors_constant/colors_const.dart';
import 'package:bodyblitz/view/Workout/Sample.dart';
import 'package:bodyblitz/view/Workout/workout.dart';
//import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'workdone.dart';
import 'workout_page.dart';

class Rest_Screen extends StatefulWidget {
  const Rest_Screen({super.key,required this.counter});
  final int counter;
 

  @override
  State<Rest_Screen> createState() => _Rest_ScreenState();
}

class _Rest_ScreenState extends State<Rest_Screen> {
 late Duration _countdownDuration;
  late bool _timerRunning;
  late WorkoutController controller;
  @override
  void initState() {
    super.initState();
    controller =Provider.of<WorkoutController>(context, listen: false);
    _countdownDuration = Duration(seconds: 10); // Initial duration is 1 minute
    _timerRunning = true;
    _startCountdown();
  }

  void _startCountdown( ) {
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_countdownDuration.inSeconds == 0) {
          timer.cancel();
          widget.counter == 0 ? controller.addcount() : controller.subcount();
          print(controller.workout_count);
          _navigateToNextPage();
        } else if (_timerRunning) {
          setState(() {
            _countdownDuration = _countdownDuration - oneSec;
          });
        }
      },
    );
  }
  void _stopcountdown(){
     const oneSecs = const Duration(seconds: 1);
    Timer.periodic(oneSecs, (timer) {
     timer.cancel();
     });
  }
  void _navigateToNextPage() {
    Navigator.pushReplacement(
      context,
     MaterialPageRoute(builder: (context) => Workout_page(duration: controller.workouts[controller.workout_count].duration,
                          workdemo: controller.workouts[controller.workout_count].workoutDemo,
                          workoutName: controller.workouts[controller.workout_count].workoutName,
                          count: controller.workouts[controller.workout_count].count,)),
    );
  }
   void _pauseCountdown() {
    setState(() {
      _timerRunning = false;
    });
  }

  void _increaseDuration() {
    setState(() {
      _countdownDuration += Duration(seconds: 20);
    });
  }
 Widget build(BuildContext context) {
  final controller = Provider.of<WorkoutController>(context);
      var workoutz = Provider.of<WorkoutController>(context).workouts;
   int minutes = _countdownDuration.inMinutes;
    int seconds = _countdownDuration.inSeconds % 60;
    return   SafeArea(
      child: Scaffold(
        
        backgroundColor: Theme.of(context).colorScheme.background,
         
        body:
        Column(
          children: <Widget>[
            Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            
              children: [
               SizedBox(height: 300,),
                Center(
                  child: Text(
                    'Rest',
                    style: GoogleFonts.aDLaMDisplay(fontSize: 48),
                  )
                ),
                Text( '${minutes.toString().padLeft(2,'0')}:${seconds.toString().padLeft(2, '0')}',
                    style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold)),
                    SizedBox(height: 30,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       GestureDetector(onTap: (){
                        _increaseDuration();
                       },
                         child: Container(
                          width: 130,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),color: Theme.of(context).colorScheme.primary,
                          ),
                          child: Center(child: Text('+20s',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                         ),
                       ),
                        GestureDetector(onTap: (){
                         widget.counter == 0 ? controller.addcount() : controller.subcount();
                          print(controller.workout_count);
                          _stopcountdown();
                          _pauseCountdown();
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
                          child: Container(
                          width: 130,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),color: Color_const.myButton,
                          ),
                          child: Center(child: Text('Skip',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                                     ),
                        )
                    ],),
                    SizedBox(height: 50,),
                     Text(
                    'Next',
                    style: GoogleFonts.aDLaMDisplay(fontSize: 36),
                  ),
                   SizedBox(height: 20,),
                     Center(
                       child: Container(
                        width: 350,
                        height: 150,
                         child: Center(
                           child: Text(
                                        widget.counter == 0 ? workoutz[controller.workout_count + 1].workoutName : workoutz[controller.workout_count - 1].workoutName ,
                                              textAlign: TextAlign.center,
                                               style: GoogleFonts.aDLaMDisplay(fontSize: 30),
                                             ),
                         ),
                       ),
                     )
              ],
            ),
            SizedBox(height: 50),
          
          ],
        ),
      ),
     );
    
    
  }
  
  //  _showQuitmodel() {
  //   showModalBottomSheet(
  //     isDismissible: false,
  //     enableDrag: false,
  //     shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(30), topRight: Radius.circular(30))),
  //     context: context,
  //     builder: (context) {
  //       return Container(
  //         width: double.infinity,
  //         height: 350,
  //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Text(
  //               '🙄',
  //               style: GoogleFonts.aDLaMDisplay(
  //                 fontSize: 50,
  //               ),
  //             ),
  //             SizedBox(
  //               height: 10,
  //             ),
  //             Center(
  //               child: Container(
  //                   child: Text('Are you Sure you want to Quit Exercise?',
  //                       textAlign: TextAlign.center,
  //                       style: GoogleFonts.aDLaMDisplay(
  //                         fontSize: 24,
  //                       ))),
  //             ),
  //             SizedBox(
  //               height: 20,
  //             ),
  //             GestureDetector(
  //               onTap: () {
  //                 Navigator.pushReplacement(
  //                     context,
  //                     MaterialPageRoute(
  //                       builder: (context) => Workout_Screen(),
  //                     ));
  //               },
  //               child: Container(
  //                 width: 270,
  //                 height: 60,
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(30),
  //                     color: Color_const.myButton),
  //                 child: Center(
  //                     child: Text(
  //                   'Quit',
  //                   style: GoogleFonts.aDLaMDisplay(
  //                       fontSize: 24, color: Colors.white),
  //                 )),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 20,
  //             ),
  //             GestureDetector(
  //               onTap: () {
                 
  //                 Navigator.pop(context);
  //               },
  //               child: Container(
  //                 width: 270,
  //                 height: 60,
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(30),
  //                     color: Color_const.myButton),
  //                 child: Center(
  //                   child: Text(
  //                     'Close',
  //                     style: GoogleFonts.aDLaMDisplay(
  //                         fontSize: 24, color: Colors.white),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}