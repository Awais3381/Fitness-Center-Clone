import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gymsupplimentshop/pages/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),() => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => SignIn())));
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset('images/splash.jpeg',fit: BoxFit.cover),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('images/logo.png',width: 250,height: 250,fit: BoxFit.scaleDown)
            ],
          ),
        )
      ],
    );
  }
}
