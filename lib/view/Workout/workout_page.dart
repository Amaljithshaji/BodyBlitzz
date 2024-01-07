import 'package:audioplayers/audioplayers.dart';
import 'package:bodyblitz/utills/constant/colors_constant/colors_const.dart';
import 'package:bodyblitz/view/Workout/Rest_Screen.dart';
import 'package:bodyblitz/view/Workout/workdone.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:bodyblitz/controller/home.controller.dart';
import 'package:sizer/sizer.dart';

class Workout_page extends StatefulWidget {
  const Workout_page(
      {super.key,
      required this.duration,
      required this.workdemo,
      required this.workoutName,
      required this.count});
  final int duration;
  final String workdemo;
  final String workoutName;
  final int count;
  @override
  State<Workout_page> createState() => _Workout_pageState();
}

class _Workout_pageState extends State<Workout_page> {
  late Duration _countdownDuration;
  late Duration _initialDuration;
  late bool _timerRunning;
  late WorkoutController controller;

  @override
  void initState() {
    super.initState();
    
    playAudioFromUrl();
    Timer(Duration(seconds: 2), () { 
      AudioPlayer().stop();
    });
    controller = Provider.of<WorkoutController>(context, listen: false);
    _initialDuration = Duration(seconds: widget.duration);
    _countdownDuration = _initialDuration; // Initial duration is 1 minute
    _timerRunning = true;
    widget.duration == 0 ? _stopcountdown() : _startCountdown();
  }

Future<void>  playAudioFromUrl() async {
    await AudioPlayer().play(AssetSource("audio/referee-whistle-blow-gymnasium-6320.mp3"));
    
  }
  void _startCountdown() {
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_countdownDuration.inSeconds == 0) {
          timer.cancel();
          controller.workout_count == controller.workouts.length - 1
              ? {_navigateToNextworkdone(), controller.resetCounter(),controller.exerise()
              }
              : {_navigateToNextPage(),controller.exerise()};
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
          builder: (context) => Rest_Screen(
                counter: 0,
              )),
    );
  }

  void _navigateToNextworkdone() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Work_done()),
    );
  }

  void _resumeCountdown() {
    setState(() {
      _timerRunning = true;
    });
  }

  void _pauseCountdown() {
    setState(() {
      _timerRunning = false;
    });
  }

  void _resetCountdown() {
    setState(() {
      _countdownDuration = _initialDuration;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final controller = Provider.of<WorkoutController>(context);
    int minutes = _countdownDuration.inMinutes;
    int seconds = _countdownDuration.inSeconds % 60;
  
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              // _showQuitmodel();
              Navigator.pop(context);
              _pauseCountdown();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.primary,
            )),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: <Widget>[
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 35.h,
                // color: Colors.red,
                child: Lottie.asset(widget.workdemo,fit: BoxFit.fill),
              ),
              SizedBox(
                height: 3.h,
              ),
              Center(
                child: Container(
                  width: 80.w,
                  height: 15.h,
                  child: Center(
                    child: Text(
                      widget.workoutName,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aDLaMDisplay(fontSize: 26),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              if (widget.duration == 0)
                Text('${widget.count}x', style: GoogleFonts.basic(fontSize: 40))
              else
                Text(
                    '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                    style: GoogleFonts.basic(fontSize: 40))
            ],
          ),
          SizedBox(height: 4.h),
          if (widget.duration == 0)
            GestureDetector(
              onTap: () {
                controller.workout_count == controller.workouts.length - 1
                    ? {_navigateToNextworkdone(), controller.resetCounter(),controller.exerise()
                     }
                    : {_navigateToNextPage(),controller.exerise()};
              },
              child: Container(
                width: 250,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color_const.myButton),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DONE',
                      style: GoogleFonts.aDLaMDisplay(
                          fontSize: 28, color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 36,
                    ),
                  ],
                )),
              ),
            )
          else
            GestureDetector(
              onTap: () {
                _pauseCountdown();
                _showmodel();
              },
              child: Container(
                width: 250,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color_const.myButton),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.pause,
                      color: Colors.white,
                      size: 36,
                    ),
                    Text(
                      'PAUSE',
                      style: GoogleFonts.aDLaMDisplay(
                          fontSize: 28, color: Colors.white),
                    ),
                  ],
                )),
              ),
            ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.workout_count == 0
                        ? null
                        : Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Rest_Screen(
                                counter: 1,
                              ),
                            ));
                    controller.workout_count == 0 ? null : _pauseCountdown();
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 80,
                    
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
             
                        children: [
                         
                          Icon(
                            Icons.skip_previous_outlined,
                            size: 35,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          Text('Prev', style: TextStyle(fontSize: 20))
                        ],
                      )),
                ),
               
                GestureDetector(
                  onTap: () {
                    _stopcountdown();
                    _pauseCountdown();
                    controller.workout_count == controller.workouts.length - 1
                        ? {_navigateToNextworkdone(), controller.resetCounter(),
                        }
                        : _navigateToNextPage();
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 80,
                       
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Skip', style: TextStyle(fontSize: 20)),
                          Icon(
                            Icons.skip_next_outlined,
                            size: 35,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                         
                        ],
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showmodel() {
    showModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.pause,
                    color: const Color.fromARGB(255, 9, 9, 9),
                    size: 36,
                  ),
                  Text(
                    'Paused',
                    style: GoogleFonts.aDLaMDisplay(fontSize: 24),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              GestureDetector(
                onTap: () {
                  _resetCountdown();
                  Navigator.pop(context);
                  //_controller.start();
                },
                child: Container(
                  width: 270,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color_const.myButton),
                  child: Center(
                    child: Text(
                      'Restart this Exercise',
                      style: GoogleFonts.aDLaMDisplay(
                          fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              GestureDetector(
                onTap: () {
                  _showQuitmodel();
                },
                child: Container(
                  width: 270,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color_const.myButton),
                  child: Center(
                      child: Text(
                    'Quit',
                    style: GoogleFonts.aDLaMDisplay(
                        fontSize: 24, color: Colors.white),
                  )),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              GestureDetector(
                onTap: () {
                  _resumeCountdown();
                  Navigator.pop(context);
                },
                child: Container(
                  width: 270,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color_const.myButton),
                  child: Center(
                    child: Text(
                      'Resume',
                      style: GoogleFonts.aDLaMDisplay(
                          fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showQuitmodel() {
    showModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '🙄',
                style: GoogleFonts.aDLaMDisplay(
                  fontSize: 50,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Center(
                child: Container(
                    child: Text('Are you Sure you want to Quit Exercise?',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.aDLaMDisplay(
                          fontSize: 24,
                        ))),
              ),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {
                  controller.resetCounter();
                  Navigator.pop(context);
                },
                child: Container(
                  width: 270,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color_const.myButton),
                  child: Center(
                      child: Text(
                    'Quit',
                    style: GoogleFonts.aDLaMDisplay(
                        fontSize: 24, color: Colors.white),
                  )),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {
                  _resumeCountdown();
                  Navigator.pop(context);
                },
                child: Container(
                  width: 270,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color_const.myButton),
                  child: Center(
                    child: Text(
                      'Close',
                      style: GoogleFonts.aDLaMDisplay(
                          fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
