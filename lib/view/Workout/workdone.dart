import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

class Work_done extends StatefulWidget {
  const Work_done({super.key});

  @override
  State<Work_done> createState() => _Work_doneState();
}

class _Work_doneState extends State<Work_done> {
  late WeightSliderController _controller1;
   late WeightSliderController _controller2;
  double _weight = 30.0;
double  _height = 30.0;

  @override
  void initState() {
    super.initState();
    _controller1 = WeightSliderController(
        initialWeight: _weight, minWeight: 0, interval: 0.1);
         _controller2 = WeightSliderController(
        initialWeight: _height, minWeight: 0, interval: 0.1);
  }

  @override
  void dispose() {
    _controller1.dispose();
     _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.red,
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 260),
                    child: Container(
                      width: double.infinity,
                      height: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          color: Colors.amber),
                    ),
                  ),
                  Positioned(
                    top: 200,
                    left: 20,
                    child: Container(
                        width: 370,
                        height: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.blue, width: 2),
                            color: Colors.grey.shade200),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 30, top: 10),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Duration',
                                        style: GoogleFonts.aDLaMDisplay(
                                            fontSize: 24,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        '05:00',
                                        style: GoogleFonts.aDLaMDisplay(
                                            fontSize: 24,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, right: 30),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Exercise',
                                        style: GoogleFonts.aDLaMDisplay(
                                            fontSize: 24,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        '09',
                                        style: GoogleFonts.aDLaMDisplay(
                                            fontSize: 24,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 15),
                                  child: CircularPercentIndicator(
                                    radius: 60.0,
                                    animation: true,
                                    animationDuration: 1200,
                                    lineWidth: 15.0,
                                    percent: 0.4,
                                    center: new Text(
                                      "",
                                      style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                    circularStrokeCap: CircularStrokeCap.butt,
                                    backgroundColor: Colors.yellow,
                                    progressColor: Colors.red,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 20, top: 15),
                                  child: CircularPercentIndicator(
                                    radius: 60.0,
                                    animation: true,
                                    animationDuration: 1200,
                                    lineWidth: 15.0,
                                    percent: 0.4,
                                    center: new Text(
                                      "",
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          color: Colors.black),
                                    ),
                                    circularStrokeCap: CircularStrokeCap.butt,
                                    backgroundColor: Colors.yellow,
                                    progressColor: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  Positioned(
                    bottom: 230,
                    left: 20,
                    child: Container(
                      width: 370,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.blue, width: 2),
                          color: Colors.grey.shade200),
                      child: Column(
                        children: [
                          Text(
                            'Weight log',
                            style: GoogleFonts.aDLaMDisplay(
                                fontSize: 28,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Starting Weight',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      '239 KG',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Target Weight',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      '239 KG',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                               _showWeight();
                            },
                            child: Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.blue),
                              child: Center(
                                  child: Text(
                                'Update',
                                style: GoogleFonts.aDLaMDisplay(fontSize: 20),
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 150,
                    child: CircularPercentIndicator(
                      radius: 80.0,
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: 15.0,
                      percent: 0.4,
                      center: new Text(
                        "",
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.black),
                      ),
                      circularStrokeCap: CircularStrokeCap.butt,
                      backgroundColor: Colors.yellow,
                      progressColor: Colors.red,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
  _showWeight(){
    return showModalBottomSheet(context: context, builder: (context)=>
    Container(
      width: double.infinity,
      height: 40.h,
      color: Colors.black,
      child:  Column(
        children: [
          Text(
              "${_weight.toStringAsFixed(1)} kg",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 100,
              height: 34.h,
                child: VerticalWeightSlider(
                  controller: _controller1,
                  decoration: const PointerDecoration(
                    width: 100,
                    height: 3,
                    largeColor: Color(0xFF898989),
                    mediumColor: Color(0xFFC5C5C5),
                    smallColor: Color(0xFFF0F0F0),
                    gap: 30,
                  ),
                  onChanged: (double value) {
                    setState(() {
                      _weight = value;
                    });
                  },
                  indicator: Container(
                    height: 3,
                    width: 100,
                    alignment: Alignment.centerLeft,
                    color: Colors.red[300],
                  ),
                ),
              ),
             
              Container(width: 100,
              height: 340,
                child: VerticalWeightSlider(
                  controller: _controller2,
                  decoration: const PointerDecoration(
                    width: 100,
                    height: 3,
                    largeColor: Color(0xFF898989),
                    mediumColor: Color(0xFFC5C5C5),
                    smallColor: Color(0xFFF0F0F0),
                    gap: 30,
                  ),
                  onChanged: (double value) {
                    setState(() {
                      _height = value;
                    });
                  },
                  indicator: Container(
                    height: 3,
                    width: 100,
                    alignment: Alignment.centerLeft,
                    color: Colors.red[300],
                  ),
                ),
              ),
            ],
          ),
        ],
    )));
  }
}
