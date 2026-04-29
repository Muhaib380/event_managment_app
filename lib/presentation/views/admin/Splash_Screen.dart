import 'package:event_managment_app/presentation/views/walkthrough_pages/walkthrough_1.dart';
import 'package:flutter/material.dart';
class SplashScreenAdmin extends StatefulWidget {
  const SplashScreenAdmin({super.key});

  @override
  State<SplashScreenAdmin> createState() => _SplashScreenAdminState();
}

class _SplashScreenAdminState extends State<SplashScreenAdmin> {

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
