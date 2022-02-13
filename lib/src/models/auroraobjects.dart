
import 'dart:ui';

class AuroraObjects {
  Color color;
  double x;
  double y;
  double size;
  double shiftX;
  double shiftY;
  AuroraObjects(
      {required this.color,
      required this.size,
      required this.x,
      required this.y,
      this.shiftX = 0,
      this.shiftY = 0});
}