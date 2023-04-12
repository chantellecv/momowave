// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:my_app/view/otpGPT.dart';
import 'package:my_app/view/widgets/text.form.dart';
import 'package:my_app/globalcolours.dart';
import 'package:my_app/view/widgets/button.dart';
import 'package:my_app/api/authentication.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:my_app/view/widgets/virtualcard.dart';
import 'package:my_app/view/widgets/walletcard.dart';
import 'login.dart';
import 'otp.dart';



class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

    @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpView> {
  String _networkValue = 'MTN';
  bool passwordsMatch = true;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();


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
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                
                Text(
                  'Sign Up',
                  style: TextStyle(
                    color: GlobalColors.textColour,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  )
                ),
                SizedBox(height: 15),
                
                Text(
                  'Sign Up to continue',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: GlobalColors.textColour
                  ),
                ),

                SizedBox(height: 50),

                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'MOBILE NUMBER',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: GlobalColors.textColour,
                            ),
                          ),
                        )
                      ),
                      SizedBox(height: 10),

                      Row(
                        children: [
                          // SizedBox(
                          //   width: 130,
                          //   child: TextFormGlobal(
                          //     controller: emailController,
                          //     text: '',
                          //     obscure: false,
                          //     textInputType: TextInputType.phone,
                          //   ),
                          // ),

                          Container(
                            height: 55,
                            padding: EdgeInsets.only(right: 10, left: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            width: 150,
                            

                            child: DropdownButtonFormField(
                              alignment: Alignment.center,
                              items: [
                                
                                DropdownMenuItem(
                                  value: "MTN", 
                                  child: SizedBox(
                                    width: 95,
                                    child: ListTile(
                                      horizontalTitleGap: 2.0,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                                      leading: SizedBox(
                                        width: 35,
                                        child: Image.asset('assets/mtn.png')
                                        ),
                                      title: Text("MTN", ), 
                                      // title: null,
                                    ),
                                  ),
                                ),

                                DropdownMenuItem(
                                  value: "Vodafone", 
                                  child: SizedBox(
                                    width: 95,
                                    child: ListTile(
                                      horizontalTitleGap: 2.0,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                                      leading: SizedBox(
                                        width: 35,
                                        child: Image.asset('assets/vodafone.png')
                                        ),
                                      title: Text("Vodafone", textScaleFactor: 0.7,),
                                    ),
                                  ),
                                ),

                                DropdownMenuItem(
                                  value: "AirtelTigo", 
                                  child: SizedBox(
                                    width: 95,
                                    child: ListTile(
                                      horizontalTitleGap: 2.0,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                                      leading: SizedBox(
                                        width: 35,
                                        child: Image.asset('assets/airteltigo.png')
                                        ),
                                      title: Text("AirtelTigo", textScaleFactor: 0.7,),
                                    ),
                                  ),
                                ),


                                // DropdownMenuItem(value: "Vodafone", child: Text("Vodafone")),
                                // DropdownMenuItem(value: "AirtelTigo", child: Text("AirtelTigo")),
                              ],
                              value: _networkValue,
                              onChanged: (value) {
                                setState(() {
                                  _networkValue = value.toString();
                                });
                              },
                              borderRadius: BorderRadius.circular(15),
                              decoration: InputDecoration.collapsed(hintText: ''),
                            ),
                          ),
                          SizedBox(width: 15),


                          Expanded(
                            
                            child: TextFormGlobal(
                              controller: numberController,
                              text: '',
                              obscure: false,
                              textInputType: TextInputType.phone,
                              validate: (numberController) {
                                if (numberController == null || numberController.isEmpty ) {
                                  return 'Please enter your phone number';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'EMAIL',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: GlobalColors.textColour,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      //email
                      TextFormGlobal(
                        controller: emailController,
                        text: '',
                        obscure: false,
                        textInputType: TextInputType.emailAddress,
                        validate: (emailController) {
                                if (emailController == null || emailController.isEmpty) {
                                  return "Please enter an email address";
                                }
                                return null;
                              },
                      ),

                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 12),
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
                      ),
                      SizedBox(height: 10),
                      //password
                      TextFormGlobal(
                        // key: _formKey, 
                        controller: passwordController,
                        text: '',
                        obscure: true,
                        textInputType: TextInputType.text,
                        validate: (passwordController) {
                                if (passwordController == null || passwordController.isEmpty) {
                                  return 'Please enter a password';
                                }
                                return null;
                              },
                      ),
                      SizedBox(height: 20),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'CONFIRM PASSWORD',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: GlobalColors.textColour,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      TextFormGlobal(
                        controller: confirmPasswordController,
                        text: '',
                        obscure: true,
                        textInputType: TextInputType.text,
                        validate: (confirmPasswordController) {
                                if (confirmPasswordController == null || confirmPasswordController.isEmpty) {
                                  return 'Please confirm your password';
                                }
                                else if (confirmPasswordController != passwordController.text) {
                                     return "Passwords don't match";
                                }
                              },

                      ),
                      SizedBox(height: 40),
                    ]
                  )
                ),
                
                GestureDetector(
                
                  onDoubleTap: () {

                    if (_formKey.currentState!.validate()) {
                      if (passwordController.text != confirmPasswordController.text) {
                        setState(() {
                          passwordsMatch = false;
                        });
                      } else {
                        setState(() {
                          passwordsMatch = true;
                        });
                        // Perform sign up here
                        register(emailController.text, passwordController.text, _networkValue, numberController.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OTPView()),
                          );
                        }
                    }




                    // register(emailController.text, passwordController.text, _networkValue, numberController.text);
                    
                    
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => OTPView()),
                    // );
                  },
                  child: ButtonKey(
                    text: 'Sign Up',
                  ),
                  
                ),
                
                

                Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                    'Already have an account?'
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginView()),
                        );
                      },
                      child: Text(
                        'Sign In',
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
                //       MaterialPageRoute(builder: (context) => VirtualWalletCardScreen()),
                //     );
                //   },
                //   child: Text('Card Button'),

                // )

              ],
            ),
          )
        )
      ),
    );
  }

}