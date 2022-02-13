import 'dart:math' as math;

import 'package:awesome_aurora_gradient/awesome_aurora_gradient.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleButton());
}

class ExampleButton extends StatelessWidget {
  const ExampleButton({Key? key}) : super(key: key);

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

  double _shiftx = 100.0;
  double _shifty = 100.0;

  List<AuroraObjects> b = [
    AuroraObjects(
        color: const Color.fromARGB(255, 180, 255, 4),
        size: 0.5,
        x: 0.0,
        y: .1),
    AuroraObjects(
        color: const Color.fromARGB(255, 255, 3, 36),
        size: 0.5,
        x: 0.50,
        y: .5),
    AuroraObjects(
        color: const Color.fromARGB(255, 100, 10, 245), size: 0.5, x: 1, y: .1),
    AuroraObjects(
        color: const Color.fromARGB(255, 45, 223, 9), size: 0.3, x: 0.7, y: .3),
    AuroraObjects(
        color: const Color.fromARGB(255, 255, 230, 0), size: 0.3, x: 3, y: .8),
    // AuroraObjects(color: Color(0xFF094623), size: 0.1, x: 0.6, y: 0.1),
    // AuroraObjects(color: Color(0x330ef3c5), size: 0.1, x: 1, y: 0.1),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //         image: AssetImage(_images[_activeImage]),
      //         filterQuality: FilterQuality.high,
      //         alignment: Alignment.center)),
      padding: const EdgeInsets.all(40),
      child: Stack(
        children: [
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
                const FittedBox(
                  child: Text(
                    "TODO: better button/small gradient schemes.",
                    style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
                  ),
                ),
                const FittedBox(
                  child: Text(
                    "for now, only use this package for bigger surfaces",
                    style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
                  ),
                ),
                ConstrainedBox(
                    constraints: BoxConstraints.tight(const Size(111, 44)),
                    child: const TextButton(onPressed: null, child: Text("sdf"))
                        .asAwesomeAurora(
                            debug: false, shiftX: _shiftx, shiftY: _shifty)),
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
                          setState(() {
                            // _activeImage += 1;
                            // if (_activeImage == _images.length) {
                            //   _activeImage = 0;
                            // }
                          });
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
