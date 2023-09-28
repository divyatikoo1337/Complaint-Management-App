import 'package:complaint_management_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _showLogin = true;

  String userInputNameR = '';
  String userInputEmailR = '';
  String userInputNumberR = '';
  String userInputUrlR = '';
  String userInputPasswordR = '';
  String userInputCPasswordR = '';

  String userInputNameL = '';
  String userInputPasswordL = '';

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
                          onChanged: (value) {
                            setState(() {
                              userInputNameL = value;
                            });
                          },
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
                          onChanged: (value) {
                            setState(() {
                              userInputPasswordL = value;
                            });
                          },
                          // decoration: InputDecoration(
                          //     hintText: 'fghj2345vb',
                          //     hintStyle: TextStyle(
                          //       color: Theme.of(context).backgroundColor,
                          //     ),
                          //     contentPadding: EdgeInsets.all(8),
                          //     ),
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => ComplaintsScreen()));
                          },
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
                              onChanged: (value) {
                                setState(() {
                                  userInputNameR = value;
                                });
                              },
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
                              onChanged: (value) {
                                setState(() {
                                  userInputEmailR = value;
                                });
                              },
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
                              onChanged: (value) {
                                setState(() {
                                  userInputNumberR = value;
                                });
                              },
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
                              onChanged: (value) {
                                setState(() {
                                  userInputUrlR = value;
                                });
                              },
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
                              onChanged: (value) {
                                setState(() {
                                  userInputPasswordR = value;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 7,
                            ),

                            //confirm password
                            Text(
                              "Confirm Password:",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).backgroundColor),
                            ),
                            TextField(
                              onChanged: (value) {
                                setState(() {
                                  userInputCPasswordR = value;
                                });
                              },
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => ComplaintsScreen()));
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
