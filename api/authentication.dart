// import 'dart:convert' as convert;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

const baseUrl = '***';

// class Authentication{
  Future<void> register(String email, String password, String momoNetwork, String momoNumber) async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview

  final SharedPreferences  prefs = await SharedPreferences.getInstance();

  var url =
      Uri.parse('$baseUrl/api/register');
  Map data = {'email': email, 'password': password, 'momo_number': momoNumber, 'momo_network': momoNetwork};

  // Await the http get response, then decode the json-formatted response.
  var response = await http.post(url, headers: {"Content-Type": "application/json"}, body: json.encode(data) );
  var responseBody = json.decode(response.body);
  if (response.statusCode == 201) {

    prefs.setString('momoNumber', momoNumber);
     Fluttertoast.showToast(
      msg: "Success",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0
    );
  }
  else{
    if (response.statusCode == 400){
      Fluttertoast.showToast(

        msg: responseBody['error'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
  }  
  
  }
  
// }

Future<void> verifyOTP(String otp) async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  final SharedPreferences  prefs = await SharedPreferences.getInstance();

  
  var url =
      Uri.parse('$baseUrl/api/verify-otp');
  Map data = {'momo_number': prefs.getString('momoNumber'), 'otp': otp};

  // Await the http get response, then decode the json-formatted response.
  var response = await http.post(url, headers: {"Content-Type": "application/json"}, body: json.encode(data) );
  if (response.statusCode != 200) {

    Fluttertoast.showToast(
      msg: "Invalid OTP",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
    );
  }  
  // return response;
}

Future<void> resendOTP() async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  final SharedPreferences  prefs = await SharedPreferences.getInstance();

  
  var url =
      Uri.parse('$baseUrl/api/resend-otp');
  Map data = {'momo_number': prefs.getString('momoNumber')};

  // Await the http get response, then decode the json-formatted response.
  var response = await http.post(url, headers: {"Content-Type": "application/json"}, body: json.encode(data) );
  if (response.statusCode != 200) {

    Fluttertoast.showToast(
      msg: "Invalid OTP",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
    );
  }  
  // return response;
}

Future<void> login(String password, String momoNumber) async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview

  final SharedPreferences  prefs = await SharedPreferences.getInstance();

  var url = Uri.parse('$baseUrl/api/login');
  Map data = {'password': password, 'momo_number': momoNumber};

  // Await the http get response, then decode the json-formatted response.

  // try {
    var response = await http.post(url, headers: {"Content-Type": "application/json"}, body: json.encode(data) );
    var responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      prefs.setString('accessToken',responseBody['access_token']);
      prefs.setString('momoNumber', momoNumber);
      Fluttertoast.showToast(
        msg: "Success",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
    else if (response.statusCode == 401){
      Fluttertoast.showToast(

        msg: responseBody['error'] ?? 'Incorrect number or password',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
    print(response.body);  
    
  // } catch (e) {
  //   print('Error: $e');
  //   Fluttertoast.showToast(
  //       msg: "An error occurred. Please try again.",
  //       // msg: "hi",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       fontSize: 16.0);
  // }
}
