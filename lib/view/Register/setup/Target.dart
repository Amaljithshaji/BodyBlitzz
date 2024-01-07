import 'package:bodyblitz/controller/home.controller.dart';
import 'package:bodyblitz/utills/constant/colors_constant/colors_const.dart';
import 'package:bodyblitz/view/Register/setup/start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../bottomNavigation/Bottomnavigator.dart';
import 'height&weight.dart';

class Target extends StatefulWidget {
  const Target({super.key});

  @override
  State<Target> createState() => _TargetState();
}

class _TargetState extends State<Target> {
   
    RulerPickerController? _rulerPickerController1;

   
    num currentValue1 = 50;

  
    List<RulerRange> ranges1 = const [
      RulerRange(begin: 0, end: 249, scale: 1),
    ];

    @override
  void initState() {
    
    _rulerPickerController1 = RulerPickerController(value: currentValue1);
       
    super.initState();
  }
   
  @override
  Widget build(BuildContext context) {
    var addcontroll = Provider.of<WorkoutController>(context);
    addcontroll.loadData();
    return Scaffold(
       appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Weight(),
                  ));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color_const.myButton,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Bottom_Naviagator(),));
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(color: Color_const.myButton, fontSize: 16),
                    ))),
          )
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        SizedBox(height: 2.h,),
         Center(
              child: Container(
                  width: 350,
                  child: Text(
                    "Let us Know you better",
                    style: GoogleFonts.aDLaMDisplay(
                      fontSize: 28,
                    ),
                    textAlign: TextAlign.center,
                  ))),
          SizedBox(
            height: 6.h,
          ),
          
                
                SizedBox(height: 3.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Target Weight',
                        style: GoogleFonts.aDLaMDisplay(fontSize: 38),
                      ),
                      Container(
                        width: 60,
                        height: 5.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color_const.myButton,
                        ),
                        child: Center(
                            child: Text('KG',
                                style: GoogleFonts.aDLaMDisplay(fontSize: 24,color: Colors.white))),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 3.h,),
                RulerPicker(
                  rulerBackgroundColor: Colors.transparent,
                  controller: _rulerPickerController1,
                  onBuildRulerScaleText: (index, value) {
                    return value.toInt().toString();
                  },
                  ranges: ranges1,

                 scaleLineStyleList: const [
                    ScaleLineStyle(
                        color: Colors.grey, width: 1.5, height: 90, scale: 0),
                    ScaleLineStyle(
                        color: Colors.grey, width: 1, height: 60, scale: 5),
                    ScaleLineStyle(
                        color: Colors.grey, width: 1, height: 35, scale: -1)
                  ],

                  onValueChanged: (value) {
                    setState(() {
                      currentValue1 = value;
                    });
                  },
                  width: MediaQuery.of(context).size.width,
                  height: 16.h,
                  rulerMarginTop: 6,
                  // marker: Container(
                  //     width: 8,
                  //     height: 50,
                  //     decoration: BoxDecoration(
                  //         color: Colors.red.withAlpha(100),
                  //         borderRadius: BorderRadius.circular(5))),
                ),
                Text(
                  '${currentValue1.toStringAsFixed(0)} KG',
                  style: GoogleFonts.aDLaMDisplay(
                      fontSize: 38),
                ),
                
                
                     SizedBox(height: 7.h,),
                 InkWell(
              onTap: ()async{
                final target =  currentValue1.toStringAsFixed(0);
                
                
              await  addcontroll.setData('Target',target );
                 print(addcontroll.getValues['height']);
                 print(addcontroll.getValues['weight']);

               Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Start_Screen(),) );
              },
              child: Container(
               width: 75.w,
                height: 6.h,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Color_const.myButton),
                child: Center(child: Text('NEXT',style: GoogleFonts.aDLaMDisplay(fontSize: 28,color: Color_const.myWhite),),),
              ),
            )
      ]),
    );
  }
}