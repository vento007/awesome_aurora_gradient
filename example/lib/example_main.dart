import 'dart:math' as math;

import 'package:awesome_aurora_gradient/awesome_aurora_gradient.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyAppExample());
}

class MyAppExample extends StatelessWidget {
  const MyAppExample({Key? key}) : super(key: key);

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

  int _activeImage = 0;
  double _shiftx = 100.0;
  double _shifty = 100.0;

  @override
  Widget build(BuildContext context) {
    List<String> _images = [
      "lib/assets/images/2.png",
      "lib/assets/images/3.png",
      "lib/assets/images/1.png",
      "lib/assets/images/4.png",
      "lib/assets/images/5.png",
    ];

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(_images[_activeImage]),
              filterQuality: FilterQuality.high,
              alignment: Alignment.center)),
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
                const Spacer(),
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
                            _activeImage += 1;
                            if (_activeImage == _images.length) {
                              _activeImage = 0;
                            }
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
    ).asAwesomeAurora(
        // auroraObjects: myAuroraObjects3,

        shiftX: _shiftx,
        shiftY: _shifty,
        debug: true);
  }
}
