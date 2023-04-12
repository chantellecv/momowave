// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/globalcolours.dart';
import 'package:intl/intl.dart';
import 'package:my_app/api/userDashboard.dart';


class Transaction {
  final String title;
  final String amount;
  final DateTime date;

  Transaction({
    required this.title,
    required this.amount,
    required this.date,
  });
}



class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key,}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {

    // String data = getDashboardData() as String;
    // // var response = json.decode(data as String);
    // print(data);

    // Map<String, dynamic> _userData = {};



    late double _balance;

  @override
  void initState() {
    super.initState();
    getDashboardData().then((userData) {
      setState(() {
        _balance = userData['balance'];
      });
    }).catchError((error) {
      print(error);
    });
  }

    

    final List<Transaction> transactions = [
    Transaction(
      title: 'Groceries',
      amount: '50.00',
      date: DateTime(2023, 04, 06),
    ),
    Transaction(
      title: 'Electricity Bill',
      amount: '100.00',
      date: DateTime(2023, 04, 05),
    ),
    Transaction(
      title: 'Internet Bill',
      amount: '75.00',
      date: DateTime(2023, 04, 02),
    ),
  ];

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
              Text(
                'Account Balance',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
               
                'hello',

                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              // Text(
              //   'Virtual Debit Card',
              //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // ),
              Container(
                height: 200,
                width: 380,
                // margin: EdgeInsets.symmetric(horizontal: 10),
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

              SizedBox(height: 25),

              Text(
                'Activity',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,

                ),
              ),
              SizedBox(height: 15),

              Column(
                children: transactions.map((transaction) {
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(''),
                        backgroundColor: GlobalColors.textColour,
                      ),
                      trailing: Text('\$${transaction.amount}'),
                      title: Text(transaction.title),
                      subtitle: Text(DateFormat('yyyy-MM-dd H:mm').format(transaction.date)),
                    ),
                  
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}