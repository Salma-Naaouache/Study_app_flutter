import 'package:flutter/material.dart';
import 'package:study_app/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';

const Color customColor1 = Color(0xFF280D85);
const Color customColor2 = Color(0xFF921C94);
const Color customColor3 = Color(0xFF15725C);
const Color customColor4 = Color(0xFF225045);

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordccontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center column content
            children: [
              SizedBox(height: 30,),
              Image(
                image: AssetImage('images/login.png'),
              ),
              Text(
                "Get back on track!",
                style: TextStyle(
                  color: Colors.deepOrange.shade900,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,
                  fontSize: 40,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: customColor3.withOpacity(0.3),
                    suffixIcon: Icon(Icons.email),
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.white54),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: customColor3),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: passwordccontroller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: customColor3.withOpacity(0.3),
                    suffixIcon: Icon(Icons.lock),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.white54),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: customColor3),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text(
                  'Log in',
                  style: TextStyle(color: Colors.white54),
                ),
                onPressed: () {
                  signin(emailcontroller.text, passwordccontroller.text); // Corrected password controller name
                },
                style: ElevatedButton.styleFrom(
                  primary: customColor4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: customColor3),
                  ),
                  minimumSize: Size.fromHeight(50),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to the SignUp page
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.deepOrange.shade900,
                        decoration: TextDecoration.underline,
                        decorationThickness: 3.0,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Or log in with',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  signInWithGoogle(); // Define this method
                },
                child: Container(
                  width: 48,
                  height: 48,
                  child: Image.asset('images/google.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signin(String email,String password) async{
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: emailcontroller.text,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signInWithGoogle() async {
    // Define the sign in with Google method
  }
}
