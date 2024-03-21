import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skleton extends StatelessWidget {
  const Skleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                ),
            child: Column(
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
                          color: Colors.grey
                        ),
                       
                      ),
                      Column(
                        
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width:
                                  MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                              color: Colors.grey),
                              child: Text(
                                '',
                               
                              )),
                              SizedBox(height: 10,),
                         
                          Container(
                              width:
                                  MediaQuery.of(context).size.width * 0.5,
                              height: 40,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                              color: Colors.grey),
                              child: Text(
                                '',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade700),
                              )),
                              SizedBox(height: 10,),
                               Container(
                              width:
                                  MediaQuery.of(context).size.width * 0.5,
                              height: 40,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                              color: Colors.grey),
                              child: Text(
                                '',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade700),
                              )),
                              SizedBox(height: 10,),
                               Container(
                              width:
                                  MediaQuery.of(context).size.width * 0.5,
                              height: 40,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                              color: Colors.grey),
                              child: Text(
                                '',
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
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey,),
                        width: MediaQuery.of(context).size.width* 0.4,
                        height: MediaQuery.of(context).size.height* 0.04,
                        child: Center(child: Text(''))),
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.grey,),
                        width: MediaQuery.of(context).size.width* 0.06,
                        height: MediaQuery.of(context).size.height* 0.04,
                        )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}