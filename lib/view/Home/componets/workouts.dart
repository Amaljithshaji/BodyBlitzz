
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../Workout/workout.dart';

class Workouts extends StatelessWidget {
  const Workouts({
    super.key,required this.Level
  });
  final String Level;
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(Level,
                style: GoogleFonts.aDLaMDisplay(fontSize: 20)),
          ),
            SizedBox(
      height: 10,
    ),
    Container(
      width: double.infinity,
      height: 35.h,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: ()  {
 Navigator.push(context, MaterialPageRoute(builder: (context) => Workout_Screen(),));
            },
            
            child: Container(
              width: 25.h,
              height: 10.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue),
                  child: Stack(children: [
                    Container(
                      height: 300,
                      child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset('assets/img/six-abs.jpg',fit: BoxFit.cover,),
                                ),
                    ),
            
                    Positioned(bottom: 40,left: 20,
                      child: Text('ABS BEGINNER',style: GoogleFonts.aDLaMDisplay(fontSize: 20,color: Colors.white)),),
                       Positioned(bottom: 20,left: 20,
                      child: Text('20 MiNS : 16 EXERCISES',style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.normal)),)
                  ]),
            ),
          ),
        ),
      ),
    )
        ],
      ),
    );
  }
}