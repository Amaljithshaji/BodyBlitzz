import 'package:bodyblitz/utills/constant/colors_constant/colors_const.dart';
import 'package:bodyblitz/view/Workout/Rest_Screen.dart';
import 'package:bodyblitz/view/Workout/workdone.dart';
import 'package:bodyblitz/view/Workout/workout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

class Workout_page extends StatefulWidget {
  const Workout_page({super.key});

  @override
  State<Workout_page> createState() => _Workout_pageState();
}

class _Workout_pageState extends State<Workout_page> {
  late Duration _countdownDuration;
  late Duration _initialDuration;
  late bool _timerRunning;

  @override
  void initState() {
    super.initState();
    _initialDuration = Duration(seconds: 30);
    _countdownDuration = _initialDuration; // Initial duration is 1 minute
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
          _navigateToNextPage();
        } else if (_timerRunning) {
          setState(() {
            _countdownDuration = _countdownDuration - oneSec;
          });
        }
      },
    );
  }

  void _navigateToNextPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Rest_Screen()),
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
    int minutes = _countdownDuration.inMinutes;
    int seconds = _countdownDuration.inSeconds % 60;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              _showQuitmodel();
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
                height: 400,
                // color: Colors.red,
                child: Lottie.asset('assets/img/man-doing-diagonal-mountain-climbers-exercise-8574469-6770290.mp4.lottie.json'),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Jumping Jacks',
                style: GoogleFonts.aDLaMDisplay(fontSize: 28),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                  '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                  style: GoogleFonts.basic(fontSize: 48))
            ],
          ),
          SizedBox(height: 40),
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
            height: 10,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Work_done()));
                  _pauseCountdown();
                },
                child: Container(
                    width: 200,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.skip_previous_outlined,
                          size: 35,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Text('Previous', style: TextStyle(fontSize: 20))
                      ],
                    )),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  _pauseCountdown();
                  Navigator.pushReplacement(
                      context,
                      
                      MaterialPageRoute(
                        builder: (context) => Rest_Screen(),
                      ));
                },
                child: Container(
                    width: 200,
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
                        SizedBox(
                          width: 20,
                        )
                      ],
                    )),
              ),
            ],
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
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          height: 350,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              SizedBox(
                height: 30,
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
                height: 30,
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
                height: 30,
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
                height: 30,
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
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          height: 350,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
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
                height: 10,
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
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Workout_Screen(),
                      ));
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
                height: 20,
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
