import 'package:flutter/material.dart';

import 'menu.dart';


class Login extends StatefulWidget{
  const Login({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _login createState()=>new _login();
}

class _login extends State<Login>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final emailField=TextField(
      obscureText: false,
      style: TextStyle(fontSize: 20.0),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0,15.0,20.0,15.0),
        hintText: 'email',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
      ),
    );
    final passField=TextField(
      obscureText: true,
      style: TextStyle(fontSize: 20.0),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0,15.0,20.0,15.0),
        hintText: 'Password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
      ),
    );

    final loginButton=Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blueAccent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>SwipeToRefreshExample()));
        },
        child: Text(
          "login",
        ),
      ),
    );
    
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                    child: Container(
                      width: 70.0,
                      height: 70.0,
                      // child: Image.asset('lib/assets/ic_launcher.png'),
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  SizedBox(height: 40.0,),
                  emailField,
                  SizedBox(height: 16.0,),
                  passField,
                  SizedBox(height: 10.0,),
                  loginButton
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}