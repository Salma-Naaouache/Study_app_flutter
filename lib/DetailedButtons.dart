import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class CoursePage extends StatelessWidget {
  final Color backgroundColor;

  CoursePage({required this.backgroundColor});

  Future<void> _getImage(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowedExtensions: ['pdf', 'doc', 'docx', 'txt'], // Add desired file extensions
        type: FileType.custom,
      );

      if (result != null) {
        PlatformFile file = result.files.first;
        print('Selected file name: ${file.name}');
        print('Selected file size: ${file.size}');
        print('Selected file extension: ${file.extension}');
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Documents'),
        backgroundColor: backgroundColor,
      ),
      body: Center(
        child: Text('Course documents will be displayed here.'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getImage(context);
        },
        child: Icon(Icons.add),
        backgroundColor: backgroundColor,
      ),
    );
  }
}

class WorksheetsPage extends StatelessWidget {
  final Color backgroundColor;

  WorksheetsPage({required this.backgroundColor});

  Future<void> _getImage(BuildContext context) async {
    // Similar implementation as CoursePage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Worksheets'),
        backgroundColor: backgroundColor,
      ),
      body: Center(
        child: Text('Worksheets will be displayed here.'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getImage(context);
        },
        child: Icon(Icons.add),
        backgroundColor: backgroundColor,
      ),
    );
  }
}

class CorrectionPage extends StatelessWidget {
  final Color backgroundColor;

  CorrectionPage({required this.backgroundColor});

  Future<void> _getImage(BuildContext context) async {
    // Similar implementation as CoursePage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Correction Documents'),
        backgroundColor: backgroundColor,
      ),
      body: Center(
        child: Text('Correction documents will be displayed here.'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getImage(context);
        },
        child: Icon(Icons.add),
        backgroundColor: backgroundColor,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CoursePage(backgroundColor: Colors.blue),
  ));
}
