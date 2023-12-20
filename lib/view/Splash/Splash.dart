import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Register/login.dart';
import '../bottomNavigation/Bottomnavigator.dart';
String? finalemail;
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    getvalidate().whenComplete(()async{
   Timer(Duration(seconds: 3), () => Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (context) => finalemail == null ? LoginScreen(): Bottom_Naviagator(),)));
    } );
    super.initState();
  }
  Future<void> getvalidate() async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var obtainedemail = preferences.getString('mail');
    setState(() {
      finalemail = obtainedemail ;
    });
    print(finalemail);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/img/Reg_logo.png',color: Theme.of(context).colorScheme.onPrimary),
          )
        ],
      ),
    );
  }
}