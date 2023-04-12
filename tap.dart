// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/globalcolours.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: GlobalColors.textColour,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Container(
                height: 200,
                width: 380,
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    tileMode: TileMode.mirror,
                    colors: [GlobalColors.textColour, GlobalColors.textColour, Color(0xFFFEC8D8)],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Bank Name',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '**** **** **** 1234',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Card Holder',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Valid Thru 12/25',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Text(
                'Hold near reader',
                style: TextStyle(
                  color: Color.fromRGBO(148, 148, 148, 82)
                ),
              
              )
            ],
          ),
        ),
      ),
    );
  }
}
