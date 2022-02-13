import 'dart:math' as math;

import 'package:awesome_aurora_gradient/awesome_aurora_gradient.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleContainerSizedBox());
}

class ExampleContainerSizedBox extends StatelessWidget {
  const ExampleContainerSizedBox({Key? key}) : super(key: key);

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

  double _shiftx = 111.0;
  double _shifty = 111.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        // height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: FittedBox(
                child: Text(
                  "Awesome Aurora Gradient",
                  style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: FittedBox(
                child: Text(
                  "Container & SizedBox examples",
                  style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 250,
              width: 250,
              // width: MediaQuery.of(context).size.width,
              child: Center(
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("SizedBox with constrained box"),
              )),
            ).asAwesomeAurora(shiftX: _shiftx, shiftY: _shifty),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              height: 250,
              width: 250,
              child: Center(
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Container with constrained box"),
              )),
            ).asAwesomeAurora(shiftX: _shiftx, shiftY: _shifty),
            const SizedBox(
              height: 40,
            ),
            DecoratedBox(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.1)),
                child: const Padding(
                  padding: EdgeInsets.all(28.0),
                  child: Text(
                    "Text with decorated box",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                )).asAwesomeAurora(shiftX: _shiftx, shiftY: _shifty),
            const SizedBox(
              height: 20,
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
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
