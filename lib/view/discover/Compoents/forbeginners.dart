import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      height: 10,
    ),
    Container(
      width: double.infinity,
      height: 200,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
    width: 200,
    height: 100,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue),
        child: Stack(children: [
          Container(height: 300,
            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset('assets/img/p5.jpg',fit: BoxFit.cover,),
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
    )
    ]);
  }
}