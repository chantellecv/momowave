// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/globalcolours.dart';
import 'package:my_app/view/login.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 1500), () {
      Get.to(() => LoginView());
    });
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 109, 87, 132),
      body: Center(
        child: Text(
          'MomoWave',
          style: TextStyle(
            fontFamily: 'Shantell',
            color: GlobalColors.mainColour,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,

          )
        )
      )
    );
  }
}