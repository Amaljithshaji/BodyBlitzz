import 'package:bodyblitz/utills/constant/colors_constant/colors_const.dart';
import 'package:bodyblitz/view/Register/Componets/reg_field.dart';
import 'package:bodyblitz/view/Register/login.dart';
import 'package:bodyblitz/view/Register/setup/profile_setup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  bool values = false;
  @override
  Widget build(BuildContext context) {
    final iskeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [
            
           if (!iskeyboard) Center(
              child: 
              Container(height: 200,
                child: Image.asset('assets/img/Reg_logo.png',)),
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
              height: 20,
            ),
            Reg_field(
              controller: fname_controller,
              hintText: 'First name',
              obsecureText: false,
              prefixIcon: Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.background,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Reg_field(
              controller: lname_controller,
              hintText: 'Last name',
              obsecureText: false,
              prefixIcon: Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.background,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Reg_field(
              controller: mail_controller,
              hintText: 'Email id',
              obsecureText: false,
              prefixIcon: Icon(
                Icons.mail_outline_rounded,
                color: Theme.of(context).colorScheme.background,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Reg_field(
              controller: password_controller,
              hintText: 'password',
              obsecureText: true,
              prefixIcon: Icon(
                Icons.lock,
                color: Theme.of(context).colorScheme.background,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(width: 10,),
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
              height: 25,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Setup_Screen(),));
              },
              child: Container(
                width: 250,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), color: Color_const.myButton),
                child: Center(
                    child: Text(
                  'Register',
                  style: GoogleFonts.aDLaMDisplay(fontSize: 24),
                )),
              ),
            ),
            SizedBox(
              height: 25,
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
            Row(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?',style: GoogleFonts.aDLaMDisplay(fontSize: 16),),
                TextButton( onPressed: () {
                  
                },
                  child: TextButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  },
                    child: Text('Login',style: GoogleFonts.aDLaMDisplay(color: Color_const.myButton,fontSize: 16,decoration: TextDecoration.underline),)))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
