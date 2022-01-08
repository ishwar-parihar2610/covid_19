import 'dart:async';

import 'package:covid_19/view/world_state_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 3))
        ..repeat();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => WorldScreenState()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: _controller,
              child: Container(
                height: 200,
                width: 200,
                child: Center(
                  child: Image.asset('assets/coronavirus.png'),
                ),
              ),
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                    angle: _controller.value * 2.0 * math.pi, child: child);
              }),
          Align(
              alignment: Alignment.center,
              child: Text(
                'covid-19\nTracker App ',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ))
        ],
      )),
    );
  }
}
