import 'package:bodyblitz/controller/home.controller.dart';
//import 'package:bodyblitz/models/models.dart';
// import 'package:bodyblitz/model/database.dart';
import 'package:bodyblitz/utills/constant/Themedata/Light_theme.dart';
import 'package:bodyblitz/utills/constant/Themedata/dark_theme.dart';
//import 'package:bodyblitz/view/Register/login.dart';
import 'package:bodyblitz/view/Splash/Splash.dart';
// import 'package:bodyblitz/view/Register/register.dart';
//import 'package:bodyblitz/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  initHive();
  runApp(const Myapp());
}
Future<void> initHive() async{
 await Hive.openBox('databox');
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>WorkoutController())
      ],
      child: Sizer(
          builder: (context, orientation, deviceType) {
        return  MaterialApp(
          home: Splash(),
          theme: lightmode,
          darkTheme: darkmode,
          debugShowCheckedModeBanner: false,
        );
      },
      ),
    );
  }
} 