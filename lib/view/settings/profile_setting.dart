import 'package:bodyblitz/utills/constant/colors_constant/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Profile_Setting extends StatefulWidget {
  const Profile_Setting({super.key});

  @override
  State<Profile_Setting> createState() => _Profile_SettingState();
}

class _Profile_SettingState extends State<Profile_Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile Setting',
          style: GoogleFonts.aDLaMDisplay(fontSize: 24),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              width: 200,
              height: 27.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.primary,
                  border: Border.all(color: Color_const.myButton, width: 3)),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 17,
                    decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)),color: Color_const.myButton,),
                    child: Center(child: Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Text('Profile Picture',style: TextStyle(fontSize: 13),),
                    )),
                  ),
                  Container(
                      width: 200,
              height: 23.6.h,
                    child: Image.asset('assets/img/avatar1.png')),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          'Update your Profile Picture',
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.normal,
              color: Colors.grey.shade500),
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
          width: double.infinity,
          height: 32.h,
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemCount: 6,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 8.h,
                      backgroundColor: Color_const.myButton,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: ShapeDecoration(
                              shape: CircleBorder(),
                              color: Colors.grey.shade400,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/img/avatar1.png'))),
                        ),
                      ),
                    ),
                  )),
        ),
        Container(
          width: 250,
          height: 6.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.transparent,
          ),
          child: Center(
              child: Text(
            'Cancel',
            style: GoogleFonts.aDLaMDisplay(
                fontSize: 28,
                
                fontWeight: FontWeight.normal),
          )),
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          width: 350,
          height: 6.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Color_const.myButton,
          ),
          child: Center(
              child: Text(
            'Save Changes',
            style: GoogleFonts.aDLaMDisplay(fontSize: 28,color: Colors.white),
          )),
        )
      ]),
    );
  }
}
