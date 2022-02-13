import 'dart:math' as math;
import 'package:awesome_aurora_gradient/awesome_aurora_gradient.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleImage());
}

class ExampleImage extends StatelessWidget {
  const ExampleImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: const Text(
            "Awesome Aurora Gradient Gallery",
            style: TextStyle(color: Colors.white),
          ),
          flexibleSpace: Container(
            child: const SizedBox(
              width: 200,
              height: 160,
            ).asAwesomeAurora(
                shiftX: 100,
                shiftY: 100,
                width: MediaQuery.of(context).size.width,
                height: kToolbarHeight),
            // width: double.infinity,
            // height: double.infinity,
            // decoration: const BoxDecoration(

            // ),
          )),
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
    // final lightScheme = ColorScheme.fromSeed(seedColor: Colors.blueGrey);
    // final darkScheme = ColorScheme.fromSeed(
    //     seedColor: Colors.green, brightness: Brightness.dark);

    // List<AuroraObjects> b = [
    //   AuroraObjects(color: lightScheme.primary, size: 0.5, x: 0.5, y: 0.5),
    //   // AuroraObjects(color: lightScheme.primary, size: 0.5, x: 0.5, y: 0.5),
    //   // AuroraObjects(color: lightScheme.inversePrimary, size: 0.2, x: 0.3, y: 0.3),
    // ];

    return SingleChildScrollView(
      child: SizedBox(
        // height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: FittedBox(
                child: Text(
                  "Awesome Aurora Gradient",
                  style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: FittedBox(
                child: Text(
                  "Container & SizedBox examples",
                  style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
              ),
            ),

            const SizedBox(
              height: 60,
            ),

            Stack(
              children: [
                SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.red,
                ).asAwesomeAurora(shiftX: _shiftx, shiftY: _shifty),
                ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.transparent],
                      ).createShader(
                          Rect.fromLTRB(0, 50, rect.width, rect.height));
                    },
                    blendMode: BlendMode.dstIn,
                    child: Container(
                      height: 301,
                      width: MediaQuery.of(context).size.width,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    )),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: const FlutterLogo(
                      size: 200,
                    ).asShadow(
                        shiftX: 3, shiftY: 3, offset: const Offset(6, 6)),
                    // child: Image.asset(
                    //   'lib/assets/images/4.png',
                    //   width: 200,
                    //   height: 200,
                    // ).asShadow(
                    //     shiftX: 3, shiftY: 3, offset: const Offset(5, 3)),
                  ),
                )
              ],
            ),
            // * second
            Stack(
              children: [
                const Divider(
                  height: 2,
                  thickness: 1,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.red,
                ).asAwesomeAurora(shiftX: _shiftx, shiftY: _shifty),
                ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        // colors: [Colors.black54, Colors.transparent, Colors.white30, Colors.transparent, Colors.black26, Colors.transparent, Colors.transparent, Colors.transparent],
                        colors: [
                          Colors.black,
                          Colors.black,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.black26,
                          Colors.black
                        ],
                        stops: [0.1, 0.12, 3, 0.8, 0.9, 0.7, 1, 1],
                      ).createShader(
                          Rect.fromLTRB(0, 50, rect.width, rect.height));
                    },
                    blendMode: BlendMode.dstIn,
                    child: Container(
                      height: 251,
                      width: MediaQuery.of(context).size.width,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    )),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Image.asset(
                      'lib/assets/images/2.png',
                      width: 200,
                      height: 200,
                    ).asShadow(offset: const Offset(4, 4)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SizedBox(
                  // height: 250,
                  width: MediaQuery.of(context).size.width / 2 - 50,
                  child: Center(
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text("Complex"),
                        const Text("examples"),
                      ],
                    ),
                  ),
                ),
                Center(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(120),
                  child: Image.asset(
                    "lib/assets/images/4-with-bigger-canvas.png",
                    fit: BoxFit.contain,
                    width: 222,
                    height: 222,
                  ).asAwesomeAurora(shiftX: _shiftx, shiftY: _shifty),
                )),
              ],
            ),
            const SizedBox(
              height: 40,
            ),

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
