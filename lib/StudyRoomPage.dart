import 'package:flutter/material.dart';

class StudyRoomPage extends StatefulWidget {
  @override
  _StudyRoomPageState createState() => _StudyRoomPageState();
}

class _StudyRoomPageState extends State<StudyRoomPage> {
  bool isStudying = false;

  void startStudying() {
    setState(() {
      isStudying = true;
    });
    // Add any logic for starting studying, like starting a timer
  }

  void stopStudying() {
    setState(() {
      isStudying = false;
    });
    // Add any logic for stopping studying, like stopping a timer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Study Room'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isStudying ? 'Studying in progress...' : 'Ready to start studying',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isStudying ? stopStudying : startStudying,
              child: Text(isStudying ? 'Stop Studying' : 'Start Studying'),
            ),
          ],
        ),
      ),
    );
  }
}