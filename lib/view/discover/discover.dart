import 'package:bodyblitz/view/discover/Compoents/fastworkout.dart';
import 'package:bodyblitz/view/discover/Compoents/stretch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Compoents/forbeginners.dart';

class Discover_Screen extends StatefulWidget {
  const Discover_Screen({super.key});

  @override
  State<Discover_Screen> createState() => _Discover_ScreenState();
}

class _Discover_ScreenState extends State<Discover_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          SizedBox(height: 50,),
          Text('DISCOVER',style: GoogleFonts.aDLaMDisplay(fontSize: 28),),
          SizedBox(height: 10,),
         Container(
          width: double.infinity,
          height: 777,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Forbeginners(),
                Fastworkout(),
                Stretch()
                
              ],
            ),
          ),
         )

        ],
      ),
    );
  }
}

