import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class MyChat extends StatefulWidget {
  @override
  _MyChatState createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> {
   String msg;
   var fs = FirebaseFirestore.instance;

  var authc = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("welcome to chat app"),
      actions: <Widget> [IconButton(icon : 
      Icon(Icons.exit_to_app), 
        onPressed: ()async{
        print("signout");
        await authc.signOut();
        Toast.show("signing out", context, duration: Toast.LENGTH_SHORT , gravity:  Toast.BOTTOM);
        Navigator.pushNamed(context, "login");
      })
      ],
      ),
      body: Column(
        children: <Widget>[
          TextField( onChanged: (value) {
            msg = value;
          },),
          FlatButton(onPressed: () async{
              print(msg);
              var msgdoc = await fs.collection("chat").get();
              print(msgdoc);
          }, 
          child: Text("send msg"), 
          color: Colors.blue,
          hoverColor: Colors.blueGrey,),
          RaisedButton(onPressed: (){
            try{
            var user =authc.currentUser;
            print(user);
            String username = user.email.toString();
            Toast.show(username, context, duration: Toast.LENGTH_LONG , gravity:  Toast.BOTTOM);
            }catch(e){
              String error = e.toString();
              Toast.show(error, context, duration: Toast.LENGTH_LONG , gravity:  Toast.BOTTOM);
              print(e);
            }
          }, 
          child: Text("check who you are"),),
        ],
      ),
    );
  }
}