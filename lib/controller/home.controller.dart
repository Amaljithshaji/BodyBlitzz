import 'package:bodyblitz/model/model.dart';
import 'package:flutter/foundation.dart';

class WorkoutController extends ChangeNotifier {
  List<Workout> _workouts = [];
  int workout_count = 0;

  List<Workout> get workouts => _workouts;

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
  // Add other functions to access the workout data as needed
}
