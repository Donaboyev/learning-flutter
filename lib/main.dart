import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:for_learning/auth_provider.dart';
import 'package:for_learning/auth.dart';
import 'package:for_learning/root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return null;
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return AuthProvider(
            auth: Auth(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Login demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: RootPage(),
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
