import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_practice_todo/home_screen.dart';
import 'package:flutter/material.dart';
import 'firebase.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "todoApp",
      home: HomeScreen(),
    );
  }
}
