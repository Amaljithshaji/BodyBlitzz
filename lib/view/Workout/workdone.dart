import 'package:bodyblitz/view/bottomNavigation/Bottomnavigator.dart';
import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../controller/home.controller.dart';
import '../../utills/constant/colors_constant/colors_const.dart';
import '../progress/progress.dart';
Duration? duration1;  
class Work_done extends StatefulWidget {
  const Work_done({super.key});
 
  @override
  State<Work_done> createState() => _Work_doneState();
}

class _Work_doneState extends State<Work_done> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  @override
  void initState() {
    var controller = Provider.of<WorkoutController>(context, listen: false);
    controller.stopTime();
    controller.loadData();
      Duration total_duration = parseDuration(controller.getValues['Duration'].toString());
   setState(() {
     duration1 = total_duration;
   });
    super.initState();
  }

  @override
  void dispose() {
    _valueNotifier.dispose();

    super.dispose();
  }
   Duration parseDuration(String? durationString) {
  List<String> parts = durationString!.split(':');

  if (parts.length == 3) {
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    double seconds = double.parse(parts[2]);

    int totalSeconds = (hours * 3600 + minutes * 60 + seconds).round();
    return Duration(seconds: totalSeconds);
  } else {
    return Duration(seconds: 1);
  }
}

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<WorkoutController>(context);
    var height = controller.getValues['height']?.toString() ?? "0";
    var weight = controller.getValues['weight']?.toString() ?? "0";
    int _height = int.tryParse(height) ?? 0;
    int _weight = int.tryParse(weight) ?? 0;
    var ex_count = controller.getValues['ex_count']?.toString() ??'0';
    int _excount =int.tryParse(ex_count) ?? 0;
    int finalcount = controller.exerise_count;  
    double _Progres = _weight / _height / _height * 10000;
     Duration duration = controller.stoptime!.difference(controller.start_time!);
     int _minute = duration.inMinutes;
     int _sec = duration.inSeconds % 60;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
            onPressed: () async{
              
           controller.rest();
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        title: Text(
          'WorkDone',
          style: GoogleFonts.aDLaMDisplay(fontSize: 24),
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02,
            horizontal: MediaQuery.of(context).size.width * 0.04),
        child: InkWell(
          onTap: () async{
            Duration Time = duration + duration1!;
            String totalTime = Time.toString();
             print(totalTime);
           await controller.setData('Duration', totalTime);
            String exerise = (finalcount + _excount).toString();
          await  controller.setData('ex_count', exerise);
           controller.rest();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Bottom_Naviagator(),
                ));
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color_const.myButton),
            child: Center(
                child: Text(
              'Done',
              style:
                  GoogleFonts.aDLaMDisplay(fontSize: 28, color: Colors.white),
            )),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.04),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Center(
                  child: Stack(children: [
                Center(child: Lottie.asset('assets/json/cup.json')),
                Center(child: Lottie.asset('assets/json/cele.json')),
              ])),
              // color: Colors.blue,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${controller.exerise_count}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Exercise',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                         '${_minute.toString().padLeft(2, '0')}:${_sec.toString().padLeft(2, '0')}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Duration',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${controller.workouts.length - controller.exerise_count}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Skiped ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
         
          Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.grey.shade300,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1,
                        vertical: MediaQuery.of(context).size.height * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'BMI',
                          style: TextStyle(fontSize: 20,color: Colors.blue),
                        ),
                        InkWell(
                          onTap: () {
                            _ShowWeight();
                          },
                          child: Text(
                            'Edit',
                            style: TextStyle(fontSize: 20,color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Center(
                  child: CircularSeekBar(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.2,
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
                                          fontSize: 20)),
                                  Text(_getText(_Progres),
                                      style: GoogleFonts.aDLaMDisplay(
                                          fontSize: 20)),
                                ],
                              )),
                    ),
                  ),
                ),
              ],
            ),
          ),
           Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02,
                horizontal: MediaQuery.of(context).size.width * 0.06,
               ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Ink(
                  child: InkWell(
                    onTap: () async{
                       Duration Time = duration + duration1!;
            String totalTime = Time.toString();
             print(totalTime);
           await controller.setData('Duration', totalTime);
                      String exerise = (finalcount + _excount).toString();
          await  controller.setData('ex_count', exerise);
           controller.rest();
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Text(
                        'Do Again',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
                Ink(
                  child: InkWell(
                    onTap: () async{
                       Duration Time = duration + duration1!;
            String totalTime = Time.toString();
             print(totalTime);
           await controller.setData('Duration', totalTime);
                      String exerise = (finalcount + _excount).toString();
          await  controller.setData('ex_count', exerise);
           controller.rest();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Progress_Screen(),
                          ));
                    },
                    child: Container(
                      child: Text(
                        'Reports',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
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
