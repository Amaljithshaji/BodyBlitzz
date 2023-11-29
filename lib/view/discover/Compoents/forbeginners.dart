import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Forbeginners extends StatelessWidget {
  const Forbeginners({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Text('For Beginners',
        style: GoogleFonts.aDLaMDisplay(fontSize: 24)),
          ),
    SizedBox(
      height: 1.h,
    ),
    Container(
      width: double.infinity,
      height: 30.h,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
    width: 26.h,
    height: 30.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue),
        child: Stack(children: [
          Container(height: 30.h,
            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset('assets/img/p5.jpg',fit: BoxFit.cover,),
                            ),
          ),
          Positioned(bottom: 25,left: 10,
            child: Text('ABS BEGINNER',style: GoogleFonts.aDLaMDisplay(fontSize: 18,color: Colors.white)),),
             Positioned(bottom: 10,left: 10,
            child: Text('20 MiNS : 16 EXERCISES',style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.normal)),)
        ]),
          ),
        ),
      ),
    )
    ]);
  }
}