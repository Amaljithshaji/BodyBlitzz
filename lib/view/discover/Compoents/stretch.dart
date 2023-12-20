import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Stretch extends StatelessWidget {
  const Stretch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text('Stretch', style: GoogleFonts.aDLaMDisplay(fontSize: 20)),
      ),
    
      Container(
          width: 450,
          height: 120.h,
          //color: Colors.red,
          child: GridView.builder(
         itemCount: 10,
            shrinkWrap: false,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,crossAxisSpacing:0,mainAxisSpacing: 0 ,childAspectRatio: 1),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 200,
                height: 5.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), ),
                    child: Column(
                      children: [
                        Container(
                          width: 200,
                          height: 130,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset('assets/img/advanced abs.jpg'),
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 59,
                          //color: Colors.amber,
                          child: Center(child: Text('Full body stretching',style: GoogleFonts.aDLaMDisplay(fontSize: 18),)),
                        )
                      ],
                    ),
              ),
            ),
          ))
    ]);
  }
}
