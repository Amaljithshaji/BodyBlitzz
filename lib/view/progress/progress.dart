import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';

class Progress_Screen extends StatefulWidget {
  const Progress_Screen({super.key});

  @override
  State<Progress_Screen> createState() => _Progress_ScreenState();
}

class _Progress_ScreenState extends State<Progress_Screen> {
  RulerPickerController? _rulerPickerController;

  num currentValue = 50;

  List<RulerRange> ranges = const [
    RulerRange(begin: 0, end: 249, scale: 1),
   
  ];

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: currentValue);
  }


  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              currentValue.toStringAsFixed(1),
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            const SizedBox(height: 10),
            RulerPicker(
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
              height: 80,
              rulerMarginTop: 10,
              // marker: Container(
              //     width: 8,
              //     height: 50,
              //     decoration: BoxDecoration(
              //         color: Colors.red.withAlpha(100),
              //         borderRadius: BorderRadius.circular(5))),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}