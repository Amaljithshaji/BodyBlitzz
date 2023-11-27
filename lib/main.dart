import 'package:bodyblitz/controller/home.controller.dart';
import 'package:bodyblitz/model/model.dart';
import 'package:bodyblitz/utills/constant/Themedata/Light_theme.dart';
import 'package:bodyblitz/utills/constant/Themedata/dark_theme.dart';
import 'package:bodyblitz/view/Register/login.dart';
// import 'package:bodyblitz/view/Register/register.dart';
//import 'package:bodyblitz/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
        var workoutController = WorkoutController();
        workoutController.loadWorkouts(DataBase.Workoutitems1);
        return workoutController;
      },)
      ],
      child: MaterialApp(
        home: LoginScreen(),
        theme: lightmode,
        darkTheme: darkmode,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
} 