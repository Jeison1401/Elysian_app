import 'package:elysian_app/ui/home_screen.dart';
import 'package:elysian_app/ui/reusable/reusable_widget.dart';
import 'package:elysian_app/ui/signup_screen.dart';
import 'package:elysian_app/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [kPrimaryColor, kSecundaryColor, kSecundaryColorLight],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(100),
              child: Image.asset("assets/images/elysianLogo.png"),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  reusableTextField("Enter Username", Icons.person_outline,
                      false, _emailTextController),
                  const SizedBox(
                    height: 30,
                  ),
                  reusableTextField("Enter Password", Icons.lock_outline, true,
                      _passwordTextController),
                  const SizedBox(
                    height: 30,
                  ),
                  signInSgnUpButton(context, true, () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    }).onError((error, stackTrace) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Credenciales incorrectas'),
                            actions: [
                              TextButton(
                                child: const Text('Ok'),
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black)),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                            elevation: 24.0,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            backgroundColor: Colors.white,
                          );
                        },
                      );
                      print("Error ${error.toString()}");
                    });
                  }),
                  signUpOption(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Row signUpOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Don't have account?",
          style: TextStyle(color: Colors.black87, fontStyle: FontStyle.italic)),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUpScreen()));
        },
        child: const Text(
          "Sign Up",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      )
    ],
  );
}
