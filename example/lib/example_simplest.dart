// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:awesome_aurora_gradient/awesome_aurora_gradient.dart';

// ignore: must_be_immutable
class ExampleSimplest extends StatelessWidget {
   ExampleSimplest({Key? key}) : super(key: key);

  List<AuroraObjects> auroraObjects = [
    AuroraObjects(color: Color(0xfe703bc9), size: 2.0, x: 0.5, y: 0.5),
    AuroraObjects(
        color: Color(0xfe15ad81),
        size: 0.20434975310185255,
        x: 0.4107773793760572,
        y: 0.7115949484263953),
    AuroraObjects(
        color: Color(0xfe7a2598),
        size: 0.05583251849162163,
        x: 0.35623824913909286,
        y: 0.9970802979115129),
    AuroraObjects(
        color: Color(0xfed77237),
        size: 0.529962871028804,
        x: 0.8965277962474901,
        y: 0.7637832790723679),
    AuroraObjects(
        color: Color(0xfe715f1e),
        size: 0.5361927815073029,
        x: 0.03585087116056085,
        y: 0.4395169259099354),
    AuroraObjects(
        color: Color(0xfe7bb8ef),
        size: 0.48439512870067514,
        x: 0.23393248482439866,
        y: 0.5842477635926363)
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    ).asAwesomeAurora(
        shiftX: 100.0, shiftY: 6.713037223479337, auroraObjects: auroraObjects);
  }
}
