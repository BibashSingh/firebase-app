import 'package:fb_project/firebase%20services/utils.dart';
import 'package:fb_project/ui%20part/auth/verification_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginWithnumber extends StatefulWidget {
  const LoginWithnumber({super.key});

  @override
  State<LoginWithnumber> createState() => _LoginWithnumberState();
}

class _LoginWithnumberState extends State<LoginWithnumber> {
  final phonecontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login with phone number"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 90,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 80),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: phonecontroller,
              decoration: InputDecoration(hintText: "Enter your phone number "),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () {
              auth.verifyPhoneNumber(
                  phoneNumber: phonecontroller.text.toString(),
                  verificationCompleted: (_) {},
                  verificationFailed: (e) {
                    utils().toastmessage(e.toString());
                  },
                  codeSent: (String verificationId, int? token) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => VerifyWithPhoneNumber(
                                  verificationId: verificationId,
                                )));
                  },
                  codeAutoRetrievalTimeout: (e) {
                    utils().toastmessage(e.toString());
                  });
            },
            child: Container(
              height: 50,
              width: 255,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.deepPurpleAccent),
              child: Center(
                child: Text("Verify"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
