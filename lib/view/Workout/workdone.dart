import 'package:bodyblitz/view/bottomNavigation/Bottomnavigator.dart';
import 'package:flutter/material.dart';

class Work_done extends StatefulWidget {
  const Work_done({super.key});

  @override
  State<Work_done> createState() => _Work_doneState();
}

class _Work_doneState extends State<Work_done> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Bottom_Naviagator()));
        },icon:Icon(Icons.arrow_back_ios_new) ),
        title: Text('WorkDone'),
        centerTitle: true,
        
      ),
      body: Column(),
    ); 
  }
}
