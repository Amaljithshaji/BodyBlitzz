import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'Skleton.dart';

class Fastworkout extends StatefulWidget {
  const Fastworkout({
    super.key,
  });

  @override
  State<Fastworkout> createState() => _FastworkoutState();
}

class _FastworkoutState extends State<Fastworkout> {
  @override
  void initState() {
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        //color: Colors.amber,
        height: MediaQuery.of(context).size.height * 0.5,
        child: ListView.builder(
          itemCount: 6,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              ),
          child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                'assets/img/advanced abs.jpg',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  color: Colors.red,
                                  child: Text(
                                    '4 MIN Tabata',
                                    style:
                                        GoogleFonts.aDLaMDisplay(fontSize: 16),
                                  )),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height: 140,
                                  color: Colors.red,
                                  child: Text(
                                    '4 min . Beginner',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade700),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('data'),
                          Icon(Icons.more_vert)
                        ],
                      ),
                    )
                  ],
                )),
          ),
    ),
        ),
    ]);
  }
}



//  Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: MediaQuery.of(context).size.width * 0.01),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Container(
//                             width: MediaQuery.of(context).size.width * 0.4,
//                             height: MediaQuery.of(context).size.height * 0.2,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(15),
//                               child: Image.asset(
//                                 'assets/img/advanced abs.jpg',
//                                 fit: BoxFit.fill,
//                               ),
//                             ),
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.5,
//                                   color: Colors.red,
//                                   child: Text(
//                                     '4 MIN Tabata',
//                                     style:
//                                         GoogleFonts.aDLaMDisplay(fontSize: 16),
//                                   )),
//                               SizedBox(
//                                 height: 1.h,
//                               ),
//                               Container(
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.5,
//                                   height: 140,
//                                   color: Colors.red,
//                                   child: Text(
//                                     '4 min . Beginner',
//                                     style: TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.grey.shade700),
//                                   )),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('data'),
//                           Icon(Icons.more_vert)
//                         ],
//                       ),
//                     )
//                   ],
//                 )),