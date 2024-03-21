
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:bodyblitz/models/database.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import '../models/newsmodel.dart';

class WorkoutController extends ChangeNotifier {
  List<Workout> _workouts = [];
  int workout_count = 0;
  List<Workout> get workouts => _workouts;
  int training_rest = 5;
  int countdown_time = 5;
  int exerise_count =0;
  DateTime? start_time;
  DateTime? stoptime;
  bool isloading = false;
  Newsmodel? responsedata;
  Newsmodel? responsedata1;
//  late Box<Profilemodel> _databox;
//  late List<Profilemodel> _datalist = [];
Map<String, String> _getdata = {};

  Map<String, String> get getValues => _getdata;

  Future<void> setData(String key, String value) async {
    final box = await Hive.openBox('databox');
    await box.put(key, value);
    _getdata = Map<String, String>.fromEntries(box.toMap().entries.map((entry) =>
        MapEntry(entry.key.toString(), entry.value.toString())));
    notifyListeners();
  }

  Future<void> loadData() async {
    final box = await Hive.openBox('databox');
    _getdata = Map<String, String>.fromEntries(box.toMap().entries.map((entry) =>
        MapEntry(entry.key.toString(), entry.value.toString())));
    notifyListeners();
  }

  void loadWorkouts(List<Map<String, dynamic>> Workoutitems1) {
    _workouts = Workoutitems1.map((map) => Workout(
      workoutName: map['WorkoutName'],
      duration: map['Duration'],
      workoutDemo: map['workoutDemo'],
      count: map['count'],
    )).toList();
    notifyListeners();
  }

Future<dynamic> healthdata() async {
    isloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=b14f19a53f764e46a36603a250c33f12");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var decodedata = jsonDecode(response.body);
      print(response.body);
      responsedata = Newsmodel.fromJson(decodedata);
    }
    isloading = false;
    notifyListeners();
  }
  Future<dynamic> sportsdata() async {
    isloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=b14f19a53f764e46a36603a250c33f12");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var decodedata = jsonDecode(response.body);
      print(response.body);
      responsedata1 = Newsmodel.fromJson(decodedata);
    }
    isloading = false;
    notifyListeners();
  }


  void addcount(){
  workout_count++;
  notifyListeners();
}
  void subcount(){
  workout_count--;
  notifyListeners();
}
 void resetCounter() {
    workout_count = 0;
    notifyListeners();
  }
  void addrest(){
   if (training_rest < 180) {
      training_rest++;
      notifyListeners();
    }
}
  void subrest(){
 if (training_rest > 5) {
      training_rest--;
      notifyListeners();
    }
}
  void addcountdown(){
  if (countdown_time < 15) {
      countdown_time++;
      notifyListeners();
    }
}
  void subcountdown(){
 if (countdown_time > 5) {
      countdown_time--;
      notifyListeners();
    }
}
  
 
  Future<void>  playAudioFromUrl() async {
    await AudioPlayer().play(AssetSource("audio/referee-whistle-blow-gymnasium-6320.mp3"));
    
  }


void exerise(){
  exerise_count++;
  notifyListeners();
}
  void rest(){
  exerise_count = 0;
  notifyListeners();
}
 void StartTime(){
  start_time = DateTime.now();
  notifyListeners();
}
void stopTime(){
  stoptime = DateTime.now();
  notifyListeners();
}

}
