import 'package:bodyblitz/controller/home.controller.dart';
//import 'package:bodyblitz/view/progress/bmi.dart';
import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../utills/constant/colors_constant/colors_const.dart';

class Progress_Screen extends StatefulWidget {
  const Progress_Screen({super.key});

  @override
  State<Progress_Screen> createState() => _Progress_ScreenState();
}

class _Progress_ScreenState extends State<Progress_Screen> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);

  @override
  void initState() {
    var controller = Provider.of<WorkoutController>(context, listen: false);
    controller.loadData();
    super.initState();
  }

  @override
  void dispose() {
    _valueNotifier.dispose();

    // var weight = contoll.getValues['weight'];
    // Provider.of<WorkoutController>(context,listen: false).Bmicalulator(height: int.parse(height!), weight: int.parse(weight!));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<WorkoutController>(context);
    var height = controller.getValues['height']?.toString() ?? "0";
    var weight = controller.getValues['weight']?.toString() ?? "0";
    int _height = int.tryParse(height) ?? 0;
    int _weight = int.tryParse(weight) ?? 0;
    double _Progres = _weight / _height / _height * 10000;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reports',
          style: GoogleFonts.aDLaMDisplay(fontSize: 24),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .9,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'BMI',
                        style: GoogleFonts.aDLaMDisplay(fontSize: 28),
                      ),
                    ),
                    Center(
                      child: CircularSeekBar(
                        width: double.infinity,
                        height: 250,
                        interactive: false,
                        progress: _Progres.isFinite ? _Progres : 0.0,
                        maxProgress: 40,
                        barWidth: 8,
                        startAngle: 45,
                        sweepAngle: 270,
                        strokeCap: StrokeCap.butt,
                        progressGradientColors: const [
                          Colors.red,
                          Colors.orange,
                          Colors.yellow,
                          Colors.green,
                          Colors.blue,
                          Colors.indigo,
                          Colors.purple
                        ],
                        innerThumbRadius: 5,
                        innerThumbStrokeWidth: 3,
                        innerThumbColor: Colors.white,
                        outerThumbRadius: 5,
                        outerThumbStrokeWidth: 10,
                        outerThumbColor: Colors.blueAccent,
                        dashWidth: 1,
                        dashGap: 2,
                        animation: true,
                        curves: Curves.bounceOut,
                        valueNotifier: _valueNotifier,
                        child: Center(
                          child: ValueListenableBuilder(
                              valueListenable: _valueNotifier,
                              builder: (_, double value, __) => Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('${value.toStringAsFixed(1)}',
                                          style: GoogleFonts.aDLaMDisplay(
                                              fontSize: 28)),
                                      Text(_getText(_Progres),
                                          style: GoogleFonts.aDLaMDisplay(
                                              fontSize: 24)),
                                    ],
                                  )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 370,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: Column(
                  children: [
                    Text(
                      'Weight log',
                      style: GoogleFonts.aDLaMDisplay(
                        fontSize: 28,
                        fontWeight: FontWeight.normal,
                      ),
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
                                ),
                              ),
                              Text(
                                '${controller.getValues['weight'].toString()} kg',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
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
                                ),
                              ),
                              Text(
                                '239 KG',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _ShowWeight();
                      },
                      child: Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color_const.myButton),
                        child: Center(
                            child: Text(
                          'Update',
                          style: GoogleFonts.aDLaMDisplay(
                              fontSize: 20, color: Colors.white),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .9,
                height: 40.h,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 174,
                              height: 20.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xff74dacc)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'DURATION',
                                      style: GoogleFonts.aDLaMDisplay(
                                          color: Color(0xffbdebe5),
                                          fontSize: 18),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 90),
                                      child: Container(
                                          width: 80,
                                          height: 80,
                                          child: Image.asset(
                                            'assets/img/duration.png',
                                            color: Color(0xffbdebe5),
                                          )),
                                    ),
                                    Text(
                                      '00:00:00',
                                      style: GoogleFonts.aDLaMDisplay(
                                          color: Color(0xffbdebe5),
                                          fontSize: 28),
                                    ),
                                    Text(
                                      'Time Spent',
                                      style: TextStyle(
                                          color: Color(0xffbdebe5),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 174,
                              height: 15.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xffaad7ff)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'WORKOUT',
                                          style: GoogleFonts.aDLaMDisplay(
                                              color: Color(0xffddf1fe),
                                              fontSize: 18),
                                        ),
                                        Text(
                                          '1',
                                          style: GoogleFonts.aDLaMDisplay(
                                              color: Color(0xffddf1fe),
                                              fontSize: 38),
                                        ),
                                        Container(
                                            width: 90,
                                            height: 50,
                                            child: Text(
                                              'No of workouts',
                                              style: GoogleFonts.aDLaMDisplay(
                                                  color: Color(0xffddf1fe),
                                                  fontSize: 18),
                                            )),
                                      ],
                                    ),
                                    Container(
                                        width: 60,
                                        height: 80,
                                        child: Image.asset(
                                          'assets/img/workout.png',
                                          color: Color(0xffddf1fe),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 174,
                              height: 15.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xffffd05a)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'CALORIES',
                                          style: GoogleFonts.aDLaMDisplay(
                                              color: Color(0xfffee7aa),
                                              fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '0.02',
                                          style: GoogleFonts.aDLaMDisplay(
                                              color: Color(0xfffee7aa),
                                              fontSize: 38),
                                        ),
                                        Container(
                                            width: 100,
                                            child: Text(
                                              'Kcal Burned',
                                              style: GoogleFonts.aDLaMDisplay(
                                                  color: Color(0xfffee7aa),
                                                  fontSize: 16),
                                            )),
                                      ],
                                    ),
                                    Container(
                                        width: 60,
                                        height: 130,
                                        child: Image.asset(
                                          'assets/img/Kcal.png',
                                          fit: BoxFit.fill,
                                          color: Color(0xfffee7aa),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 174,
                              height: 20.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xffff868f)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'BMI',
                                            style: GoogleFonts.aDLaMDisplay(
                                                color: Color(0xfffec1c7),
                                                fontSize: 18),
                                          ),
                                          Container(
                                            width: 80,
                                            height: 80,
                                            child: Image.asset(
                                                'assets/img/bmi.png',
                                                color: Color(
                                                  0xfffec1c7,
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '${_Progres.toStringAsFixed(1)}',
                                      style: GoogleFonts.aDLaMDisplay(
                                          fontSize: 38,
                                          color: Color(0xfffec1c7)),
                                    ),
                                    Text(
                                      _getText(_Progres),
                                      style: GoogleFonts.aDLaMDisplay(
                                          fontSize: 18,
                                          color: Color(0xfffec1c7)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
             SizedBox(height: 10.h,)
            ],
          ),
        ),
      ),
    );
  }

  String _getText(double _Progres) {
    if (_Progres < 18.5) {
      return 'underweight';
    } else if (_Progres > 18.5 && _Progres < 24.9) {
      return 'Healthy';
    } else if (_Progres > 25 && _Progres < 29.9) {
      return 'Overweight';
    } else if (_Progres > 30 && _Progres < 39.9) {
      return 'Obesity';
    } else {
      return 'severe Obesity';
    }
  }

  _ShowWeight() {
    RulerPickerController? _rulerPickerController;
    RulerPickerController? _rulerPickerController1;
    var height = Provider.of<WorkoutController>(context, listen: false)
        .getValues['height']
        .toString();
    var weight = Provider.of<WorkoutController>(context, listen: false)
        .getValues['weight']
        .toString();
    num currentValue = int.parse(height);
    num currentValue1 = int.parse(weight);

    List<RulerRange> ranges = const [
      RulerRange(begin: 0, end: 249, scale: 1),
    ];
    List<RulerRange> ranges1 = const [
      RulerRange(begin: 0, end: 249, scale: 1),
    ];

    _rulerPickerController = RulerPickerController(value: currentValue);
    _rulerPickerController1 = RulerPickerController(value: currentValue1);
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (contex) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            var addcontroll = Provider.of<WorkoutController>(context);
            addcontroll.loadData();
            return Container(
              height: 64.h,
              width: double.infinity,
              child: Column(children: [
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'Enter Details',
                  style: GoogleFonts.aDLaMDisplay(fontSize: 24),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Height',
                        style: GoogleFonts.aDLaMDisplay(fontSize: 24),
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
                                style: GoogleFonts.aDLaMDisplay(
                                    fontSize: 24, color: Colors.white))),
                      )
                    ],
                  ),
                ),
                RulerPicker(
                  rulerBackgroundColor: Colors.transparent,
                  controller: _rulerPickerController!,
                  onBuildRulerScaleText: (index, value) {
                    return value.toInt().toString();
                  },
                  ranges: ranges,

                  scaleLineStyleList: const [
                    ScaleLineStyle(
                        color: Colors.grey, width: 1.5, height: 40, scale: 0),
                    ScaleLineStyle(
                        color: Colors.grey, width: 1, height: 25, scale: 5),
                    ScaleLineStyle(
                        color: Colors.grey, width: 1, height: 15, scale: -1)
                  ],

                  onValueChanged: (value) {
                    setState(() {
                      currentValue = value;
                    });
                  },
                  width: MediaQuery.of(context).size.width,
                  height: 8.h,
                  rulerMarginTop: 10,
                  // marker: Container(
                  //     width: 8,
                  //     height: 50,
                  //     decoration: BoxDecoration(
                  //         color: Colors.red.withAlpha(100),
                  //         borderRadius: BorderRadius.circular(5))),
                ),
                Text(
                  '${currentValue.toStringAsFixed(1)} CM',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Weight',
                        style: GoogleFonts.aDLaMDisplay(fontSize: 24),
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
                                style: GoogleFonts.aDLaMDisplay(
                                    fontSize: 24, color: Colors.white))),
                      )
                    ],
                  ),
                ),
                RulerPicker(
                  rulerBackgroundColor: Colors.transparent,
                  controller: _rulerPickerController1!,
                  onBuildRulerScaleText: (index, value) {
                    return value.toInt().toString();
                  },
                  ranges: ranges1,

                  scaleLineStyleList: const [
                    ScaleLineStyle(
                        color: Colors.grey, width: 1.5, height: 40, scale: 0),
                    ScaleLineStyle(
                        color: Colors.grey, width: 1, height: 25, scale: 5),
                    ScaleLineStyle(
                        color: Colors.grey, width: 1, height: 15, scale: -1)
                  ],

                  onValueChanged: (value) {
                    setState(() {
                      currentValue1 = value;
                    });
                  },
                  width: MediaQuery.of(context).size.width,
                  height: 8.h,
                  rulerMarginTop: 10,
                  // marker: Container(
                  //     width: 8,
                  //     height: 50,
                  //     decoration: BoxDecoration(
                  //         color: Colors.red.withAlpha(100),
                  //         borderRadius: BorderRadius.circular(5))),
                ),
                Text(
                  '${currentValue1.toStringAsFixed(1)} KG',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: 1.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 250,
                    height: 6.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.transparent,
                    ),
                    child: Center(
                        child: Text(
                      'Cancel',
                      style: GoogleFonts.aDLaMDisplay(fontSize: 24),
                    )),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                    final weight = currentValue1.toStringAsFixed(0);
                    final height = currentValue.toStringAsFixed(0);
                    await addcontroll.setData('height', height);
                    await addcontroll.setData('weight', weight);
                    print(addcontroll.getValues['height']);
                    print(addcontroll.getValues['weight']);
                  },
                  child: Container(
                    width: 350,
                    height: 6.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color_const.myButton,
                    ),
                    child: Center(
                        child: Text(
                      'Save Changes',
                      style: GoogleFonts.aDLaMDisplay(
                          fontSize: 24, color: Colors.white),
                    )),
                  ),
                )
              ]),
            );
          });
        });
  }
}
