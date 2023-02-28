import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../utilities/constants.dart';

// Loading Screen
Scaffold getLoadingScreen() {
  return Scaffold(
    backgroundColor: Colors.black,
    body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "SPOT MARKET",
                style: headingStyle,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LoadingAnimationWidget.fourRotatingDots(
                  color: Colors.white,
                  size: 22.0,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Zooooooop!\nGetting Your Data",
                  style: subHeadingStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
