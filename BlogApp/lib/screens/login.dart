import 'package:blogapp/design/button_gradient.dart';
import 'package:blogapp/design/textfiel_decoration.dart';
import 'package:blogapp/screens/signup.dart';
import 'package:blogapp/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authService = Provider.of<AuthServices>(context);

    return Scaffold(
      backgroundColor: Color(0xffeaf3fa),
      body: SizedBox(
        width: size.width,
        child: SizedBox(
          height: size.height / 3,
          child: Image.asset(
            'images/blog1.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(17),
        width: size.width,
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
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
                padding: const EdgeInsets.all(10),
                child: GradientButtonFb1(
                  text: 'Login',
                  onPressed: () async {
                    if (_email.text.isEmpty && _password.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text('Email and Password can not be empty')));
                    } else {
                      await authService.signInWithEmailAndPassword(
                          _email.text, _password.text);
                    }
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Did not signed up yet?',
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black26,
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  },
                  child: const Text(
                    'SignUp',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.blue,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
