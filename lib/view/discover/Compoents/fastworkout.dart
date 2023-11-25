import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      height: 10,
    ),
    Container(
    //color: Colors.amber,
      height: 810,
      child: ListView.builder(
        itemCount: 6,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
    width: 200,
    height: 120,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 130,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset('assets/img/p4.jpg',fit: BoxFit.fill,),
                          ),
              
            ),SizedBox(width: 10,),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40
                  ),
                  child: Text('4 MIN Tabata',style: GoogleFonts.aDLaMDisplay(fontSize: 20),),
                ),
                SizedBox(height: 10,),
                Text('4 min . Beginner',style: TextStyle(fontSize: 14,color: Colors.grey.shade700),),
                SizedBox(height: 20,),
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