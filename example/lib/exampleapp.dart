


import 'package:example/clipper.dart';
import 'package:example/example_background_only.dart';
import 'package:example/example_container_and_sizedbox.dart';
import 'package:example/example_images.dart';
import 'package:example/example_main.dart';
import 'package:example/example_material_color_scheme.dart';
import 'package:example/example_simplest.dart';
import 'package:flutter/material.dart';

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lightScheme = ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 115, 146, 231));

    return MaterialApp(
      theme: ThemeData(colorScheme: lightScheme),
      home: Scaffold(
        appBar: AppBar(title: const Text("Awesome Aurora Gradient")),
        body: const SelectionPage(),
      ),
    );
  }
}

class SelectionPage extends StatelessWidget {
  const SelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 100),
        Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyAppExample()),
                );
              },
              child: const Text("Main Demo")),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ExampleImage()),
                );
              },
              child: const Text("Images")),
        ),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyAppExampleNoBackGround()),
                );
              },
              child: const Text("background only")),
        ),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyAppExampleClipper()),
                );
              },
              child: const Text("clipper")),
        ),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const ExampleMaterialColorSchemeTest()),
                );
              },
              child: const Text("List of colorSchemes")),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ExampleContainerSizedBox()),
                );
              },
              child: const Text("Container & SizedBox")),
        ),
           const SizedBox(
          height: 20,
        ),
        Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  ExampleSimplest()),
                );
              },
              child: const Text("Simple Example")),
        ),
      ],
    );
  }
}