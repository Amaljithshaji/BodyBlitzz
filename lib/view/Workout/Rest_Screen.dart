import 'package:bodyblitz/controller/home.controller.dart';
import 'package:bodyblitz/utills/constant/colors_constant/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'dart:async';


import 'workout_page.dart';

class Rest_Screen extends StatefulWidget {
  const Rest_Screen({super.key, required this.counter});
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
    controller = Provider.of<WorkoutController>(context, listen: false);
    String _rest = controller.getValues['Rest'].toString();
    int _duration =int.parse(_rest);
    _countdownDuration = Duration(seconds: _duration); // Initial duration is 1 minute
    _timerRunning = true;
    _startCountdown();
  }

  void _startCountdown() {
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

  void _stopcountdown() {
    const oneSecs = const Duration(seconds: 1);
    Timer.periodic(oneSecs, (timer) {
      timer.cancel();
    });
  }

  void _navigateToNextPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => Workout_page(
                duration:
                    controller.workouts[controller.workout_count].duration,
                workdemo:
                    controller.workouts[controller.workout_count].workoutDemo,
                workoutName:
                    controller.workouts[controller.workout_count].workoutName,
                count: controller.workouts[controller.workout_count].count,
              )),
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Center(
                    child: Text(
                  'Rest',
                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 48),
                )),
                Text(
                    '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _increaseDuration();
                      },
                      child: Container(
                        width: 130,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: Center(
                            child: Text(
                          '+20s',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.counter == 0
                            ? controller.addcount()
                            : controller.subcount();
                        print(controller.workout_count);
                        _stopcountdown();
                        _pauseCountdown();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Workout_page(
                                duration:
                                    workoutz[controller.workout_count].duration,
                                workdemo: workoutz[controller.workout_count]
                                    .workoutDemo,
                                workoutName: workoutz[controller.workout_count]
                                    .workoutName,
                                count: workoutz[controller.workout_count].count,
                              ),
                            ));
                      },
                      child: Container(
                        width: 130,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color_const.myButton,
                        ),
                        child: Center(
                            child: Text(
                          'Skip',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Next',
                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 36),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Center(
                  child: Container(
                    width: 350,
                    height: 15.h,
                    child: Center(
                      child: Text(
                        widget.counter == 0
                            ? workoutz[controller.workout_count + 1].workoutName
                            : workoutz[controller.workout_count - 1]
                                .workoutName,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 30),
                      ),
                    ),
                  ),
                )
              ],
            ),
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
  //               style: GoogleFonts.roboto(fontWeight: FontWeight.bold,
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
  //                       style: GoogleFonts.roboto(fontWeight: FontWeight.bold,
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
  //                   style: GoogleFonts.roboto(fontWeight: FontWeight.bold,
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
  //                     style: GoogleFonts.roboto(fontWeight: FontWeight.bold,
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
