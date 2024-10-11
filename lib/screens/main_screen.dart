import 'package:flutter/material.dart';
import 'package:pamfurred/screens/home_screen.dart';
import 'package:pamfurred/screens/appointments.dart';
import 'package:pamfurred/screens/notifications.dart';
import 'package:pamfurred/screens/profile.dart';
import '../components/bottom_navbar.dart';

class MainScreen extends StatefulWidget {
  final String userId; // The userId passed from the login screen

  const MainScreen({super.key, required this.userId});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Pass the userId to the ProfileScreen
    final List<Widget> screens = [
      const HomeScreen(),
      const AppointmentsScreen(),
      const NotificationsScreen(),
      ProfileScreen(userId: widget.userId), // Ensure userId is passed to ProfileScreen
    ];

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
        children: screens,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
