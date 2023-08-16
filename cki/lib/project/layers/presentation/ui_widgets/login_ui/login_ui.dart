

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneAuthScreen1 extends StatefulWidget {
  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen1> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String _verificationId = "";

  Future<void> _verifyPhoneNumber(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Automatic verification if you're using a physical device
        // This callback is only called on Android.
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failure
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        // Save the verification ID to use later
        _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Called when the automatic code retrieval has timed out
        _verificationId = verificationId;
      },
    );
  }

  Future<void> _signInWithPhoneNumber(String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
      print("Logged in successfully!");
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Auth Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _verifyPhoneNumber("+244951121433"); // Replace with the desired phone number
              },
              child: Text("Send Verification Code"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _signInWithPhoneNumber("123456"); // Replace with the received SMS code
              },
              child: Text("Sign In with SMS Code"),
            ),
          ],
        ),
      ),
    );
  }
}