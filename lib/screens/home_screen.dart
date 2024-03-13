import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_register_app/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.email});

  final String email;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade400,
        title: Text(
          "Home",
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => LoginScreen()),
              (route) => false,
            );
          },
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          widget.email,
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
