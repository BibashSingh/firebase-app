import 'dart:async';

import 'package:fb_project/ui%20part/auth/Loginpage.dart';
import 'package:fb_project/ui%20part/post/post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class splashservices{
void isloggedin(BuildContext context){
  final auth = FirebaseAuth.instance;
  final user = auth.currentUser;

  if ( user != null){
  Timer(const Duration(seconds: 5),
  ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>const postpage()))
  );
}else{
    Timer(const Duration(seconds: 5),
  ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>const LoginPage()))
  );
}
}
  }

