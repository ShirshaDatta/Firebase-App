import 'package:chatApp/screens/chat.dart';
import 'package:chatApp/screens/home.dart';
import 'package:chatApp/screens/login.dart';
import 'package:chatApp/screens/reg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(MaterialApp(
    initialRoute: "home",
    routes: {
      "home" : (context) => MyHome(),
      "reg" : (context) => MyReg(),
      "login" : (context) => MyLogin(),
      "chat" : (context) => MyChat(), 
    },
    debugShowCheckedModeBanner: false,
    )
    );
}


