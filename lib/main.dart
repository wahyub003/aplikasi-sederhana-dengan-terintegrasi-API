import 'package:flutter/material.dart';
import 'package:tugas/screens/home_screen.dart';
import 'package:tugas/screens/add_user_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter API Integration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/addUser': (context) => AddUserScreen(),
      },
    );
  }
}
