import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_netninja/services/auth.dart';
import 'package:flutter_firebase_netninja/widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: brownColor,
        elevation: 0,
        title: wText('Sign In to Brew Crew', whiteColor, 16, FontWeight.bold),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: ElevatedButton(
          child: Text('Sign In Anonymous'),
          onPressed: () async {
            try {
              dynamic result = await AuthServices().signInAnon();
              if (result == null) {
                wShowDialog(context, 'Login Failed', redColor);
              } else {
                wShowDialog(context, 'Login Success', greenColor);
                print(result);
              }
            } catch (e) {
              print("Error saat sign-in: $e");
              wShowDialog(context, 'Terjadi Kesalahan', orangeColor);
            }
          },
        ),
      ),
    );
  }
}
