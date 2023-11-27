import 'package:bodyblitz/utills/constant/colors_constant/colors_const.dart';
import 'package:bodyblitz/view/Workout/Sample.dart';
import 'package:bodyblitz/view/Workout/workout.dart';
//import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'workdone.dart';
import 'workout_page.dart';

class Rest_Screen extends StatefulWidget {
  const Rest_Screen({super.key});

  @override
  State<Rest_Screen> createState() => _Rest_ScreenState();
}

class _Rest_ScreenState extends State<Rest_Screen> {
 late Duration _countdownDuration;
  late bool _timerRunning;

  @override
  void initState() {
    super.initState();
    _countdownDuration = Duration(seconds: 30); // Initial duration is 1 minute
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
     MaterialPageRoute(builder: (context) => Workout_page()),
    );
  }

  void _increaseDuration() {
    setState(() {
      _countdownDuration += Duration(seconds: 20);
    });
  }
 Widget build(BuildContext context) {
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Sample(),));
                            
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
                     Text(
                    'Mountain Climber',
                    style: GoogleFonts.aDLaMDisplay(fontSize: 30),
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