import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complaint_management_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _emailControllerL = TextEditingController();
  final TextEditingController _passwordControllerL = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailControllerR = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _passwordControllerR = TextEditingController();
  final TextEditingController _urlController = TextEditingController();

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();


  Future<void> _signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: _emailControllerL.text,
        password: _passwordControllerL.text,
      );
      print('Successfully signed in: ${userCredential.user!.uid}');
      // Navigate to the next screen or perform desired actions
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => ComplaintsScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }
  }

  Future<void> _registerWithEmailAndPassword() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: _emailControllerR.text,
        password: _passwordControllerR.text,
      );
      print('Successfully registered: ${userCredential.user!.uid}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('Email is already in use.');
      } else if (e.code == 'invalid-email') {
        print('Invalid email address.');
      }
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  bool _showLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: _showLogin
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Welcome Back",
                      style: TextStyle(
                          fontSize: 30, color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Container(
                    width: 270,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Email ID",
                            style: TextStyle(
                                color: Theme.of(context).backgroundColor,
                                fontSize: 20),
                          ),
                        ),
                        TextField(
                          controller: _emailControllerL,
                          decoration: InputDecoration(
                              hintText: 'johndoe@gmail.com',
                              hintStyle: TextStyle(
                                color: Theme.of(context).backgroundColor,
                              ),
                              contentPadding: EdgeInsets.all(8)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Password",
                            style: TextStyle(
                                color: Theme.of(context).backgroundColor,
                                fontSize: 20),
                          ),
                        ),
                        TextField(
                          controller: _passwordControllerL,
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _showLogin = false;
                      });
                    },
                    child: Text(
                      "No Account? Register NOW!",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Theme.of(context).primaryColor),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextButton.icon(
                          onPressed: () => _signInWithEmailAndPassword(),
                          icon: Icon(
                            Icons.login,
                            color: Theme.of(context).backgroundColor,
                          ),
                          label: Text(
                            "Login",
                            style: TextStyle(
                              color: Theme.of(context).backgroundColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Center(
              //register container
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "WELCOME",
                        style: TextStyle(
                            fontSize: 25,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Text(
                              "Name:",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).backgroundColor),
                            ),
                            TextField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                  hintText: 'Chandler Bing',
                                  hintStyle: TextStyle(
                                    color: Theme.of(context).backgroundColor,
                                  ),
                                  contentPadding: EdgeInsets.all(8)),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            //email
                            Text(
                              "Email:",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).backgroundColor),
                            ),
                            TextField(
                              controller: _emailControllerR,
                              decoration: InputDecoration(
                                  hintText: 'chandlerbing@gmail.com',
                                  hintStyle: TextStyle(
                                    color: Theme.of(context).backgroundColor,
                                  ),
                                  contentPadding: EdgeInsets.all(8)),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            //number
                            Text(
                              "Phone Number:",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).backgroundColor),
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              controller: _numberController,
                              decoration: InputDecoration(
                                  hintText: '9878664455',
                                  hintStyle: TextStyle(
                                    color: Theme.of(context).backgroundColor,
                                  ),
                                  contentPadding: EdgeInsets.all(8)),
                            ),
                            const SizedBox(
                              height: 7,
                            ),

                            //Photo URL
                            Text(
                              "Photo URL:",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).backgroundColor),
                            ),
                            TextField(
                              controller: _urlController,
                              decoration: InputDecoration(
                                  hintText: 'image.png',
                                  hintStyle: TextStyle(
                                    color: Theme.of(context).backgroundColor,
                                  ),
                                  contentPadding: EdgeInsets.all(8)),
                            ),
                            const SizedBox(
                              height: 7,
                            ),

                            //password
                            Text(
                              "Password:",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).backgroundColor),
                            ),
                            TextField(
                              controller: _passwordControllerR,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _showLogin = true;
                        });
                      },
                      child: Text(
                        'Have an account? Login Here',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Theme.of(context).primaryColor),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextButton.icon(
                            onPressed: () {
                              _registerWithEmailAndPassword();
                              CollectionReference collRef = FirebaseFirestore
                                  .instance
                                  .collection('register');
                              collRef.add({
                                'email': _emailControllerR.text,
                                'name': _nameController.text,
                                'number': _numberController.text,
                                'password': _passwordControllerR.text,
                                'url': _urlController.text,
                              }).then((DocumentReference documentRef) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => ComplaintsScreen()));
                              }).catchError((error) {
                                print('Error adding document: $error');
                              });
                            },
                            icon: Icon(
                              Icons.app_registration,
                              color: Theme.of(context).backgroundColor,
                            ),
                            label: Text(
                              "Register",
                              style: TextStyle(
                                color: Theme.of(context).backgroundColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
