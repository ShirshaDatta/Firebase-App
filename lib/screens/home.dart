import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          
            children: <Widget>[
              Material(
                
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(10),
                elevation: 10,
                child: MaterialButton(
                  minWidth: 200,
                  height: 50,
                  splashColor: Colors.black,
                  padding: EdgeInsets.all(10),
                  color: Colors.white12, 
                  child: Text("Register"), 
                  onPressed: (){
                    Navigator.pushNamed(context, "reg");
                  })
                ),
                SizedBox(
                  height: 20,
                ),
                Material(  
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(10),
                elevation: 10,
                child: MaterialButton(
                  minWidth: 200,
                  height: 50,
                  splashColor: Colors.black,
                  child: Text("Login"), 
                  onPressed: (){
                    Navigator.pushNamed(context, "login");
                  })
                ),
            ],
          ),
        ),
      ),
      
    );
  }
}