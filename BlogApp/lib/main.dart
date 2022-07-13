import 'package:blogapp/screens/login.dart';
import 'package:blogapp/screens/signup.dart';
import 'package:blogapp/services/auth.dart';
import 'package:blogapp/services/data_class.dart';
import 'package:blogapp/usercheck.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => AuthServices(),
        ),
      ],
      child: MaterialApp(
        title: 'Blog',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const UserCheck(),
      ),
    );
  }
}
