import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Fastworkout extends StatelessWidget {
  const Fastworkout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Text('Fast workout',
        style: GoogleFonts.aDLaMDisplay(fontSize: 24)),
          ),
    SizedBox(
      height: 1.h,
    ),
    Container(
    //color: Colors.amber,
      height: 100.h,
      child: ListView.builder(
        itemCount: 6,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 10),
          child: Container(
    width: 20.w,
    height: 15.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 25.w,
              height: 12.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset('assets/img/p4.jpg',fit: BoxFit.fill,),
                          ),
              
            ),
            SizedBox(width: 5.w,),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top:30
                  ),
                  child: Text('4 MIN Tabata',style: GoogleFonts.aDLaMDisplay(fontSize: 20),),
                ),
                SizedBox(height: 1.h,),
                Text('4 min . Beginner',style: TextStyle(fontSize: 14,color: Colors.grey.shade700),),
                SizedBox(height: 2.h,),
                Container(width: 250,
                height: 1,color: Theme.of(context).colorScheme.primary,)
              ],
            )
          ],
        )
          ),
        ),
      ),
    )
    ]);
  }
}