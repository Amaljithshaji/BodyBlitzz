import 'package:bodyblitz/view/Register/Componets/reg_field.dart';
import 'package:bodyblitz/view/Register/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utills/constant/colors_constant/colors_const.dart';
import '../bottomNavigation/Bottomnavigator.dart';
import 'setup/profile_setup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final iskeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
             if (!iskeyboard)  Center(
                child: 
                Container(
                  height: 350,
                  child:  Image.asset('assets/img/Reg_logo.png',)),
              ),
              Center(child: Text('Hey there,',style: TextStyle(fontSize: 20),)),
              
              Text('Welcome Back',style: GoogleFonts.aDLaMDisplay(fontSize: 28),),
              SizedBox(height: 30,),
              Reg_field(controller: mailController, hintText: 'mail', obsecureText: false, prefixIcon: Icon(
                  Icons.mail_outline_rounded,
                  color: Theme.of(context).colorScheme.background,
                ),),
                SizedBox(height: 30,),
                Reg_field(controller: passwordController, hintText: 'Password', obsecureText: true, prefixIcon: Icon(
                  Icons.lock,
                  color: Theme.of(context).colorScheme.background,
                ),),
                SizedBox(height: 20,),
                Text('Forgot your password?',style: TextStyle(fontWeight: FontWeight.normal, decoration: TextDecoration.underline),),
                SizedBox(height: 30,),
                 GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Bottom_Naviagator(),));
                },
                child: Container(
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30), color: Color_const.myButton),
                  child: Center(
                      child: Text(
                    'Login',
                    style: GoogleFonts.aDLaMDisplay(fontSize: 24),
                  )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[700],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Or",
                        style: GoogleFonts.aDLaMDisplay(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              
              Row(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don’t have an account yet?',style: GoogleFonts.aDLaMDisplay(fontSize: 16),),
                  TextButton( onPressed: () {
                    
                  },
                    child: TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Register(),));
                    },
                      child: Text('Register',style: GoogleFonts.aDLaMDisplay(color: Color_const.myButton,fontSize: 16,decoration: TextDecoration.underline),)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}