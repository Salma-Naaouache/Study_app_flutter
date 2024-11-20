import 'package:flutter/material.dart';
import 'package:study_app/SubjectPage.dart';
import 'StudyRoomPage.dart';
import 'package:study_app/LogIn.dart';
const Color customColor1 = Color(0xFF280D85);
const Color customColor2 = Color(0xFF97059B);
const Color customColor3 = Color(0xFF15725C);

class Semester extends StatelessWidget {
  // Define subjects for each semester
  final List<List<String>> semesters = [
    ['Algebre 1', 'Analyse 1', 'Architecture des ordinateurs', 'Python', 'Electronique analogique', 'Languages'],
    ['Algebre 2', 'Analyse 2', 'Systeme d\'exploitation', 'Electronique numerique', 'Python avance', 'Langues'],
    ['Algebre 3', 'Analyse 3', 'C/C++', 'Logiciel de simulation', 'Developpement personnel', 'Langues'],
    ['Analyse numerique', 'Electronique embarquees', 'Calculs parallele', 'Probabilites et statistique', 'Theatre', 'Langues'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Semester'),
        backgroundColor: Colors.teal,
      ),
      drawer: MenuDrawer(), // Add the drawer here
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                navigateToSubjectPage(context, semesters[0], Colors.teal); // Pass the color here
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                elevation: MaterialStateProperty.all<double>(25),
                fixedSize: MaterialStateProperty.all<Size>(Size(200, 50)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              child: Text('Semester 1'),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
                navigateToSubjectPage(context, semesters[1], customColor2); // Pass the color here
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(customColor2),
                elevation: MaterialStateProperty.all<double>(25),
                fixedSize: MaterialStateProperty.all<Size>(Size(200, 50)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              child: Text('Semester 2'),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
                navigateToSubjectPage(context, semesters[2], Colors.orange); // Pass the color here
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                elevation: MaterialStateProperty.all<double>(25),
                fixedSize: MaterialStateProperty.all<Size>(Size(200, 50)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              child: Text('Semester 3'),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
                navigateToSubjectPage(context, semesters[3], customColor1); // Pass the color here
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(customColor1),
                elevation: MaterialStateProperty.all<double>(25),
                fixedSize: MaterialStateProperty.all<Size>(Size(200, 50)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              child: Text('Semester 4'),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToSubjectPage(BuildContext context, List<String> semester, Color color) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SubjectPage(semester: semester, backgroundColor: color)), // Pass the color to SubjectPage
    );
  }

}

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.note),
            title: Text('Study Room'),
            onTap: () {
              Navigator.pop(context); // Close the menu drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StudyRoomPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Show a confirmation dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Logout"),
                    content: Text("Are you sure you want to logout?"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the dialog
                        },
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to the login page and close the current page and menu drawer
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => login()),
                                (Route<dynamic> route) => false,
                          );
                        },
                        child: Text("Logout"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

