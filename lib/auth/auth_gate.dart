import 'package:chat_app/auth/login_register.dart';
import 'package:chat_app/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// this file checks if the user is logged in or not
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // if user is logged in
          if (snapshot.hasData){
            return HomePage();
          }

          // user is not logged in
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
