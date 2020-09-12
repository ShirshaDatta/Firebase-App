import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  String email;
  String password;
  bool sspin = false;

  var authc = FirebaseAuth.instance;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Here")),
      body: ModalProgressHUD(
              inAsyncCall: sspin ,
              child: Center(
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
                      onPressed: () async {
                        setState(() {
                           sspin = true;
                        });
                        try {
                        var signin = await authc.signInWithEmailAndPassword(email: email, password: password);
                        if(signin != null ){
                          Navigator.pushNamed(context, "chat");
                          setState(() {
                            sspin = false;
                          });
                        }
                        print(signin);
                      }
                      catch(e)
                      {
                        String error = e.toString();
                        Toast.show(error, context, duration: Toast.LENGTH_LONG , gravity:  Toast.BOTTOM);
                        print(e);
                      }
                      }
                  )
                      
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}