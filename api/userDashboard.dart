import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';


const baseUrl = '***';

Future<Map<String, dynamic>> getDashboardData() async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  print("sup");
  final SharedPreferences  prefs = await SharedPreferences.getInstance();

  var url =
      Uri.parse('$baseUrl/api/dashboard');

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url, headers: {"Content-Type": "application/json","Authorization":"Bearer ${prefs.getString("accessToken")}"});
  final Map<String, dynamic> userData = json.decode(response.body);
  final Map<String, dynamic> data = {'balance':userData['user']['balance'],'mobileNetwork':userData['user']['mobile_network'],'mobileNumber':userData['user']['momo_number']};
  // final String wuz 
  // double balance = data['user']['balance'];

  print(json.encode(data));
  return data;
  // return User.fromJson(responseBody);
  
}



class DashboardData{
  final String balance;
  const DashboardData({required this.balance});
  factory DashboardData.fromJson(Map<String, dynamic>json){

    return DashboardData(balance: json['balance']);

  }
}

class User{
  final DashboardData dashboardData;
  User ({required this.dashboardData});
  factory User.fromJson(Map<String, dynamic>json){
    return User(dashboardData: DashboardData.fromJson(json['user']));
  }
  
}
