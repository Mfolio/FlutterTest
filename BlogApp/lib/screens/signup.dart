import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../design/button_gradient.dart';
import '../design/textfiel_decoration.dart';
import '../services/auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authService = Provider.of<AuthServices>(context);

    return Scaffold(
      body: Container(
        height: size.height / 3,
        width: size.width,
        child: Image.asset(
          'images/signup.jpg',
          fit: BoxFit.cover,
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(25),
        height: size.height / 1.5,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SignUp',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.purpleAccent.shade700,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'Just join our Blog app and get daily news',
              style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 45,
            ),
            const Text(
              'Email',
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.black26,
                  fontWeight: FontWeight.w400),
            ),
            TextFieldDecoration(
              text_controller: _email,
              size: size,
              hint: 'Email',
              icon: CupertinoIcons.mail,
            ),
            const Text(
              'Password',
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.black26,
                  fontWeight: FontWeight.w400),
            ),
            TextFieldDecoration(
              text_controller: _password,
              size: size,
              hint: 'Password',
              icon: CupertinoIcons.lock,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: GradientButtonFb1(
                  text: 'Login',
                  onPressed: () async {
                    if (_email.text.isEmpty && _password.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text('Email and Password can not be empty')));
                    } else {
                      await authService.createUserWithEmailAndPassword(
                          _email.text, _password.text);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
