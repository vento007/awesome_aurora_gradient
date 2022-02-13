// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:math' as math;

import 'package:awesome_aurora_gradient/awesome_aurora_gradient.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyAppExampleClipper());
}

class MyAppExampleClipper extends StatelessWidget {
  const MyAppExampleClipper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Awesome Aurora Gradient"),
        backgroundColor: Colors.black,
      ),
      body: ThisApp(),
    );
  }
}

class ThisApp extends StatefulWidget {
  const ThisApp({Key? key}) : super(key: key);

  @override
  State<ThisApp> createState() => _ThisAppState();
}

class _ThisAppState extends State<ThisApp> {
  Color get col {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withAlpha(254);
  }

  double get random {
    return math.Random().nextDouble();
  }

  double _shiftx = 100.0;
  double _shifty = 100.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                ),
                FittedBox(
                  child: Text(
                    "Awesome Aurora Gradient",
                    style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Container(height: 200).asAwesomeAurora(
                      // auroraObjects: myAuroraObjects3,
                      clipper: CustomClipPath(),
                      shiftX: _shiftx,
                      shiftY: _shifty,
                      debug: false),
                ),
                Slider(
                  value: _shiftx,
                  divisions: 10,
                  label: _shiftx.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _shiftx = value;
                    });
                  },
                  min: 5,
                  max: 250,
                ),
                Slider(
                  value: _shifty,
                  divisions: 10,
                  label: _shifty.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _shifty = value;
                    });
                  },
                  min: 5,
                  max: 250,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text(
                          "Image",
                        )),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text(
                          "Random",
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 0.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.arcToPoint(Offset(size.width, size.height),
        radius: Radius.elliptical(10, 10));
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
