import 'package:bodyblitz/controller/home.controller.dart';
import 'package:bodyblitz/utills/Database/avatardata.dart';
import 'package:bodyblitz/utills/constant/colors_constant/colors_const.dart';
//import 'package:bodyblitz/view/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../bottomNavigation/Bottomnavigator.dart';

class Profile_Setting extends StatefulWidget {
  const Profile_Setting({super.key,required this.oldpro});
  final String oldpro;

  @override
  State<Profile_Setting> createState() => _Profile_SettingState();
}

class _Profile_SettingState extends State<Profile_Setting> {
  var imagedata;
  var newprofile;
  

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<WorkoutController>(context);
    controller.loadData();
    if(controller.getValues['gender'] == 'Male'){
     imagedata = AvatarDatabase().maledata;
   }else {
    imagedata = AvatarDatabase().femaledata;
   }
   var profile = controller.getValues['profile'].toString();
   
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
           controller.setData('profile', widget.oldpro);
            print(controller.getValues['profile']);
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new)),
        centerTitle: true,
        title: Text(
          'Profile Setting',
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 24),
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
                    child: Image.asset(profile)),
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
                    child: InkWell(
                      onTap: (){
                          controller.setData('profile', imagedata[index]);
            print(controller.getValues['profile']);
                      // setState(() {
                      //   profile = imagedata[index];
                      //    newprofile = imagedata[index];
                      //   print(imagedata[index]);
                      // });
                      },
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
                                    image: AssetImage(imagedata[index]))),
                          ),
                        ),
                      ),
                    ),
                  )),
        ),
        InkWell(
          onTap: (){
              controller.setData('profile', widget.oldpro);
             print(controller.getValues['profile']);
            Navigator.pop(context);
          },
          child: Container(
            width: 250,
            height: 6.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.transparent,
            ),
            child: Center(
                child: Text(
              'Cancel',
              style: GoogleFonts.roboto(
                  fontSize: 28,
                  
                  fontWeight: FontWeight.normal),
            )),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        InkWell(
          onTap: (){
           Navigator.pop(context);
          },
          child: Container(
            width: 350,
            height: 6.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color_const.myButton,
            ),
            child: Center(
                child: Text(
              'Save Changes',
              style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.white),
            )),
          ),
        )
      ]),
    );
  }
}
