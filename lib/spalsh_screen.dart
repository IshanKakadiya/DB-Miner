// ignore_for_file: camel_case_types, unused_field, prefer_final_fields, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:math';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class spalsh_screen_paage extends StatefulWidget {
  const spalsh_screen_paage({super.key});

  @override
  State<spalsh_screen_paage> createState() => _spalsh_screen_paageState();
}

class _spalsh_screen_paageState extends State<spalsh_screen_paage> {
  Random _random = Random();

  List<String> animal = [
    "Cheetah",
    "Lion",
    "Frog",
    "Crocodile",
    "Alligator",
    "Monitor lizard",
    "Salamander",
    "Toad",
    "Newt",
    "Iguana",
    "Snake",
    "Green dragon lizard",
  ];

  late String networkImage;
  late String networkImagePath;

  @override
  void initState() {
    super.initState();
    networkImage = animal[_random.nextInt(animal.length)];
    networkImagePath =
        "https://source.unsplash.com/random/?\$$networkImage,animal";
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 5),
      () => Navigator.of(context).pushReplacementNamed("/"),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 1, end: 1.5),
          duration: const Duration(milliseconds: 5000),
          builder: (context, double _scale, _) {
            return Transform.scale(
              scale: _scale,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(networkImagePath),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    networkImage,
                    style: GoogleFonts.openSans(
                      fontSize: 30,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
