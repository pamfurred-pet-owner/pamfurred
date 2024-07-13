import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:pamfurred/components/globals.dart';
import 'screens/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pamfurred',
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: Theme.of(context).colorScheme.copyWith(primary: primaryColor),
      ),
      home: const MainScreen(),
    );
  }
}