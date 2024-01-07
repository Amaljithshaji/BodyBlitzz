
import 'package:bodyblitz/models/database.dart';
import 'package:bodyblitz/utills/Database/FImageDatabase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../Workout/workout.dart';

class Workouts extends StatefulWidget {
  const Workouts({
    super.key,required this.Level,required this.length,required this.workoutlevel,required this.images
  });
  final String Level;
  
  final List<String> workoutlevel;
  final List<String> images;
  final int length;

  @override
  State<Workouts> createState() => _WorkoutsState();
}

class _WorkoutsState extends State<Workouts> {
  @override
 

 
  Widget build(BuildContext context) {
   List workoutlist =[
  DataBase.abs,
  DataBase.chest,
  DataBase.arm,
  DataBase.leg,
  DataBase.shoulder,
  ];
  
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(widget.Level,
                style: GoogleFonts.aDLaMDisplay(fontSize: 20)),
          ),
            SizedBox(
      height: 10,
    ),
    Container(
      width: double.infinity,
      height: 35.h,
      child: ListView.builder(
        itemCount: widget.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: ()  {
       Navigator.push(context, MaterialPageRoute(builder: (context) => Workout_Screen(Workoutlist:workoutlist[index],barimage: widget.images[index],title: widget.workoutlevel[index],),));
            },
            
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                  image: DecorationImage(image: AssetImage(widget.images[index]),fit: BoxFit.fitHeight)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,bottom: 20),
                        child: Text(widget.workoutlevel[index],style: GoogleFonts.aDLaMDisplay(fontSize: 20,color: Colors.white)),
                      ),
                    ],
                  ),
                  // child: ClipRRect(
                  //    borderRadius: BorderRadius.circular(10),
                  //    child: BlurHash(hash: 'LCF-Ha039v=^01~9D+NH?FR+e.R*',
                  //    image: 'assets/img/six-abs.jpg',),
                  // ),
                 
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
//  child: Stack(children: [
//                     Container(
//                       height: 300,
//                       child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(10),
//                                   child: Image.asset('assets/img/six-abs.jpg',fit: BoxFit.cover,),
//                                 ),
//                     ),
            
//                     Positioned(bottom: 40,left: 20,
//                       child: Text(workoutlevel[index],style: GoogleFonts.aDLaMDisplay(fontSize: 20,color: Colors.white)),),
//                        Positioned(bottom: 20,left: 20,
//                       child: Text('20 MiNS : 16 EXERCISES',style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.normal)),)
//                   ]),