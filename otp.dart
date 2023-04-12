// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_app/api/authentication.dart';
import 'package:my_app/globalcolours.dart';
import 'package:my_app/view/widgets/button.dart';


class OTPView extends StatelessWidget {
  OTPView({super.key});

  final List<TextEditingController> _otpControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  String otp = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColors.textColour,
      ),
      backgroundColor: GlobalColors.mainColour,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 60),
                Image(
                  image: AssetImage('assets/otp.png'),
                  height: 120,
                  color: Color(0XFF70538D),
                ),
                SizedBox(height: 60),

                Text(
                  'OTP Verification',
                  style: TextStyle(
                    color: Color(0XFF3E2E4E),
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 40),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Thank you for registering with MomoWave. We have sent you an OTP on your mobile number.',
                    style: TextStyle(
                        color: Color(0XFF3E3448),
                        fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    _otpControllers.length,
                    (index) => SizedBox(
                      width: 50,
                      child: TextFormField(

                        controller: _otpControllers[index],
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        cursorColor: GlobalColors.textColour,
                        decoration: InputDecoration(
                          counterText: '',
                          focusColor: GlobalColors.textColour,
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: GlobalColors.textColour),
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty && index < _otpControllers.length - 1) {
                            FocusScope.of(context).nextFocus();
                          }
                          _otpControllers.forEach((controller) => otp += controller.text);
                        },
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 80),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Didn\'t receive OTP?'
                    ),
                    TextButton(
                      onPressed: () {
                        resendOTP();
                      },
                      child: Text(
                        'Resend',
                        style: TextStyle(
                          color: GlobalColors.textColour,
                        ),

                        )
                    )
                  ],
                ),

                SizedBox(height: 20),

                GestureDetector(
                  onDoubleTap: () {
                    // print(otp.substring(otp.length-5));
                    verifyOTP(otp.substring(otp.length-5));

                  },
                  child: ButtonKey(
                    text: 'Verify'
                  ),
                )

              ]
            )
          )
        )
      )
    );
  }
}