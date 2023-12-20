
import 'package:bodyblitz/models/database.dart';
import 'package:bodyblitz/utills/Database/FImageDatabase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../Workout/workout.dart';

class Workouts extends StatelessWidget {
  const Workouts({
    super.key,required this.Level,required this.length,required this.workoutlevel,required this.images
  });
  final String Level;
  
  final List<String> workoutlevel;
  final List<String> images;
  final int length;
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
        itemCount: length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: ()  {
       Navigator.push(context, MaterialPageRoute(builder: (context) => Workout_Screen(Workoutlist: DataBase.Workoutitems1,),));
            },
            
            child: Container(
              width: 30.h,
              height: 10.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                  image: DecorationImage(image: AssetImage(images[index]),fit: BoxFit.fitHeight)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,bottom: 20),
                        child: Text(workoutlevel[index],style: GoogleFonts.aDLaMDisplay(fontSize: 20,color: Colors.white)),
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