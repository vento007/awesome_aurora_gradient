import 'dart:math' as math;

import 'package:awesome_aurora_gradient/awesome_aurora_gradient.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleMaterialColorSchemeTest());
}

class ExampleMaterialColorSchemeTest extends StatelessWidget {
  const ExampleMaterialColorSchemeTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Awesome Aurora Gradient"),
        backgroundColor: Colors.black,
      ),
      body: const ThisApp(),
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

  double _shiftx = 122.0;
  double _shifty = 122.0;

  @override
  Widget build(BuildContext context) {
    final scheme1 = ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 223, 162, 140),
    );
    final scheme2 = ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 131, 43, 43),
    );
    final scheme3 =
        ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 76, 134, 78));

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ).asAwesomeAurora(
              colorScheme: [scheme1, scheme2, scheme3],
              shiftX: _shiftx,
              shiftY: _shifty,
              debug: true),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const FittedBox(
                  child: Text(
                    "Awesome Aurora Gradient",
                    style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
                  ),
                ),
                Slider(
                  value: _shiftx,
                  divisions: 30,
                  label: _shiftx.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _shiftx = value;
                    });
                  },
                  min: 1,
                  max: 250,
                ),
                Slider(
                  value: _shifty,
                  divisions: 30,
                  label: _shifty.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _shifty = value;
                    });
                  },
                  min: 1,
                  max: 250,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: const Text(
                          "Image",
                        )),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: const Text(
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
        radius: const Radius.elliptical(10, 10));
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
