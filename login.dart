// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/api/authentication.dart';
// import 'package:get/get.dart';
import 'package:my_app/globalcolours.dart';
import 'package:my_app/view/dashboard.dart';
import 'package:my_app/view/signup.dart';
import 'package:my_app/view/widgets/button.dart';
import 'package:my_app/view/widgets/text.form.dart';
// import 'package:my_app/globalcolours.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
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
                
                Text(
                  'Log in',
                  style: TextStyle(
                    color: GlobalColors.textColour,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  )
                ),
                SizedBox(height: 20),
                
                Text(
                  'Sign In to continue',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: GlobalColors.textColour
                  ),
                ),

                SizedBox(height: 90),

                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: 2.7,
                  child: Text(
                    'MOBILE NUMBER',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: GlobalColors.textColour,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                //phone number
                TextFormGlobal(
                  controller: numberController,
                  text: '',
                  obscure: false,
                  textInputType: TextInputType.phone,
                  validate: (numberController) {
                          if (numberController == null || numberController.isEmpty) {
                            return 'Please enter a username';
                          }
                          return null;
                        },
                ),

                SizedBox(height: 20),
                Align(
                  widthFactor: 4,
                  alignment: Alignment.topLeft,
                  child: Text(
                    'PASSWORD',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: GlobalColors.textColour,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                //password
                TextFormGlobal(
                  controller: passwordController,
                  text: '',
                  obscure: true,
                  textInputType: TextInputType.text,
                  validate: (passwordController) {
                          if (passwordController == null || passwordController.isEmpty) {
                            return 'Please enter a username';
                          }
                          return null;
                        },
                ),

                SizedBox(height: 60),

                GestureDetector(
                  onDoubleTap: () {

                    login(passwordController.text, numberController.text);
                    
  
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage()),
                    );
                  },
                  child: ButtonKey(
                    text: 'Log In',
                  ),
                  
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                    'Don\'t have an account?'
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  SignUpView()),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: GlobalColors.textColour,
                        ),
                      )
                    )
                  ],
                ),

                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => DashboardPage()),
                //     );
                //   },
                   
                //   child: Text('Card')
                //   )
                

              ],
            ),
          )
        )
      ),
    );
  }
}
