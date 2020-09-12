//import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class MyReg extends StatefulWidget {
  @override
  _MyRegState createState() => _MyRegState();
}

class _MyRegState extends State<MyReg> {
  var authc = FirebaseAuth.instance;
  String email;
  String password;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration Page"),
      ),
      body: Center(
        child: Container(
          width: 320,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                onChanged: (value){
                  email = value;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail_outline),
                  hintText: "Enter Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              )
              ,TextField(
                obscureText: true,
                autocorrect: false,
                onChanged: (value){
                  password = value;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Enter password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
              ,Material(  
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(10),
                elevation: 10,
                child: MaterialButton(
                  minWidth: 200,
                  height: 50,
                  splashColor: Colors.black,
                  child: Text("Submit"), 
                    onPressed: () async{
                      try{
                   var user = await authc.createUserWithEmailAndPassword(email: email, password: password);
                    //Navigator.pushNamed(context, "login");
                    print(email);
                    print(password);
                    print(user);
                    if(user.additionalUserInfo.isNewUser == true )
                    {
                      Navigator.pushNamed(context, "chat");
                    }

                  }catch(e){
                    String error = e.toString();
                      Toast.show(error, context, duration: Toast.LENGTH_LONG , gravity:  Toast.BOTTOM);
                      
                      print(e);
                  }
                  },
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}