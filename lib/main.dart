import 'package:flutter/material.dart';
import 'package:project_1/views/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '10Pearl University App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      color: Colors.lightBlue,
      home: SplashScreen(), // Start with SplashScreen instead of MyHomePage
    );
  }
}
