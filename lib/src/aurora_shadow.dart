import 'package:flutter/material.dart';
import 'dart:ui';


extension AuroraShadow<T extends Widget> on T {
  IntrinsicHeight asShadow({
    Clip clipBehaviour = Clip.antiAlias,
    // TileMode tileMode = TileMode.clamp,
    CustomClipper<Path>? clipper,
    Offset offset = Offset.zero,
    double shiftX = 5.0,
    double shiftY = 5.0,
    double opacity = 0.6,
    Color color = Colors.black,


  }) {
   

    return IntrinsicHeight(
      child: ClipPath(
        clipper: clipper,
        clipBehavior: clipBehaviour,
        child: Stack(
          children: [
        
         Transform.translate(
          offset: offset,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaY: shiftY, sigmaX: shiftX, tileMode: TileMode.decal),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.transparent,
                  width: 0,
                ),
              ),
              child: Opacity(
                opacity: opacity,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(color, BlendMode.srcATop),
                  child: this,
                ),
              ),
            ),
          ),
        ),
            this
          ],
        ),
      ),
    );

  
  }
}

