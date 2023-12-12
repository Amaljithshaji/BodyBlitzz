import 'package:bodyblitz/controller/home.controller.dart';
// import 'package:bodyblitz/model/database.dart';
import 'package:bodyblitz/utills/constant/colors_constant/colors_const.dart';
// import 'package:bodyblitz/view/Home/Home.dart';
import 'package:bodyblitz/view/Workout/workout_starter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../bottomNavigation/Bottomnavigator.dart';


class Workout_Screen extends StatefulWidget {
  const Workout_Screen({super.key, required this.Workoutlist});
  final List<Map<String, dynamic>> Workoutlist;
  @override
  State<Workout_Screen> createState() => _Workout_ScreenState();
}

class _Workout_ScreenState extends State<Workout_Screen> {

  // @override
  // void initState() {
  //  Provider.of<WorkoutController>(context,).loadWorkouts(DataBase.Workoutitems1);
  //   super.initState();
  // }
  
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<WorkoutController>(context);

    // Load the workouts when this screen is built
    controller.loadWorkouts(widget.Workoutlist);
    //  final controller = Provider.of<WorkoutController>(context);
  // final player = AudioPlayer();
  // Future<void>  playAudioFromUrl() async {
  //   await player.play(AssetSource("audio/referee-whistle-blow-gymnasium-6320.mp3"));
  // };
    var workoutz = Provider.of<WorkoutController>(context).workouts;
   // final img = Images_const();
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
        child: GestureDetector(
          onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => Workout_Starter(),));
        //  final player = AudioPlayer(); assets\audio\referee-whistle-blow-gymnasium-6320.mp3
        //  player.play(AssetSource("assets/audio/065594_coach-whistle-88613.mp3"));
       // playAudioFromUrl();
          },
          child: Container(
            width: 300,
            height: 7.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),color: Color_const.myButton
            ),
            child: Center(child: Text('Start',style: GoogleFonts.aDLaMDisplay(fontSize: 28,color: Colors.white),)),
            
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            //title:  Text('ABS BEGINNER',style: GoogleFonts.aDLaMDisplay(fontSize: 16),),
            backgroundColor: Theme.of(context).colorScheme.background,
            leading: IconButton(onPressed: () {
              _showQuitmodel();
            }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
            pinned: false,
            primary: true,
            floating: false,
            stretch: true,
            elevation: 0,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/img/six-abs.jpg',fit: BoxFit.fill,),
              title: Text('ABS BEGINNER',style: GoogleFonts.aDLaMDisplay(fontSize: 16),),
              titlePadding: EdgeInsets.only(left: 20,bottom: 30),
              collapseMode: CollapseMode.parallax,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
                children: [
                  Text('${controller.workouts.length} Workouts',style: GoogleFonts.aDLaMDisplay(fontSize: 26)),
                  Text('20 mins',style: GoogleFonts.aDLaMDisplay(fontSize: 24)),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              
              width: double.infinity,
              height: 50.h,
             
              child: ListView.separated(itemCount: workoutz.length,
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(thickness: 2,color:Colors.grey.shade500 ,),
              ),
           
           
                itemBuilder: (context, index) {
                 
                  return Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,),
                child: Container(
                  width: 300,
                  height: 100,
                //  color: Colors.red,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                      //  color: Colors.green,
                        child: Lottie.asset(workoutz[index].workoutDemo,fit: BoxFit.fill,),
                      ),
                      SizedBox(width: 35,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                        Container(
                          width: 200,
                       
                          child: Text(workoutz[index].workoutName,style: GoogleFonts.aDLaMDisplay(fontSize: 16,))),
                       if(controller.workouts[index].duration == 0) 
                        Text('${controller.workouts[index].count}X',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)) 
                       else
                       Text('00:${controller.workouts[index].duration}',style: GoogleFonts.aDLaMDisplay(fontSize: 16))
                      ])
                    ],
                  ),
                ),
                
              );
                } ),
            )
          )
        ],
      ),
    );
  }
  void _showQuitmodel() {
    showModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          height: 40.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '🙄',
                style: GoogleFonts.aDLaMDisplay(
                  fontSize: 50,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Center(
                child: Container(
                    child: Text('Are you Sure you want to Quit ?',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.aDLaMDisplay(
                          fontSize: 24,
                        ))),
              ),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Bottom_Naviagator(),
                      ));
                },
                child: Container(
                  width: 270,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color_const.myButton),
                  child: Center(
                      child: Text(
                    'Quit',
                    style: GoogleFonts.aDLaMDisplay(
                        fontSize: 24, color: Colors.white),
                  )),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {
                 
                  Navigator.pop(context);
                },
                child: Container(
                  width: 270,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color_const.myButton),
                  child: Center(
                    child: Text(
                      'Close',
                      style: GoogleFonts.aDLaMDisplay(
                          fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
