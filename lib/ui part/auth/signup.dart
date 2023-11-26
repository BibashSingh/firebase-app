import 'package:fb_project/firebase%20services/utils.dart';
import 'package:flutter/material.dart';
import 'Loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  final formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  bool eye = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign up page",
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
                child: Image.asset("img/signup.jfif"),
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
                if (formkey.currentState!.validate()) {
                  setState(() {
                    loading=true;
                  });
                  _auth.createUserWithEmailAndPassword(
                      email: emailcontroller.text.toString(),
                      password: passcontroller.text.toString()).then((value){
                      setState(() {
                    loading=false;
                  });
                      }).onError((error, stackTrace) {
                        utils().toastmessage(error.toString());
                        setState(() {
                    loading=false;
                  });
                      });
                }
              },
              child: Container(
                height: 60,
                width: 380,
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(17),
                    boxShadow: [BoxShadow(
                      blurRadius: 1,
                      spreadRadius: 1,
                      color: Colors.grey,
                      offset: Offset(3, 7),
                    )],
                    ),
                child:  Center(
                    child:loading?CircularProgressIndicator(strokeWidth: 7,color:Colors.yellow[400] ,): Text(
                      
                  "Sign up",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                )),
              ),
            ),
            SizedBox(height: 15,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already sign up?"),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context,
                          MaterialPageRoute(builder: (_) => const LoginPage()));
                    },
                    child: const Text("Login"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
