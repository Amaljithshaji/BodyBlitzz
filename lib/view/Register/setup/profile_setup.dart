import 'package:bodyblitz/controller/home.controller.dart';
//mport 'package:bodyblitz/view/Register/Componets/reg_field.dart';
import 'package:bodyblitz/view/Register/login.dart';
import 'package:bodyblitz/view/Register/setup/Filtter_Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../utills/constant/colors_constant/colors_const.dart';
import '../../bottomNavigation/Bottomnavigator.dart';

class Setup_Screen extends StatefulWidget {
  const Setup_Screen({super.key});

  @override
  State<Setup_Screen> createState() => _Setup_ScreenState();
}

class _Setup_ScreenState extends State<Setup_Screen> {
  final date_controller = TextEditingController();

  var dropdownvalue;
  var profilepic;
  @override
  void initState() {
  
    super.initState();
  }
  bool Male = false;
  bool Female = false;

  @override
  Widget build(BuildContext context) {
    var addcontroll = Provider.of<WorkoutController>(context);
    addcontroll.loadData();
    return Scaffold(
       appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Filtter_Screen(),
                  ));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color_const.myButton,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Bottom_Naviagator(),));
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(color: Color_const.myButton, fontSize: 16),
                    ))),
          )
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Center(
            child: Container(
                width: 300,
                child: Text(
                  "what's your gender?",
                  style: GoogleFonts.aDLaMDisplay(
                    fontSize: 28,
                  ),
                  textAlign: TextAlign.center,
                ))),
            SizedBox(
              height: 2.h,
            ),
            Container(
                height: 57.h,
                width: double.infinity,
                color: Colors.transparent,
                child: Image.asset(dropdownvalue == 'Male'
                    ? 'assets/img/male.png'
                    : 'assets/img/female.png')),
            SizedBox(
              height: 1.h,
            ),
           
            
          
            // Reg_field(
            //   controller: date_controller,
            //   hintText: 'Date',
            //   obsecureText: false,
            //   prefixIcon: IconButton(
            //       onPressed: () => _showDatePicker(context),
            //       icon: Icon(
            //         Icons.date_range_sharp,
            //          color: Theme.of(context).colorScheme.background,
            //       )),
            // ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Ink(
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              dropdownvalue = 'Male';
                              profilepic = 'assets/img/m5avatar.png';
                              Male = true;
                              Female = false;
                            });
                          },
                          child: Container(
                            width: 170,
                            height: 8.h,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                            border: Border.all(color:  Male == true ? Color_const.myButton : Colors.transparent,width: 2)),
                             child: Center(child: Text('Male',style: GoogleFonts.aDLaMDisplay(fontSize: 24),)),
                          ),
                        ),
                      ),
                      Positioned(top: 10,right: 10,
                        child: Icon(Icons.check_circle_rounded,color:  Male == true ? Color_const.myButton : Colors.transparent,))
                    ],
                  ),
                  Stack(
                    children: [
                      Ink(
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              dropdownvalue = 'Female';
                              profilepic ='assets/img/f2avatar.png';
                              Female = true;
                              Male = false;
                            });
                          },
                          child: Container(
                            width: 170,
                            height: 8.h,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Female == true ? Color_const.myButton : Colors.transparent,width: 2)),
                             child: Center(child: Text('Female',style: GoogleFonts.aDLaMDisplay(fontSize: 24),)),
                          ),
                        ),
                      ),
                      Positioned(top: 10,right: 10,
                        child: Icon(Icons.check_circle_rounded,color:  Female == true ? Color_const.myButton : Colors.transparent,))
                    ],
                  ),
                ],
              ),
            ),
            
            SizedBox(
              height: 20,
            ),
             
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                },
                child: InkWell(onTap: () async{
                  final gender = dropdownvalue;
                  final profile = profilepic;
                 await addcontroll.setData('gender', gender);
                 await addcontroll.setData('profile',profile);
                  print(addcontroll.getValues['profile']);
                  print(addcontroll.getValues['gender']);
                 
                
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Filtter_Screen(),));
                },
                  child: Container(
                    width: 300,
                    height: 7.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color_const.myButton),
                    child: Center(
                        child: Text(
                      'Next',
                      style: GoogleFonts.aDLaMDisplay(fontSize: 28,color: Colors.white),
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void _showDatePicker(BuildContext context ) async {
  //   // Hide the keyboard if it is shown
  //   FocusScope.of(context).requestFocus(FocusNode());

  //   // Get the selected date from the date picker
  //   final DateTime? selectedDate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime.now(),
  //   );

  //   // If the user selected a date, update the text field with the formatted date
  //   if (selectedDate != null) {
  //     setState(() {
  //       // Use the intl package to format the date

  //       date_controller.text = DateFormat.yMd().format(selectedDate);
  //     });
  //   }
  // }
}
