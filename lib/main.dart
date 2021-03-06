import 'package:flutter/material.dart';
import 'package:retrofit_flutter/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Attendance',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        
        primarySwatch: Colors.green,
      ),
      home: const Splash(),
    );
  }
}


