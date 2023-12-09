import 'package:bodyblitz/utills/constant/Themedata/Light_theme.dart';
import 'package:bodyblitz/utills/constant/Themedata/dark_theme.dart';
import 'package:bodyblitz/view/Register/Componets/reg_field.dart';
import 'package:bodyblitz/view/Register/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../utills/constant/colors_constant/colors_const.dart';
import '../bottomNavigation/Bottomnavigator.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    getdata();
    super.initState();
  }

  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> loginkey = GlobalKey<FormState>();
String? newmail;
String? newpass;
  Future<void> getdata() async {
    final SharedPreferences Logincred = await SharedPreferences.getInstance();
    setState(() {
    newmail = Logincred.getString('mail');
    print(newmail);
    newpass = Logincred.getString('pasword');
    print(newpass);
    });
  }

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
              SizedBox(height: 1.h),
              if (!iskeyboard)
                Center(
                  child: Container(
                      height: 30.h,
                      width: 40.w,
                      child: Image.asset(
                        'assets/img/Reg_logo.png',
                      )),
                ),
              Center(
                  child: Text(
                'Hey there,',
                style: TextStyle(fontSize: 20),
              )),
              Text(
                'Welcome Back',
                style: GoogleFonts.aDLaMDisplay(fontSize: 28),
              ),
              SizedBox(
                height: 3.h,
              ),
              Form(
                key: loginkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        validator: (value) {
                          if (mailController.text == newmail) {
                            return null;
                          } else {
                            return 'invaild Email id';
                          }
                        },
                        controller: mailController,
                        obscureText: false,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            hintText: 'mail',
                            prefixIcon: Icon(
                              Icons.mail_outline_rounded,
                              color: Theme.of(context).colorScheme.background,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(10)),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[500])),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        validator: (value) {
                          if (passwordController.text == newpass) {
                            return null;
                          } else {
                            return 'invaild Email id';
                          }
                        },
                        controller: passwordController,
                        obscureText: true,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Theme.of(context).colorScheme.background,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(10)),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[500])),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Forgot your password?',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.underline),
              ),
              SizedBox(
                height: 3.h,
              ),
              GestureDetector(
                onTap: () {

                  if(loginkey.currentState!.validate()){
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Bottom_Naviagator(),
                      ));
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Incorrect Password or Email id'),
                    duration: Duration(seconds: 2),
                  ));
                  }
                  
                },
                child: Container(
                  width: 60.w,
                  height: 7.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color_const.myButton),
                  child: Center(
                      child: Text(
                    'Login',
                    style: GoogleFonts.aDLaMDisplay(fontSize: 24,color: Color_const.myWhite),
                  )),
                ),
              ),
              SizedBox(
                height: 2.h,
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
                        style:
                            GoogleFonts.aDLaMDisplay(color: Colors.grey[700]),
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account yet?',
                    style: GoogleFonts.aDLaMDisplay(fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Register(),
                                ));
                          },
                          child: Text(
                            'Register',
                            style: GoogleFonts.aDLaMDisplay(
                                color: Color_const.myButton,
                                fontSize: 16,
                                decoration: TextDecoration.underline),
                          )))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
