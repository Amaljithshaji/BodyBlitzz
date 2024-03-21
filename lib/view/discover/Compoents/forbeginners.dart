import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'Skleton1.dart';

class Forbeginners extends StatelessWidget {
  const Forbeginners({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
    width: MediaQuery.of(context).size.width*0.5,
    height: MediaQuery.of(context).size.height*0.3,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue),
        child: Stack(children: [
          Container(height: MediaQuery.of(context).size.height*0.3,
            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset('assets/img/advanced abs.jpg',fit: BoxFit.cover,),
                            ),
          ),
          Positioned(top: 120,left: 10,
            child: Container(
              width: MediaQuery.of(context).size.width*0.5,
              
              child: Text('Tittle',style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.normal)
              ))
              ,),
          Positioned(bottom: 25,left: 10,
            child: Container(
              width: MediaQuery.of(context).size.width*0.5,
              height: MediaQuery.of(context).size.height* 0.1,
              
              child: Text('ABS BEGINNER',style: GoogleFonts.aDLaMDisplay(fontSize: 18,color: Colors.white))),),
             Positioned(bottom: 10,left: 10,
            child: Container(
              width: MediaQuery.of(context).size.width*0.5,
              
              child: Text('20 MiNS : 16 EXERCISES',style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.normal)
              ))
              ,)
        ]),
          ),
        ),
        ),
      )
    ]);
  }
}


