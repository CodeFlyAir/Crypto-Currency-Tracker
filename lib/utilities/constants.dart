import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

String currency = "USD";

const TextStyle headingStyle = TextStyle(
  color: Colors.white,
  fontFamily: "Jura",
  fontSize: 30.0,
  fontWeight: FontWeight.w400,
);

const TextStyle subHeadingStyle = TextStyle(
  color: Colors.white,
  fontFamily: "Jura",
  fontSize: 16.0,
  fontWeight: FontWeight.w400,
);

const TextStyle contentStyle = TextStyle(
  color: Colors.white,
  fontFamily: "Jura",
  fontSize: 13.0,
  fontWeight: FontWeight.w300,
);

const GradientBoxBorder primaryGradientBorder = GradientBoxBorder(
  gradient: LinearGradient(
    colors: [
      Color(0xff0038ff),
      Color(0xff009aff),
      Colors.black,
    ],
    stops: [0.0, 0.4, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
);

const GradientBoxBorder stopFullGradientBorder = GradientBoxBorder(
  gradient: LinearGradient(
    colors: [
      Color(0xff0038ff),
      Color(0xff009aff),
      Color(0x0f009aff),
    ],
    stops: [0.0, 0.6, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
);

BoxDecoration dropDownButtonDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(34.0), border: stopFullGradientBorder);

BoxDecoration dropDownDecoration = BoxDecoration(
  color: Colors.black,
  border: stopFullGradientBorder,
  borderRadius: BorderRadius.circular(34.0),
);
