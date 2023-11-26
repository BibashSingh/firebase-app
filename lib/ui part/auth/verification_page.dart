
// ignore_for_file: non_constant_identifier_names

import 'package:fb_project/firebase%20services/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../post/post.dart';

class VerifyWithPhoneNumber extends StatefulWidget {
  final String verificationId;
   const VerifyWithPhoneNumber({Key?key,required this.verificationId}) : super (key: key);

  @override
  State<VerifyWithPhoneNumber> createState() => _VerifyWithPhoneNumberState();
}

class _VerifyWithPhoneNumberState extends State<VerifyWithPhoneNumber> {
final otpcontroller=TextEditingController();
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
          SizedBox(height: 90,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 80),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller:otpcontroller ,
              decoration: InputDecoration(
                hintText: "Enter your 6 digit code "
              ),
            ),
          ),
          SizedBox(height: 40,),
          InkWell(
            onTap: () async{
           final Credential=PhoneAuthProvider.credential(
            verificationId:widget.verificationId,
           
           smsCode: otpcontroller.text.toString() );
           try{
            await auth.signInWithCredential(Credential);
        Navigator.push(context, MaterialPageRoute(builder: (_)=>const postpage()));
           }
           catch(e){
            utils().toastmessage(e.toString());
           }
                                                           
            },
            child: Container(
              height: 50,
              width: 255,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.deepPurpleAccent
              ),
              child: Center(child: Text("Login"),),
            ),
          )
        ],
      ),
    );
  }
}