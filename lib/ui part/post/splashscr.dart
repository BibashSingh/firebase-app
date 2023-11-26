import 'package:fb_project/firebase%20services/splashservices.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  splashservices splashscr = splashservices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashscr.isloggedin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.deepPurpleAccent,
          child: const Column(
            children: [
              SizedBox(
                  height: 500,
                  width: 300,
                  child: Image(image: AssetImage("img/fbb.png"))),
              Text(
                "Wel-come to my\nFirebase project",
                style: TextStyle(fontSize: 45, color: Color.fromARGB(255, 250, 228, 31)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
