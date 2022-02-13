import 'dart:math' as math;
import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:developer' as dev;

import 'models/auroraobjects.dart';

extension AuroraWidget<T extends Widget> on T {
  IntrinsicHeight asAwesomeAurora({
    List<AuroraObjects>? auroraObjects = const [],
    List<ColorScheme>? colorScheme,
    Clip clipBehaviour = Clip.antiAlias,
    TileMode tileMode = TileMode.clamp,
    CustomClipper<Path>? clipper,
    double shiftX = 0,
    double shiftY = 0,
    double width = 0,
    double height = 0,
    bool? debug,
  }) {
    Color randomColor() {
      if (colorScheme != null) {
        List<Color> lc = [];
        for (var element in colorScheme) {
          lc.add(element.primary);
          lc.add(element.inversePrimary);
        }

        lc.shuffle();

        return lc.first;
      }

      return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withAlpha(254);
    }

    double randomDouble() {
      return math.Random().nextDouble();
    }

    double getRandomShift() {
      return randomDouble() * 255;
    }

    List<AuroraObjects> populateRandomList() {
      var rng = Random();
      var loops = rng.nextInt(1);
      if (loops < 4) {
        loops = 4;
      }

      List<AuroraObjects> tmpList = [];

      tmpList.add(
        AuroraObjects(color: randomColor(), size: 2.0, x: 0.5, y: 0.5),
      );

      var i = 0;
      while (i <= loops) {
        tmpList.add(
          AuroraObjects(
              color: randomColor(),
              size: randomDouble(),
              x: randomDouble(),
              y: randomDouble()),
        );

        i++;
      }
      return tmpList;
    }

    if (auroraObjects!.isEmpty) {
      auroraObjects = populateRandomList();
    }

    if (shiftX == 0) {
      shiftX = getRandomShift();
    }

    if (shiftY == 0) {
      shiftY = getRandomShift();
    }

    if (shiftX < 100 && shiftY < 100) {
      Random r = Random();
      double falseProbability = .5;
      bool booleanResult = r.nextDouble() > falseProbability;
      if (booleanResult) {
        shiftX = shiftX + 200;
      } else {
        shiftY = shiftY + 200;
      }
    }

    if (shiftX > 130) {
      shiftX = 100;
    }

    if (shiftY > 110) {
      shiftY = 100;
    }

    if (debug == true) {
      String finalList =
          '''.asAwesomeAurora(shiftX: $shiftX,shiftY: $shiftY,auroraObjects: [''';
      for (var element in auroraObjects) {
        finalList = finalList +
            '''AuroraObjects(color: ${element.color}, size: ${element.size}, x: ${element.x}, y: ${element.y}),''';
      }
      finalList = finalList + ''']);''';
      dev.log("copy the .asAwesomeAurora below: ");
      dev.log("____________________________");
      dev.log(finalList);
      dev.log("____________________________");
    }

    return IntrinsicHeight(
      child: ClipPath(
        clipper: clipper,
        clipBehavior: clipBehaviour,
        child: Stack(
          children: [
            CustomPaint(
              // size: const Size(22, 22),
              isComplex: true,
              painter: AuroraPainter(auroraObjectList: auroraObjects),
              child: this,
            ),
            BackdropFilter(
                filter: ImageFilter.blur(sigmaX: shiftX, sigmaY: shiftY),
                child: this),
            // this
          ],
        ),
      ),
    );
  }
}

class AuroraPainter extends CustomPainter {
  List<AuroraObjects>? auroraObjectList = [];

  AuroraPainter({required this.auroraObjectList});

  @override
  void paint(Canvas canvas, Size size) {
    double h = size.height;
    double w = size.width;
    for (var element in auroraObjectList!) {
      var s = ((w * h) / (8 * h) + h / 2);
      var paint = Paint()
        ..color = element.color
        // ..blendMode = BlendMode.srcATop
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
          Offset(w * element.x, h * element.y), (s * element.size) * 1, paint);
    }
  }

  @override
  bool shouldRepaint(AuroraPainter oldDelegate) => true;
  @override
  bool shouldRebuildSemantics(AuroraPainter oldDelegate) => false;
}
