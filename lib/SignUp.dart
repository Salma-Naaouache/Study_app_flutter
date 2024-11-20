import 'package:flutter/material.dart';
import 'package:study_app/LogIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:study_app/Semester.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const Color customColor1 = Color(0xFF280D85);
const Color customColor2 = Color(0xFF921C94);
const Color customColor3 = Color(0xFF15725C);
const Color customColor4 = Color(0xFF225045);

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Image(
              image: AssetImage('images/signup.png'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: 'Username',
                hintStyle: TextStyle(color: Colors.white54),
                suffixIcon: Icon(Icons.person),
                filled: true,
                fillColor: Colors.deepOrange.shade200.withOpacity(0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.white54),
                suffixIcon: Icon(Icons.email),
                filled: true,
                fillColor: Colors.deepOrange.shade200.withOpacity(0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.white54),
                suffixIcon: Icon(Icons.lock),
                filled: true,
                fillColor: Colors.deepOrange.shade200.withOpacity(0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Confirm password',
                hintStyle: TextStyle(color: Colors.white54),
                suffixIcon: Icon(Icons.lock),
                filled: true,
                fillColor: Colors.deepOrange.shade200.withOpacity(0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                signUp(
                  emailController.text,
                  passwordController.text,
                  usernameController.text,
                  context,
                );
              },
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                primary: customColor4,
                shape: StadiumBorder(),
                elevation: 5,
                shadowColor: Colors.purple,
                minimumSize: Size.fromHeight(60),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Or sign up with',
              style: TextStyle(color: Colors.deepOrange.shade100),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                signInWithGoogle();
              },
              child: Container(
                width: 48,
                height: 48,
                child: Image.asset('images/google.png'),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.deepOrange.shade50),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to the Login page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => login()),
                    );
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.deepOrange.shade900),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void signUp(String email, String password, String fullName, BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) {
        postDetailsToFirestore(email, fullName, context);
      }).catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void postDetailsToFirestore(String email, String fullName, BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;

    Map<String, dynamic> userData = {
      'fullName': fullName,
      'email': email,
    };

    FirebaseFirestore.instance.collection('users').doc(user?.uid).set(userData)
        .then((value) {
      print('User data uploaded successfully!');
    }).catchError((error) {
      print('Error uploading user data: $error');
    });

    Fluttertoast.showToast(msg: "Account created successfully :) ");
    // Navigate to the Semester page
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Semester()));
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e);
    }
  }
}
