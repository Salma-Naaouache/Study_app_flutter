import 'package:flutter/material.dart';
import 'SemesterDetailsPage.dart';

class SubjectPage extends StatelessWidget {
  final List<String> semester;
  final Color backgroundColor; // Add the backgroundColor parameter

  SubjectPage({required this.semester, required this.backgroundColor}); // Add the backgroundColor parameter to the constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subjects'),
        backgroundColor: backgroundColor, // Use the provided backgroundColor
      ),
      body: ListView.builder(
        itemCount: semester.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.centerLeft,
            child: ListTile(
              title: Text(
                semester[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SemesterDetailPage(subject: semester[index], backgroundColor: backgroundColor)), // Pass the backgroundColor parameter here
                );
              },
            ),
          );
        },
      ),
    );
  }
}