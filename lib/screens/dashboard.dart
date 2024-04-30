import 'package:demo_app/screens/home_screen.dart';
import 'package:demo_app/screens/login.dart';
import 'package:demo_app/screens/transection_screen.dart';
import 'package:demo_app/widgets/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var isLogoutLoading = false;
  int currentIndex = 0;

  var pageViewList = [HomeScreen(), TransactionScreen()];

  Future<void> logOut() async {
    setState(() {
      isLogoutLoading = true;
    });
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => Dashboard()),
    );
    setState(() {
      isLogoutLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      body: pageViewList[currentIndex],
    );
  }
}
