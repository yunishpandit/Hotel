
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:hotel/Widgets/bottombar.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({ Key? key }) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: "images/hotel.png",
      nextScreen: Bottombar(),
      splashTransition: SplashTransition.scaleTransition,
     animationDuration: Duration(milliseconds: 100),
      
    );
  }
}