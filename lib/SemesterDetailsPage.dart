import 'package:flutter/material.dart';
import 'DetailedButtons.dart';

class SemesterDetailPage extends StatelessWidget {
  final String subject;
  final Color backgroundColor;

  SemesterDetailPage({required this.subject, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject),
        backgroundColor: backgroundColor,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildButton(context, Icons.book, 'Course', CoursePage(backgroundColor: backgroundColor)),
              SizedBox(height: 20.0),
              buildButton(context, Icons.description, 'Worksheets', WorksheetsPage(backgroundColor: backgroundColor)),
              SizedBox(height: 20.0),
              buildButton(context, Icons.edit, 'Correction', CorrectionPage(backgroundColor: backgroundColor)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context, IconData icon, String label, Widget nextPage) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: backgroundColor, // Background color
        onPrimary: Colors.white, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
        ),
        padding: EdgeInsets.all(15.0), // Button padding
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}