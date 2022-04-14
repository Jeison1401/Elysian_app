import 'package:elysian_app/ui/home_screen.dart';
import 'package:elysian_app/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'reusable/reusable_widget.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _usernameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [kPrimaryColor, kSecundaryColor, kSecundaryColorLight],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 150),
                child: Column(
                  children: [
                    reusableTextField("Enter Username", Icons.person_outline,
                        false, _usernameTextController),
                    const SizedBox(
                      height: 30,
                    ),
                    reusableTextField("Enter Email", Icons.person_outline,
                        false, _emailTextController),
                    const SizedBox(
                      height: 30,
                    ),
                    reusableTextField("Enter Password", Icons.lock_outline,
                        true, _passwordTextController),
                    const SizedBox(
                      height: 30,
                    ),
                    signInSgnUpButton(context, false, () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then((value) {
                        print("Created new account");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
