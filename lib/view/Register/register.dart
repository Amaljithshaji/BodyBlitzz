import 'package:bodyblitz/utills/constant/colors_constant/colors_const.dart';
import 'package:bodyblitz/view/Register/Componets/reg_field.dart';
import 'package:bodyblitz/view/Register/login.dart';
import 'package:bodyblitz/view/Register/setup/profile_setup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final fname_controller = TextEditingController();
  final lname_controller = TextEditingController();
  final mail_controller = TextEditingController();
  final password_controller = TextEditingController();
  GlobalKey<FormState> mailformKey = GlobalKey<FormState>();
  GlobalKey<FormState> passKey = GlobalKey<FormState>();
  GlobalKey<FormState> lnameKey = GlobalKey<FormState>();
  GlobalKey<FormState> fnameKey = GlobalKey<FormState>();

  bool values = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 6.h,
            ),
            Center(
                child: Text(
              "Hy There",
              style: GoogleFonts.aDLaMDisplay(fontSize: 20),
            )),
            Center(
                child: Text(
              "Create An Account",
              style: GoogleFonts.aDLaMDisplay(fontSize: 24),
            )),
            SizedBox(
              height: 2.h,
            ),
            Form(
              key: mailformKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      validator: (Value) {
                        if (fname_controller.text.isNotEmpty) {
                          return null;
                        } else {
                          return 'Enter First Name';
                        }
                      },
                      controller: fname_controller,
                      obscureText: false,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          hintText: 'First Name',
                          prefixIcon: Icon(
                            Icons.person,
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
                    height: 2.5.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      validator: (Value) {
                        if (lname_controller.text.isNotEmpty) {
                          return null;
                        } else {
                          return 'Enter Last name';
                        }
                      },
                      controller: lname_controller,
                      obscureText: false,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          hintText: 'Last name',
                          prefixIcon: Icon(
                            Icons.person,
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
                    height: 2.5.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      validator: (Value) {
                        if (mail_controller.text.contains('@gmail.com')) {
                          return null;
                        } else {
                          return 'invalid Email id';
                        }
                      },
                      controller: mail_controller,
                      obscureText: false,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          hintText: 'Email id',
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
                    height: 2.5.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      validator: (Value) {
                        if (password_controller.text.length >= 8) {
                          return null;
                        } else {
                          return 'password must be more than 8 characters';
                        }
                      },
                      controller: password_controller,
                      obscureText: true,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          hintText: 'password',
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
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Checkbox(
                  value: values,
                  activeColor: Color_const.myButton,
                  onChanged: (value) {
                    setState(() {
                      values = value!;
                    });
                  },
                ),
                Container(
                    width: 330,
                    child: Text(
                      'By continuing you accept our Privacy Policy and Term of Use',
                      style: GoogleFonts.aDLaMDisplay(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ))
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            InkWell(
              onTap: () async {
                final SharedPreferences Logincred =
                    await SharedPreferences.getInstance();
                Logincred.setString('mail', mail_controller.text);
                Logincred.setString('pasword', password_controller.text);
                Logincred.setString('last_name', lname_controller.text);
                Logincred.setString('first_name', fname_controller.text);
                if (mailformKey.currentState!.validate()) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Setup_Screen(),
                      ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('error'),
                    duration: Duration(seconds: 2),
                  ));
                }
              },
              child: Container(
                width: 250,
                height: 7.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color_const.myButton),
                child: Center(
                    child: Text(
                  'Register',
                  style: GoogleFonts.aDLaMDisplay(fontSize: 24,color: Color_const.myWhite),
                )),
              ),
            ),
            SizedBox(
              height: 3.h,
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
            //  SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: GoogleFonts.aDLaMDisplay(fontSize: 16),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Text(
                      'Login',
                      style: GoogleFonts.aDLaMDisplay(
                          color: Color_const.myButton,
                          fontSize: 16,
                          decoration: TextDecoration.underline),
                    ))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
