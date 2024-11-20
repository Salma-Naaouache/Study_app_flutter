import 'package:flutter/material.dart';
import 'package:study_app/LogIn.dart';
import 'package:study_app/Semester.dart';
import 'package:study_app/SignUp.dart';


void main(){

  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bubbly",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Semester(),

    );
  }
}