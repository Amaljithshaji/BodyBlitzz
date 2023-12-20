import 'package:bodyblitz/controller/home.controller.dart';
import 'package:bodyblitz/utills/constant/colors_constant/colors_const.dart';
import 'package:bodyblitz/view/settings/profile_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class Settings_Screen extends StatefulWidget {
  const Settings_Screen({super.key});

  @override
  State<Settings_Screen> createState() => _Settings_ScreenState();
}

class _Settings_ScreenState extends State<Settings_Screen> {
  @override
  void initState() {
    getdata();
  var controller = Provider.of<WorkoutController>(context,listen: false);
    controller.loadData();
    super.initState();
  }

  String? first_name;
  String? last_name;
  Future<void> getdata() async {
    final SharedPreferences Logincred = await SharedPreferences.getInstance();
    setState(() {
      first_name = Logincred.getString('first_name');
      print(first_name);
      last_name = Logincred.getString('last_name');
      print(last_name);
    });
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<WorkoutController>(context);
    controller.loadData();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile_Setting(oldpro: controller.getValues['profile'].toString(),)));
              },
              child: Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 9.h,
                      backgroundColor: Color_const.myButton,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: ShapeDecoration(
                              shape: CircleBorder(),
                              color: Colors.white,
                              image: DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: AssetImage(controller.getValues['profile'].toString()))),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Color_const.myButton,
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),
            ),
            Center(
                child: Text(
              'hy $first_name $last_name',
              style: GoogleFonts.aDLaMDisplay(fontSize: 24),
            )),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Workout',
                style: GoogleFonts.aDLaMDisplay(fontSize: 28),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height* 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Row(
                     
                      children: [
                        Column(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Icon(Icons.person, color: Colors.black),
                           Icon(Icons.av_timer, color: Colors.black),
                               Icon(Icons.forward_5, color: Colors.black),
                             Icon(Icons.monitor_weight_outlined,color: Colors.black),
                             Icon(Icons.monitor_weight_outlined,color: Colors.black)
                             
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3, left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                            // physics: NeverScrollableScrollPhysics(),
                            children: [
                              InkWell(
                                onTap: () {
                                  _Showgender();
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                   
                                    Text(
                                      'Gender',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              
                              InkWell(
                                onTap: () {
                                  _showCustomDialogRest(context);
                                },
                                child: Container(
                                  
                                  width: MediaQuery.of(context).size.width *0.7,
                                  child: Row(
                                  
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                     
                                      Text(
                                        'Training Rest',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                     
                                      Text(
                                        '30 sec',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Color_const.myButton),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              
                              InkWell(
                                onTap: () {
                                  _showCustomDialog(context);
                                },
                                child: Container(
                                   
                                  width: MediaQuery.of(context).size.width *0.7,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                     
                                      Text(
                                        'Countdown Time',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                      
                                      Text(
                                        '30 sec',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Color_const.myButton),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                             
                              InkWell(
                                onTap: () {
                                  _ShowWeight();
                                },
                                child: Container(
                                   
                                  width: MediaQuery.of(context).size.width *0.7,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      
                                      Text(
                                        'Weight ı Height',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                      
                                      Text(
                                        " ${controller.getValues['weight']} Kg ı ${controller.getValues['height']} Cm",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Color_const.myButton),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            
                              InkWell(
                                onTap: () {
                                  _ShowTargetweight();
                                },
                                child: Container(
                                   
                                  width: MediaQuery.of(context).size.width *0.7,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      
                                      Text(
                                        'Target Weight',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                      
                                      Text(
                                        '15 Kg',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Color_const.myButton),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                             
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  width: 90.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Icon(Icons.favorite_border_outlined,
                                  color: Colors.black),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Share with Friends',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Icon(Icons.thumb_up_alt_outlined,
                                  color: Colors.black),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Rate us',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Icon(Icons.feedback_outlined, color: Colors.black),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Feedback',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Icon(Icons.security_outlined, color: Colors.black),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Privacy Policy',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }

  _ShowWeight() {
    RulerPickerController? _rulerPickerController;
    RulerPickerController? _rulerPickerController1;
    var height = Provider.of<WorkoutController>(context,listen: false).getValues['height'].toString();
    var weight = Provider.of<WorkoutController>(context,listen: false).getValues['weight'].toString();
    num currentValue = int.parse(height);
    num currentValue1 = int.parse(weight);

    List<RulerRange> ranges = const [
      RulerRange(begin: 0, end: 249, scale: 1),
    ];
    List<RulerRange> ranges1 = const [
      RulerRange(begin: 0, end: 249, scale: 1),
    ];
  

    _rulerPickerController = RulerPickerController(value: currentValue);
    _rulerPickerController1 = RulerPickerController(value: currentValue1);
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (contex) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                var controller = Provider.of<WorkoutController>(context);
                controller.loadData();
               
            return Container(
              height: 64.h,
              width: double.infinity,
              child: Column(children: [
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'Enter Details',
                  style: GoogleFonts.aDLaMDisplay(fontSize: 24),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Height',
                        style: GoogleFonts.aDLaMDisplay(fontSize: 24),
                      ),
                      Container(
                        width: 60,
                        height: 5.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color_const.myButton,
                        ),
                        child: Center(
                            child: Text('CM',
                                style: GoogleFonts.aDLaMDisplay(
                                    fontSize: 24, color: Colors.white))),
                      )
                    ],
                  ),
                ),
                RulerPicker(
                  rulerBackgroundColor: Colors.transparent,
                  controller: _rulerPickerController!,
                  onBuildRulerScaleText: (index, value) {
                    return value.toInt().toString();
                  },
                  ranges: ranges,

                  scaleLineStyleList: const [
                    ScaleLineStyle(
                        color: Colors.grey, width: 1.5, height: 40, scale: 0),
                    ScaleLineStyle(
                        color: Colors.grey, width: 1, height: 25, scale: 5),
                    ScaleLineStyle(
                        color: Colors.grey, width: 1, height: 15, scale: -1)
                  ],

                  onValueChanged: (value) {
                    setState(() {
                      currentValue = value;
                    });
                  },
                  width: MediaQuery.of(context).size.width,
                  height: 8.h,
                  rulerMarginTop: 10,
                  // marker: Container(
                  //     width: 8,
                  //     height: 50,
                  //     decoration: BoxDecoration(
                  //         color: Colors.red.withAlpha(100),
                  //         borderRadius: BorderRadius.circular(5))),
                ),
                Text(
                  '${currentValue.toStringAsFixed(1)} CM',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Weight',
                        style: GoogleFonts.aDLaMDisplay(fontSize: 24),
                      ),
                      Container(
                        width: 60,
                        height: 5.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color_const.myButton,
                        ),
                        child: Center(
                            child: Text('KG',
                                style: GoogleFonts.aDLaMDisplay(
                                    fontSize: 24, color: Colors.white))),
                      )
                    ],
                  ),
                ),
                RulerPicker(
                  rulerBackgroundColor: Colors.transparent,
                  controller: _rulerPickerController1!,
                  onBuildRulerScaleText: (index, value) {
                    return value.toInt().toString();
                  },
                  ranges: ranges1,

                  scaleLineStyleList: const [
                    ScaleLineStyle(
                        color: Colors.grey, width: 1.5, height: 40, scale: 0),
                    ScaleLineStyle(
                        color: Colors.grey, width: 1, height: 25, scale: 5),
                    ScaleLineStyle(
                        color: Colors.grey, width: 1, height: 15, scale: -1)
                  ],

                  onValueChanged: (value) {
                    setState(() {
                      currentValue1 = value;
                    });
                  },
                  width: MediaQuery.of(context).size.width,
                  height: 8.h,
                  rulerMarginTop: 10,
                  // marker: Container(
                  //     width: 8,
                  //     height: 50,
                  //     decoration: BoxDecoration(
                  //         color: Colors.red.withAlpha(100),
                  //         borderRadius: BorderRadius.circular(5))),
                ),
                Text(
                  '${currentValue1.toStringAsFixed(1)} KG',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: 1.h,
                ),
                InkWell(
                  onTap: ()=>Navigator.pop(context),
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
                      style: GoogleFonts.aDLaMDisplay(fontSize: 24),
                    )),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                InkWell(
                  onTap: () async{
                    Navigator.pop(context);
                     final weight =  currentValue1.toStringAsFixed(0);
                final height =  currentValue.toStringAsFixed(0);
                await controller.setData('height', height);
                await controller.setData('weight',weight );
                 print(controller.getValues['height']);
                 print(controller.getValues['weight']);
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
                      style: GoogleFonts.aDLaMDisplay(
                          fontSize: 24, color: Colors.white),
                    )),
                  ),
                )
              ]),
            );
          });
        });
  }

  _ShowTargetweight() {
    RulerPickerController? _rulerPickerController;
    num currentValue = 50;
    List<RulerRange> ranges = const [
      RulerRange(begin: 0, end: 249, scale: 1),
    ];
    _rulerPickerController = RulerPickerController(value: currentValue);
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (contex) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              child: Column(children: [
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'Enter Details',
                  style: GoogleFonts.aDLaMDisplay(fontSize: 24),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Weight',
                        style: GoogleFonts.aDLaMDisplay(fontSize: 24),
                      ),
                      Container(
                        width: 60,
                        height: 5.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color_const.myButton,
                        ),
                        child: Center(
                            child: Text('KG',
                                style: GoogleFonts.aDLaMDisplay(
                                    fontSize: 24, color: Colors.white))),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                RulerPicker(
                  rulerBackgroundColor: Colors.transparent,
                  controller: _rulerPickerController!,
                  onBuildRulerScaleText: (index, value) {
                    return value.toInt().toString();
                  },
                  ranges: ranges,

                  scaleLineStyleList: const [
                    ScaleLineStyle(
                        color: Colors.grey, width: 1.5, height: 40, scale: 0),
                    ScaleLineStyle(
                        color: Colors.grey, width: 1, height: 25, scale: 5),
                    ScaleLineStyle(
                        color: Colors.grey, width: 1, height: 15, scale: -1)
                  ],

                  onValueChanged: (value) {
                    setState(() {
                      currentValue = value;
                    });
                  },
                  width: MediaQuery.of(context).size.width,
                  height: 8.h,
                  rulerMarginTop: 10,
                  // marker: Container(
                  //     width: 8,
                  //     height: 50,
                  //     decoration: BoxDecoration(
                  //         color: Colors.red.withAlpha(100),
                  //         borderRadius: BorderRadius.circular(5))),
                ),
                Text(
                  '${currentValue.toStringAsFixed(1)} KG',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: 1.h,
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
                    style: GoogleFonts.aDLaMDisplay(fontSize: 24),
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
                    style: GoogleFonts.aDLaMDisplay(
                        fontSize: 24, color: Colors.white),
                  )),
                )
              ]),
            );
          });
        });
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
              child: Text(
            'Set duration (10 - 15 secs)',
            style: GoogleFonts.aDLaMDisplay(fontSize: 20),
          )),
          content: Container(
            width: 440,
            height: 14.h,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Ink(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Icon(Icons.arrow_back_ios_new),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '15',
                      style: TextStyle(fontSize: 50),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Ink(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text('secs'),
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('CANCEL'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'SET',
                style: TextStyle(color: Color_const.myButton),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showCustomDialogRest(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
              child: Text(
            'Set duration (5 ~ 180 secs)',
            style: GoogleFonts.aDLaMDisplay(fontSize: 20),
          )),
          content: Container(
            width: 440,
            height: 14.h,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Ink(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 80,
                          height: 100,
                          child: Icon(Icons.arrow_back_ios_new),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '180',
                      style: TextStyle(fontSize: 48),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Ink(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 80,
                          height: 100,
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text('secs'),
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('CANCEL'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'SET',
                style: TextStyle(color: Color_const.myButton),
              ),
            ),
          ],
        );
      },
    );
  }

  _Showgender() {
    bool isSlectedM = false;
    bool isSlectedF = false;
     var profilepic;
    String gender;
     if (Provider.of<WorkoutController>(context,listen: false).getValues['gender'] ==
                'Male') {
            
                isSlectedM = true;
                gender = 'Male';
           
            }else{
             
                isSlectedF = true;
                gender = 'Female';
            }
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (contex) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
           var addcontroll = Provider.of<WorkoutController>(context);
                addcontroll.loadData();
            return Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'Please Select your Gender',
                  style: GoogleFonts.aDLaMDisplay(fontSize: 24),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          Ink(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isSlectedM = true;
                                  isSlectedF = false;
                                  gender = "Male";
                                    profilepic = 'assets/img/m5avatar.png';
                                });
                              },
                              child: Container(
                                width: 43.w,
                                height: 25.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.shade300,
                                    border: Border.all(
                                        color: isSlectedM == true
                                            ? Color_const.myButton
                                            : Colors.transparent,
                                        width: 2)),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                     width: 43.w,
                                height: 25.h,
                              
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 80,
                                          backgroundColor: Colors.transparent,
                                          child: Image.asset(
                                            'assets/img/m5avatar.png',
                                          ),
                                        ),
                                         Text('Male',
                                  style: GoogleFonts.aDLaMDisplay(
                                      fontSize: 24, color: Colors.black))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              right: 20,
                              top: 10,
                              child: Icon(
                                Icons.check_circle_outline_rounded,
                                color: isSlectedM == true
                                    ? Color_const.myButton
                                    : Colors.transparent,
                              )),
                        
                        ],
                      ),
                      Stack(
                        children: [
                          Ink(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isSlectedM = false;
                                  isSlectedF = true;
                                  gender = "Female";
                                   profilepic ='assets/img/f2avatar.png';
                                });
                              },
                              child: Container(
                                width: 43.w,
                                height: 25.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.shade300,
                                    border: Border.all(
                                        color: isSlectedF == true
                                            ? Color_const.myButton
                                            : Colors.transparent,
                                        width: 2)),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Container(
                                     width: 41.w,
                                height: 25.h,
                             
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 80,
                                          backgroundColor: Colors.transparent,
                                          
                                          child:
                                              Image.asset('assets/img/f2avatar.png',fit: BoxFit.cover,),
                                        ),
                                        Text(
                                'Female',
                                style: GoogleFonts.aDLaMDisplay(
                                    fontSize: 24, color: Colors.black),
                              )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              right: 20,
                              top: 10,
                              child: Icon(
                                Icons.check_circle_outline_rounded,
                                color: isSlectedF == true
                                    ? Color_const.myButton
                                    : Colors.transparent,
                              )),
                          
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                  onTap: (){
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
                      style: GoogleFonts.aDLaMDisplay(fontSize: 24),
                    )),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                InkWell(
                  onTap: () async{
                    Navigator.pop(context);
                    final profile = profilepic;
                    await addcontroll.setData('profile', profile);
                    await addcontroll.setData('gender', gender);
                    print(gender);
                    print(profile);
                    print(addcontroll.getValues['profile']);
                    print(addcontroll.getValues['gender']);
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
                      style: GoogleFonts.aDLaMDisplay(
                          fontSize: 24, color: Colors.white),
                    )),
                  ),
                )
              ]),
            );
          });
        });
  }
}
