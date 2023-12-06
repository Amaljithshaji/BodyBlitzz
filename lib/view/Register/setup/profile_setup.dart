import 'package:bodyblitz/view/Register/Componets/reg_field.dart';
import 'package:bodyblitz/view/Register/login.dart';
import 'package:bodyblitz/view/Register/setup/Filtter_Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../utills/constant/colors_constant/colors_const.dart';

class Setup_Screen extends StatefulWidget {
  const Setup_Screen({super.key});

  @override
  State<Setup_Screen> createState() => _Setup_ScreenState();
}

class _Setup_ScreenState extends State<Setup_Screen> {
  final date_controller = TextEditingController();

  final _weightController = TextEditingController();

  var dropdownvalue;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 35.h,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Image.asset(dropdownvalue == 'Male'
                      ? 'assets/img/setupimage1.png'
                      : 'assets/img/setupimage.png')),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'Let’s complete your profile',
                style: GoogleFonts.aDLaMDisplay(fontSize: 24),
              ),
              Text('It will help us to know more about you!'),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 360,
                height: 8.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.group,
                        color: Theme.of(context).colorScheme.background,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton(
                          style: TextStyle(color:  Theme.of(context).colorScheme.background),
                          hint: Text(
                            'Choose Gender',
                            style: TextStyle(color: Theme.of(context).colorScheme.background),
                          ),
                          dropdownColor: Colors.grey.shade200,
                          value: dropdownvalue,
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                             color: Theme.of(context).colorScheme.background,
                          ),
                          items: [
                            DropdownMenuItem<String>(
                              child: InkWell(child: Text('Male')),
                              value: 'Male',
                            ),
                            DropdownMenuItem<String>(
                              child: Text('Female'),
                              value: 'Female',
                            ),
                          ],
                          onChanged: (newValue) {
                            setState(() {
                              dropdownvalue = newValue;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Reg_field(
                controller: date_controller,
                hintText: 'Date',
                obsecureText: false,
                prefixIcon: IconButton(
                    onPressed: () => _showDatePicker(context),
                    icon: Icon(
                      Icons.date_range_sharp,
                       color: Theme.of(context).colorScheme.background,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 300,
                    child: Reg_field(
                        controller: _weightController,
                        hintText: 'Your Weight',
                        obsecureText: false,
                        prefixIcon: ImageIcon(
                          AssetImage('assets/img/weight-scale 1.png'),
                           color: Theme.of(context).colorScheme.background,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 80,
                      height: 58,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color_const.myButton,
                      ),
                      child: Center(
                          child: Text(
                        'Kg',
                        style: GoogleFonts.aDLaMDisplay(fontSize: 20,color: Color_const.myWhite),
                      )),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 300,
                    child: Reg_field(
                        controller: _weightController,
                        hintText: 'Your Height',
                        obsecureText: false,
                        prefixIcon: Icon(
                          Icons.height,
                          color: Theme.of(context).colorScheme.background,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 80,
                      height: 58,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color_const.myButton,
                      ),
                      child: Center(
                          child: Text(
                        'CM',
                        style: GoogleFonts.aDLaMDisplay(fontSize: 20,color: Color_const.myWhite),
                      )),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                },
                child: InkWell(onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Filtter_Screen(),));
                },
                  child: Container(
                    width: 60.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color_const.myButton),
                    child: Center(
                        child: Text(
                      'Next',
                      style: GoogleFonts.aDLaMDisplay(fontSize: 24,color: Color_const.myWhite),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDatePicker(BuildContext context ) async {
    // Hide the keyboard if it is shown
    FocusScope.of(context).requestFocus(FocusNode());

    // Get the selected date from the date picker
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    // If the user selected a date, update the text field with the formatted date
    if (selectedDate != null) {
      setState(() {
        // Use the intl package to format the date

        date_controller.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }
}
