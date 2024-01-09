import 'package:bodyblitz/view/Register/setup/Target.dart';
//import 'package:bodyblitz/view/Register/setup/start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/home.controller.dart';
import '../../../utills/constant/colors_constant/colors_const.dart';
import '../../bottomNavigation/Bottomnavigator.dart';
import 'Filtter_Screen.dart';

class Weight extends StatefulWidget {
  const Weight({super.key});

  @override
  State<Weight> createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  RulerPickerController? _rulerPickerController;
    RulerPickerController? _rulerPickerController1;

    num currentValue = 50;
    num currentValue1 = 50;

    List<RulerRange> ranges = const [
      RulerRange(begin: 0, end: 249, scale: 1),
    ];
    List<RulerRange> ranges1 = const [
      RulerRange(begin: 0, end: 249, scale: 1),
    ];

    @override
  void initState() {
    _rulerPickerController = RulerPickerController(value: currentValue);
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
                    builder: (context) => Filtter_Screen(),
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
      body: Column(children: [
        SizedBox(height: 3.h,),
         Center(
              child: Container(
                  width: 350,
                  child: Text(
                    "Let us Know you better",
                    style: GoogleFonts.roboto(fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                    textAlign: TextAlign.center,
                  ))),
          SizedBox(
            height: 7.h,
          ),
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Height',
                        style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 28),
                      ),
                      Container(
                        width: 60,
                        height: 5.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color_const.myButton,
                        ),
                        child: Center(
                            child: Text('CM',
                                style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white))),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 3.h,),
                RulerPicker(
                  rulerBackgroundColor: Colors.transparent,
                  controller: _rulerPickerController,
                  onBuildRulerScaleText: (index, value) {
                    return value.toInt().toString();
                  },
                  ranges: ranges,

                  scaleLineStyleList: const [
                    ScaleLineStyle(
                        color: Colors.grey, width: 1.5, height: 60, scale: 0),
                    ScaleLineStyle(
                        color: Colors.grey, width: 1, height: 40, scale: 5),
                    ScaleLineStyle(
                        color: Colors.grey, width: 1, height: 25, scale: -1)
                  ],

                  onValueChanged: (value) {
                    setState(() {
                      currentValue = value;
                    });
                  },
                  width: MediaQuery.of(context).size.width,
                  height: 11.h,
                  rulerMarginTop: 6,
                  // marker: Container(
                  //     width: 8,
                  //     height: 50,
                  //     decoration: BoxDecoration(
                  //         color: Colors.red.withAlpha(100),
                  //         borderRadius: BorderRadius.circular(5))),
                ),
                Text(
                  '${currentValue.toStringAsFixed(0)} CM',
                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
                SizedBox(height: 3.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Weight',
                        style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 28),
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
                                style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white))),
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
                        color: Colors.grey, width: 1.5, height: 60, scale: 0),
                    ScaleLineStyle(
                        color: Colors.grey, width: 1, height: 40, scale: 5),
                    ScaleLineStyle(
                        color: Colors.grey, width: 1, height: 25, scale: -1)
                  ],

                  onValueChanged: (value) {
                    setState(() {
                      currentValue1 = value;
                    });
                  },
                  width: MediaQuery.of(context).size.width,
                  height: 11.h,
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
                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
                
                
                     SizedBox(height: 7.h,),
                 InkWell(
              onTap: ()async{
                final weight =  currentValue1.toStringAsFixed(0);
                final height =  currentValue.toStringAsFixed(0);
               await addcontroll.setData('height', height);
              await  addcontroll.setData('weight',weight );
                 print(addcontroll.getValues['height']);
                 print(addcontroll.getValues['weight']);

               Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Target(),) );
              },
              child: Container(
               width: 75.w,
                height: 6.h,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Color_const.myButton),
                child: Center(child: Text('NEXT',style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 28,color: Color_const.myWhite),),),
              ),
            )
      ]),
    );
  }
}