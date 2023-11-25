import 'package:bodyblitz/utills/constant/Themedata/Light_theme.dart';
import 'package:bodyblitz/utills/constant/Themedata/dark_theme.dart';
import 'package:bodyblitz/view/Register/login.dart';
import 'package:bodyblitz/view/Register/register.dart';
//import 'package:bodyblitz/view/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: LoginScreen(),
      theme: lightmode,
      darkTheme: darkmode,
      debugShowCheckedModeBanner: false,
    );
  }
} 