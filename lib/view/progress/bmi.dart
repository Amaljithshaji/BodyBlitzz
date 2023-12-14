import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:sizer/sizer.dart';

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState
    extends State<Bmi> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);

  double _progress = 10;

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter circular_seek_bar example'),
      ),
      body: Column(
        children: [
          Center(
            child: CircularSeekBar(
  width: double.infinity,
  height: 250,
  interactive: false,
  progress: 29.343,
  maxProgress: 40,
  barWidth: 8,
  startAngle: 45,
  sweepAngle: 270,
  strokeCap: StrokeCap.butt,
  progressGradientColors: const [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.indigo, Colors.purple],
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
            Text('${value.toStringAsFixed(1)}', style: TextStyle(color: Colors.white)),
            Text('progress', style: TextStyle(color: Colors.grey)),
          ],
        )),
  ),
),
          )
        ],
      )
      
    );
  }
}