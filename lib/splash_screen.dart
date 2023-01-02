import 'package:flutter/material.dart';
import 'package:rahove_exam/home.dart';
import 'package:rahove_exam/signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 1500));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignupPage()));
  }

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Rahove',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w800),
          textScaleFactor: 3,
        ),
      ),
    );
  }
}
