import 'package:bodyblitz/controller/home.controller.dart';
import 'package:bodyblitz/utills/constant/colors_constant/colors_const.dart';
import 'package:bodyblitz/view/discover/Compoents/Skleton.dart';
import 'package:bodyblitz/view/discover/Compoents/Skleton1.dart';
import 'package:bodyblitz/view/discover/Compoents/fastworkout.dart';
import 'package:bodyblitz/view/discover/Compoents/stretch.dart';
import 'package:bodyblitz/view/discover/Detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Detail1.dart';


class Discover_Screen extends StatefulWidget {
  const Discover_Screen({super.key});

  @override
  State<Discover_Screen> createState() => _Discover_ScreenState();
}

class _Discover_ScreenState extends State<Discover_Screen> {
  @override
  void initState() {
    Provider.of<WorkoutController>(context, listen: false).healthdata();
    Provider.of<WorkoutController>(context, listen: false).sportsdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<WorkoutController>(context);
    var SelectValue;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: RefreshIndicator(
          onRefresh: () async {
            await controller.healthdata();
            await controller.sportsdata();
          },
          color: Color_const.myButton,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: Text(
                  'THE NEWS',
                  style: GoogleFonts.aDLaMDisplay(fontSize: 28),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('SPORTS NEWS',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.aDLaMDisplay(fontSize: 24)),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.builder(
                  itemCount: controller.responsedata1?.articles?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => controller.isloading
                      ? Skleton1()
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Detail1(itemIndex: index,),));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: controller.responsedata1
                                                ?.articles?[index].urlToImage ==
                                            null
                                        ? Image.asset(
                                            'assets/img/nodata.jpg',
                                            fit: BoxFit.fill,
                                            width: double.infinity,
                                            height: 300,
                                          )
                                        : AspectRatio(
                                            aspectRatio: 1.6,
                                            child: BlurHash(
                                              hash:
                                                  'LCF=Ha039v=^01~9D+NH?FR+e.R*',
                                              image: controller
                                                      .responsedata1
                                                      ?.articles?[index]
                                                      .urlToImage
                                                      .toString() ??
                                                  '',
                                            ),
                                          ),
                                  ),
                                ),
                                Positioned(
                                  top: 120,
                                  left: 10,
                                  child: Container(
                                      width:
                                          MediaQuery.of(context).size.width * 0.5,
                                      child: controller.responsedata1
                                                  ?.articles?[index].urlToImage ==
                                              null
                                          ? Text(
                                              '',
                                              style:
                                                  TextStyle(color: Colors.white),
                                            )
                                          : Text(
                                              controller.responsedata1
                                                      ?.articles?[index].author
                                                      .toString() ??
                                                  "title",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold))),
                                ),
                                Positioned(
                                  bottom: 25,
                                  left: 10,
                                  child: Container(
                                      width:
                                          MediaQuery.of(context).size.width * 0.5,
                                      height: MediaQuery.of(context).size.height *
                                          0.1,
                                      child: controller.responsedata1
                                                  ?.articles?[index].urlToImage ==
                                              null
                                          ? Text(
                                              '',
                                              style:
                                                  TextStyle(color: Colors.white),
                                            )
                                          : Text(
                                              controller.responsedata1
                                                      ?.articles?[index].title
                                                      .toString() ??
                                                  "title",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700))),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Container(
                                      width:
                                          MediaQuery.of(context).size.width * 0.5,
                                      child: controller.responsedata1
                                                  ?.articles?[index].urlToImage ==
                                              null
                                          ? Text(
                                              '',
                                              style:
                                                  TextStyle(color: Colors.white),
                                            )
                                          : Text(
                                              controller
                                                      .responsedata1
                                                      ?.articles?[index]
                                                      .publishedAt
                                                      .toString() ??
                                                  "title",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.normal))),
                                )
                              ]),
                            ),
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('HEALTH NEWS',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.aDLaMDisplay(fontSize: 24)),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  //color: Colors.amber,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.responsedata?.articles?.length ?? 0,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => controller.isloading
                        ? Skleton()
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(itemIndex: index),));
                              },
                              child: Container(
                                  height: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.01),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.2,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: controller
                                                            .responsedata
                                                            ?.articles?[index]
                                                            .urlToImage ==
                                                        null
                                                    ? Image.asset(
                                                        'assets/img/nodata.jpg',
                                                        fit: BoxFit.fill,
                                                        width: double.infinity,
                                                        height: 300,
                                                      )
                                                    : AspectRatio(
                                                        aspectRatio: 1.6,
                                                        child: BlurHash(
                                                          hash:
                                                              'LCF=Ha039v=^01~9D+NH?FR+e.R*',
                                                          image: controller
                                                                  .responsedata
                                                                  ?.articles?[
                                                                      index]
                                                                  .urlToImage
                                                                  .toString() ??
                                                              '',
                                                        ),
                                                      ),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.5,
                                                        height: MediaQuery.of(context).size.height*0.03,
                                                    child: controller
                                                                .responsedata
                                                                ?.articles?[index]
                                                                .urlToImage ==
                                                            null
                                                        ? Text(
                                                            '',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.white),
                                                          )
                                                        : Text(
                                                            controller
                                                                    .responsedata
                                                                    ?.articles?[
                                                                        index]
                                                                    .author
                                                                    .toString() ??
                                                                "title",
                                                            style: GoogleFonts
                                                                .aDLaMDisplay(
                                                                    fontSize: 16),
                                                          )),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Container(
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.5,
                                                    height: 140,
                                                    child: controller
                                                                .responsedata
                                                                ?.articles?[index]
                                                                .urlToImage ==
                                                            null
                                                        ? Text(
                                                            '',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.white),
                                                          )
                                                        : Text(
                                                            controller
                                                                    .responsedata
                                                                    ?.articles?[
                                                                        index]
                                                                    .title
                                                                    .toString() ??
                                                                "title",
                                                            style: GoogleFonts
                                                                .aDLaMDisplay(
                                                              fontSize: 20,
                                                            ),
                                                          )),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            controller
                                                        .responsedata
                                                        ?.articles?[index]
                                                        .urlToImage ==
                                                    null
                                                ? Text(
                                                    '',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                : Text(
                                                    controller
                                                            .responsedata
                                                            ?.articles?[index]
                                                            .publishedAt
                                                            .toString() ??
                                                        "title",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                           DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          value: SelectValue,
                                          elevation: 0,
                                          iconEnabledColor: Colors.black,
                                          focusColor: Colors.black,
                                          dropdownColor:
                                              Color.fromARGB(255, 21, 21, 21),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          enableFeedback: true,
                                          items: [
                                            DropdownMenuItem<String>(
                                              enabled: false,
                                              child: TextButton(
                                                onPressed: () {
                                                  launchUrl(
                                                      Uri.parse(controller
                                                              .responsedata
                                                              ?.articles?[index]
                                                              .url
                                                              .toString() ??
                                                          ''),
                                                      mode: LaunchMode
                                                          .inAppWebView);
                                                },
                                                child: Text(
                                                  'Read more',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              value: 'read more',
                                            ),
                                            DropdownMenuItem<String>(
                                              child: TextButton(
                                                onPressed: () {
                                                  Share.share(controller
                                                          .responsedata
                                                          ?.articles?[index]
                                                          .url
                                                          .toString() ??
                                                      "www.google.com");
                                                },
                                                child: Text(
                                                  'Share',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              value: 'Share',
                                            )
                                          ],
                                          onChanged: (newValue) {
                                            SelectValue = newValue;
                                            setState(() {});
                                          },
                                          icon: Icon(
                                            Icons.more_vert,
                                            color: Colors.white,
                                            size: 20,
                                          ),)
                                        )],
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                  ),
                ),
              ])
            ],
          ),
        ));
  }
}
