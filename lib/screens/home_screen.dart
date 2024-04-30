import 'dart:js_interop';

import 'package:demo_app/screens/login.dart';
import 'package:demo_app/widgets/Hero_Card.dart';
import 'package:demo_app/widgets/transactions_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//ignore_for_file: prefer_const_constructors
//ignore_for_file: prefer_const_literals_to_create_immutables
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isLogoutLoading = false;
  logOut() async {
    setState(() {
      isLogoutLoading = true;
    });
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginView()),
    );
    setState(() {
      isLogoutLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.blue.shade900,
      //   onPressed: (() {}),
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      // ),
      appBar: AppBar(
        backgroundColor: Colors.red.shade500,
        title: Text(
          "Hello,",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              logOut();
            },
            icon: isLogoutLoading
                ? CircularProgressIndicator()
                : Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
          )
        ],
      ),
      body: Column(
        children: [
          HeroCard(),
          TransactionsCard(),
        ],
      ),
    );
  }
}
