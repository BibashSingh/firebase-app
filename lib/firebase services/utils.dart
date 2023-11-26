import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
class utils{
  void toastmessage(String message){
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Color.fromARGB(255, 216, 130, 11),
        textColor: Colors.white,
        fontSize: 24,
    );
  }
}