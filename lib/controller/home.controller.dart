import 'package:audioplayers/audioplayers.dart';
import 'package:bodyblitz/models/database.dart';
import 'package:bodyblitz/models/models.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WorkoutController extends ChangeNotifier {
  List<Workout> _workouts = [];
  int workout_count = 0;
  List<Workout> get workouts => _workouts;
//  late Box<Profilemodel> _databox;
//  late List<Profilemodel> _datalist = [];
 Map<String, String> _getdata = {};

  Map<String, String> get getValues => _getdata;

  void setData(String key, String value) {
    final box = Hive.box('databox');
    box.put(key, value);
    _getdata = Map<String, String>.fromEntries(box.toMap().entries.map((entry) => MapEntry(entry.key.toString(), entry.value.toString())));
    notifyListeners();
  }

  Future<void> loadData() async {
    final box = Hive.box('databox');
    _getdata = Map<String, String>.fromEntries(box.toMap().entries.map((entry) => MapEntry(entry.key.toString(), entry.value.toString())));
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
 
  Future<void>  playAudioFromUrl() async {
    await AudioPlayer().play(AssetSource("audio/referee-whistle-blow-gymnasium-6320.mp3"));
    
  }
// WorkoutController(){
//   _init();
// }
  
//   Future<void> _init() async{
//     _databox = await Hive.openBox<Profilemodel>('dataBox');
//     _datalist = _databox.values.toList();
//     notifyListeners();
//   }

//   void adddata({required String gender,required int height,required int  Weight,required int BIM ,}){
//     final profilemodel = Profilemodel(gender: gender, height: height, Weight: Weight, BIM:BIM ,);
//     _databox.add(profilemodel);
//     _datalist.add(profilemodel);
//     print(_datalist[8].profile);
//     notifyListeners();
//   }
  
//   addgender( dynamic _gender){

// box.add(Profilemodel(gender: _gender));
// print(box.get(_gender));
// notifyListeners();

//   }

  

}
