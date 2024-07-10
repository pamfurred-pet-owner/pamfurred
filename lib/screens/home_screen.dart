import 'package:flutter/material.dart';
import 'package:pamfurred/components/bottom_navbar.dart';
import 'package:pamfurred/components/custom_appbar.dart';
// import 'globals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context),
      body: const SafeArea(child: Center()),
      bottomNavigationBar: CustomBottomNavBar(context),
    );
  }
}
