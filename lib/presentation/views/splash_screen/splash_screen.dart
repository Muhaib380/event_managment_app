import 'package:event_managment_app/presentation/views/walkthrough_pages/walkthrough_1.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 5),(){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Walkthrough1())
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCF3232),
      body: Center(child:
        Image.asset("assets/images/splash_screen.png",width: 276,height: 119,)
        ,),
    );
  }
}
