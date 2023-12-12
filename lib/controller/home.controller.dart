import 'package:audioplayers/audioplayers.dart';
import 'package:bodyblitz/models/database.dart';
import 'package:bodyblitz/models/models.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WorkoutController extends ChangeNotifier {
  List<Workout> _workouts = [];
  int workout_count = 0;
  List<Workout> get workouts => _workouts;
 late Box<Profilemodel> _databox;

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
WorkoutController(){
  _init();
}
  
  Future<void> _init() async{
    _databox = await Hive.openBox('dataBox');
    notifyListeners();
  }

  void adddata({required String gender,required int height,required int  Weight,required int BIM ,required String profile}){
    final profilemodel = Profilemodel(gender: gender, height: height, Weight: Weight, BIM:BIM ,profile: profile);
    _databox.add(profilemodel);
    print(_databox.get(profilemodel.Weight));
    notifyListeners();
  }
  
//   addgender( dynamic _gender){

// box.add(Profilemodel(gender: _gender));
// print(box.get(_gender));
// notifyListeners();

//   }
  

}
