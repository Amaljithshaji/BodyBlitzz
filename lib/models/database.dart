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
  static List<Map<String, dynamic>> abs = [
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

  static List<Map<String, dynamic>> chest = [
    {
      "WorkoutName": "JUMPING JACKS",
      "Duration": 30,
      "workoutDemo": "assets/json/jumping jacks.json",
      "count":  0
    },
    {
      "WorkoutName": "INCLINE PUSH-UPS",
      "Duration": 0,
      "workoutDemo": "assets/json/incline push up.mp4.lottie.json",
      "count":  10
    },
     {
      "WorkoutName": "PUSH-UPS",
      "Duration": 0,
      "workoutDemo": "assets/json/push up.mp4.lottie.json",
      "count":  8
    },
     {
      "WorkoutName": "WIDE ARM PUSH-UPS",
      "Duration": 0,
      "workoutDemo": "assets/json/wide arm push up.mp4.lottie.json",
       "count":  8
    },
     {
      "WorkoutName": "TRICEPS DIPS",
       "count":  10,
       "Duration": 0,
      "workoutDemo": "assets/json/triceps dips.mp4.lottie.json",
    },
     {
      "WorkoutName": "WIDE ARM PUSH-UPS",
       "count":  6,
       "Duration": 0,
      "workoutDemo": "assets/json/wide arm push up.mp4.lottie.json",
    },
     {
      "WorkoutName": "INCLINE PUSH-UPS",
      "Duration": 0,
      "count":  8,
      "workoutDemo": "assets/json/incline push up.mp4.lottie.json",
    },
    {
      "WorkoutName": "TRICEPS DIPS",
      "workoutDemo": "assets/json/triceps dips.mp4.lottie.json",
      "count":  8,
      "Duration": 0,
    },
     {
      "WorkoutName": "KNEE PUSH-UPS",
      "Duration": 0,
      "workoutDemo": "assets/json/knee push up.mp4.lottie.json",
      "count":  8
    },
     {
      "WorkoutName": "COBRA STRETCH",
      "Duration": 20,
      "workoutDemo": "assets/json/cobra.json",
       "count":  0
    },
     {
      "WorkoutName": "CHEST STRETCH",
       "count":  0,
       "Duration": 20,
      "workoutDemo": "assets/json/chest-shoulders-stretch.mp4.lottie.json",
    },
     
  ];

  static List<Map<String, dynamic>> arm = [
    {
      "WorkoutName": "ARM RAISES",
      "Duration": 30,
      "workoutDemo": "assets/json/arm raise.mp4.lottie.json",
      "count":  0
    },
    {
      "WorkoutName": "SIDE ARM RAISES ",
      "Duration": 30,
      "workoutDemo": "assets/json/side arm raise2.mp4.lottie.json",
      "count":  0
    },
     {
      "WorkoutName": "TRICEPS DIPS",
      "Duration": 0,
      "workoutDemo": "assets/json/triceps dips.mp4.lottie.json",
      "count":  10
    },
     {
      "WorkoutName": "ARM CIRCLES",
      "Duration": 30,
      "workoutDemo": "assets/json/arm-circles-.mp4.lottie.json",
       "count":  0
    },
     {
      "WorkoutName": "ARM CIRCLES",
      "Duration": 30,
      "workoutDemo": "assets/json/arm-circles-.mp4.lottie.json",
       "count":  0
    },
     {
      "WorkoutName": "DIAMOND PUSH-UPS",
       "count":  6,
       "Duration": 0,
      "workoutDemo": "assets/json/wide arm push up.mp4.lottie.json",
    },
     {
      "WorkoutName": "JUMPING JACKS",
      "Duration": 30,
      "count":  0,
      "workoutDemo": "assets/json/jumping jacks.json",
    },
    {
      "WorkoutName": "LEG BARBELL CURL LEFT",
      "workoutDemo": "assets/json/Leg barbell curl.json",
      "count":  8,
      "Duration": 0,
    },
     {
      "WorkoutName": "LEG BARBELL CURL RIGHT",
      "workoutDemo": "assets/json/Leg barbell curl.json",
      "count":  8,
      "Duration": 0,
    },
     {
      "WorkoutName": "DIAGONAL PLANK",
      "Duration": 0,
      "workoutDemo": "assets/json/diagonal plank.mp4.lottie.json",
       "count":  10
    },
     {
      "WorkoutName": "PUNCHES",
       "count":  0,
       "Duration": 30,
      "workoutDemo": "assets/json/punches.json",
    },
    {
     "WorkoutName": "PUSH-UPS",
      "Duration": 0,
      "workoutDemo": "assets/json/push up.mp4.lottie.json",
      "count":  10
    },
    {
     "WorkoutName": "PUSH-UPS",
      "Duration": 0,
      "workoutDemo": "assets/json/inchworms.json",
      "count":  8
    },
    {
     "WorkoutName": "WALL PUSH-UPS",
      "Duration": 0,
      "workoutDemo": "assets/json/wall push up.mp4.lottie.json",
      "count":  12
    },
     {
     "WorkoutName": "WALL PUSH-UPS",
      "Duration": 0,
      "workoutDemo": "assets/json/wall push up.mp4.lottie.json",
      "count":  12
    },
     
  ];

  static List<Map<String, dynamic>> leg = [
    {
      "WorkoutName": "SQUATS",
      "Duration": 0,
      "workoutDemo": "assets/json/squats.mp4.lottie.json",
      "count":  12
    },
    {
      "WorkoutName": "SQUATS",
      "Duration": 0,
      "workoutDemo": "assets/json/squats.mp4.lottie.json",
      "count":  12
    },
     {
      "WorkoutName": "SIDE LAYING LEG LIFT LEFT",
      "Duration": 0,
      "workoutDemo": "assets/json/side lying left.json",
      "count":  12
    },
     {
      "WorkoutName": "SIDE LAYING LEG LIFT RIGHT",
      "Duration": 0,
      "workoutDemo": "assets/json/side-lying-leg-lif.mp4.lottie.json",
      "count":  12
    },
     {
      "WorkoutName": "DONKEY KICKS LEFT",
       "count":  16,
       "Duration": 0,
      "workoutDemo": "assets/json/donkey-kicks-left.mp4.lottie.json",
    },
     {
       "WorkoutName": "DONKEY KICKS RIGHT",
       "count":  16,
       "Duration": 0,
      "workoutDemo": "assets/json/donkey-kicks-exercise.mp4.lottie.json",
    },
     {
      "WorkoutName": "KNEE TO CHEST STRETCh LEFT",
      "Duration": 30,
      "count":  0,
      "workoutDemo": "assets/json/single-knee-to-chest.mp4.lottie.json",
    },
    {
     "WorkoutName": "KNEE TO CHEST STRETCh RIGHT",
      "Duration": 30,
      "count":  0,
      "workoutDemo": "assets/json/single-knee-to-chest.mp4.lottie.json",
    },
     {
      "WorkoutName": "CALF-RAISES",
      "Duration": 0,
      "workoutDemo": "assets/json/calf-raises.mp4.lottie.json",
      "count":  12
    },
     {
      "WorkoutName": "CALF-RAISES",
      "Duration": 0,
      "workoutDemo": "assets/json/calf-raises.mp4.lottie.json",
      "count":  12
    },
     {
      "WorkoutName": "LEG CALF STRETCH LEFT",
       "count":  0,
       "Duration": 30,
      "workoutDemo": "assets/json/leg-calf-stretch-left.mp4.lottie.json",
    },
     {
      "WorkoutName": "LEG CALF STRETCH RIGHT",
       "count":  0,
       "Duration": 30,
      "workoutDemo": "assets/json/lunging-straight-leg-calf-stretch-exercise-girl-8078303-6462730.mp4.lottie.json",
    },
  ];

  static List<Map<String, dynamic>> shoulder = [
    {
      "WorkoutName": "JUMPING JACKS",
      "Duration": 30,
      "workoutDemo": "assets/json/jumping jacks.json",
      "count":  0
    },
    {
      "WorkoutName": "ARM RAISES",
      "Duration": 16,
      "workoutDemo": "assets/json/arm raise.mp4.lottie.json",
      "count":  0
    },
     {
       "WorkoutName": "SIDE ARM RAISES ",
      "Duration": 16,
      "workoutDemo": "assets/json/side arm raise2.mp4.lottie.json",
      "count":  0
    },
     {
     "WorkoutName": "KNEE PUSH-UPS",
      "Duration": 0,
      "workoutDemo": "assets/json/knee push up.mp4.lottie.json",
      "count":  14
    },
     {
      "WorkoutName": "PLANK SHOULDER TAP",
       "count":  16,
       "Duration": 0,
      "workoutDemo": "assets/json/plank-shoulder-tap.mp4.lottie.json",
    },
     {
       "WorkoutName": "SIDE ARM RAISES ",
      "Duration": 14,
      "workoutDemo": "assets/json/side arm raise2.mp4.lottie.json",
      "count":  0
    },
     {
      "WorkoutName": "KNEE PUSH-UPS",
      "Duration": 0,
      "workoutDemo": "assets/json/knee push up.mp4.lottie.json",
      "count":  12
    },
    {
      "WorkoutName": "CAT COW POSE",
      "workoutDemo": "assets/json/woman-doing-cat-cow-stretching-10154422-8239302.mp4.lottie.json",
      "count":  0,
      "Duration": 30,
    },
     {
      "WorkoutName": "PRONE TRICEPS PUSH UPS",
      "Duration": 0,
      "workoutDemo": "assets/json/prone triceps push up.mp4.lottie.json",
      "count":  14
    },
     {
      "WorkoutName": "CAT COW POSE",
      "workoutDemo": "assets/json/woman-doing-cat-cow-stretching-10154422-8239302.mp4.lottie.json",
      "count":  0,
      "Duration": 30,
    },
     {
      "WorkoutName": "PRONE TRICEPS PUSH UPS",
      "Duration": 0,
      "workoutDemo": "assets/json/prone triceps push up.mp4.lottie.json",
      "count":  14
    },
    {
      "WorkoutName": "CHILD'S POSE",
      "workoutDemo": "assets/json/child-pose.mp4.lottie.json",
      "count":  0,
      "Duration": 30,
    },
     
  ];

  
  
}