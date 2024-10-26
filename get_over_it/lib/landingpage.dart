import 'package:flutter/material.dart';
import 'homepage.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();

    // Navigate to HomePage after 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
              'assets/logo.jpeg',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
