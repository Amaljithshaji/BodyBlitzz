class Workout {
  final String workoutName;
  final int duration;
  final String workoutDemo;
  final int count;

  Workout({
    required this.workoutName,
    required this.duration,
    required this.workoutDemo,
    required this.count,
  });
}

class DataBase {
  static List<Map<String, dynamic>> Workoutitems1 = [
    {
      "WorkoutName": "JUMPING JACKS",
      "Duration": 20,
      "workoutDemo": "assets/json/jumping jacks.json",
      "count":  0
    },
    {
      "WorkoutName": "ABDOMINAL CURUNCHES",
      "Duration": 0,
      "workoutDemo": "assets/json/abscr.json",
      "count":  16
    },
     {
      "WorkoutName": "RUSSIAN TWIST",
      "Duration": 0,
      "workoutDemo": "assets/json/russian twist.json",
      "count":  20
    },
     {
      "WorkoutName": "MOUNTAIN CLIMBER",
      "Duration": 0,
      "workoutDemo": "assets/json/mountain climber.json",
       "count":  20
    },
     {
      "WorkoutName": "HEEL TOUCH",
       "count":  20,
       "Duration": 0,
      "workoutDemo": "assets/json/heel touch.json",
    },
     {
      "WorkoutName": "LEG RAISES",
       "count":  16,
       "Duration": 0,
      "workoutDemo": "assets/json/leg rasier.json",
    },
     {
      "WorkoutName": "PLANK",
      "Duration": 20,
      "count":  0,
      "workoutDemo": "assets/json/plank.json",
    },
    {
      "WorkoutName": "ABDOMINAL CURUNCHES",
      "workoutDemo": "assets/json/abscr.json",
      "count":  12,
      "Duration": 0,
    },
     {
      "WorkoutName": "RUSSIAN TWIST",
      "Duration": 0,
      "workoutDemo": "assets/json/russian twist.json",
      "count":  32
    },
     {
      "WorkoutName": "MOUNTAIN CLIMBER",
      "Duration": 0,
      "workoutDemo": "assets/json/mountain climber.json",
       "count":  12
    },
     {
      "WorkoutName": "HEEL TOUCH",
       "count":  20,
       "Duration": 0,
      "workoutDemo": "assets/json/heel touch.json",
    },
     {
      "WorkoutName": "LEG RAISES",
       "count":  14,
       "Duration": 0,
      "workoutDemo": "assets/json/leg rasier.json",
    },
     {
      "WorkoutName": "PLANK",
      "Duration": 30,
      "count":  0,
      "workoutDemo": "assets/json/plank.json",
    },
     {
      "WorkoutName": "COBRA STRETCH",
      "Duration": 30,
      "count":  0,
      "workoutDemo": "assets/json/cobra.json",
    },
    {
      "WorkoutName": "SPINE LUMBAR TWIST STRETCH LEFT",
      "Duration": 30,
      "count":  0,
      "workoutDemo": "assets/json/spine_lumbar_left.json",
    },
      {
      "WorkoutName": "SPINE LUMBAR TWIST STRETCH RIGHT",
      "Duration": 30,
      "count":  0,
      "workoutDemo": "assets/json/spine_lumbar_right.json",
    },
  ];
}