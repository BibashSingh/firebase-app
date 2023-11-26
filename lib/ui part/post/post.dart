import 'package:fb_project/ui%20part/auth/Loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class postpage extends StatefulWidget {
  const postpage({super.key});

  @override
  State<postpage> createState() => _postpageState();
}

class _postpageState extends State<postpage> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("POST",style: TextStyle(color: Colors.white,fontSize: 45),),
      backgroundColor: Colors.deepPurpleAccent,
      centerTitle: true,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(onPressed: (){
          auth.signOut().then((value) {
           Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));
          });
        }, icon:Icon(Icons.logout_outlined,color: Colors.white,))
      ],
      ),
    );
  }
}