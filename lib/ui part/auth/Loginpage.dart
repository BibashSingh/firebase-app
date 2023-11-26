import 'package:fb_project/firebase%20services/utils.dart';
import 'package:fb_project/ui%20part/auth/Login_with_phonenumber.dart';
import 'package:fb_project/ui%20part/post/post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  bool eye = true;
  final auth = FirebaseAuth.instance;
 bool loading=false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Login page",
          style: TextStyle(
              color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 300,
                width: 200,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.orange),
                child: Image.asset("img/userr.png"),
              ),
            ),
            Form(
                key: formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 380,
                      child: TextFormField(
                        controller: emailcontroller,
                        decoration: const InputDecoration(
                          hintText: "E-mail",
                          prefixIcon: Icon(Icons.mail_outline_sharp),
                          border: OutlineInputBorder(),
                          //helperText: "enter the email in correct format"
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter the valid email";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 80,
                      width: 380,
                      child: TextFormField(
                        controller: passcontroller,
                        obscureText: eye,
                        decoration: InputDecoration(
                          hintText: "password",
                          prefixIcon: const Icon(Icons.lock_outline_rounded),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                eye = !eye;
                              });
                            },
                            child: Icon(eye
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined),
                          ),
                          border: const OutlineInputBorder(),
                          //helperText: "enter the password in correct format"
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter the valid password";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  loading=true;
                });
                if (formkey.currentState!.validate()) {
                  auth.signInWithEmailAndPassword(
                          email: emailcontroller.text.toString(),
                          password: passcontroller.text.toString())
                      .then((value) {
                        setState(() {
                          loading=false;
                        });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => postpage()));
                        utils().toastmessage(emailcontroller.toString());
                  }).onError((error, stackTrace) {
                    setState(() {
                      loading=false;
                    });
                    utils().toastmessage(error.toString());
                  });
                }
              },
              child: Container(
                height: 60,
                width: 380,
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(17),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      spreadRadius: 1,
                      color: Colors.grey,
                      offset: Offset(3, 7),
                    )
                  ],
                ),
                child:  Center(
                    child: loading?CircularProgressIndicator(strokeWidth: 7,color: Colors.yellow[400],):     Text(
                  "Login",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                )),
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?",style: TextStyle(fontSize: 20),),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const SignUP()));
                    },
                    child: const Text("Sign up",style: TextStyle(fontSize: 20),))
              ],
            ),
            SizedBox(height: 15,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginWithnumber()));
              },
              child: Container(
                height: 55,
                width: 405,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.black),
                
                //    boxShadow: [
                //     BoxShadow(
                //       blurRadius: 1,
                //       spreadRadius: 1,
                //       color: Colors.grey,
                //       offset: Offset(3, 7),
                //     )
                //   ],
                 ),
                child: Center(
                child: Text("Login with phone number",style: TextStyle(fontSize: 20),/*/style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),*/),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
