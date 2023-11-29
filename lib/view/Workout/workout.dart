import 'package:bodyblitz/controller/home.controller.dart';
import 'package:bodyblitz/utills/constant/colors_constant/colors_const.dart';
import 'package:bodyblitz/view/Workout/workout_starter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';


class Workout_Screen extends StatefulWidget {
  const Workout_Screen({super.key});

  @override
  State<Workout_Screen> createState() => _Workout_ScreenState();
}

class _Workout_ScreenState extends State<Workout_Screen> {
  
  @override
  Widget build(BuildContext context) {
    
  // final player = AudioPlayer();
  // Future<void>  playAudioFromUrl() async {
  //   await player.play(AssetSource("audio/referee-whistle-blow-gymnasium-6320.mp3"));
  // };
    var workoutz = Provider.of<WorkoutController>(context).workouts;
   // final img = Images_const();
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => Workout_Starter(),));
        //  final player = AudioPlayer(); assets\audio\referee-whistle-blow-gymnasium-6320.mp3
        //  player.play(AssetSource("assets/audio/065594_coach-whistle-88613.mp3"));
       // playAudioFromUrl();
          },
          child: Container(
            width: 400,
            height: 8.h,
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
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
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
                  Text('16 Workouts',style: GoogleFonts.aDLaMDisplay(fontSize: 16)),
                  Text('20 mins',style: GoogleFonts.aDLaMDisplay(fontSize: 16)),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 270.h,
             // color: Colors.blue,
              child: ListView.separated(itemCount: workoutz.length,
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(thickness: 2,color:Colors.grey.shade500 ,),
              ),
              physics: NeverScrollableScrollPhysics(),
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
                        Text('00:30',style: GoogleFonts.aDLaMDisplay(fontSize: 16))
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
}
