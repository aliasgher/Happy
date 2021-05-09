import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app7/src/Widget/loginPage21.dart';
import 'package:flutter_app7/src/Widget/welcomePage.dart';
import 'package:flutter_app7/src/Widget/signup.dart';
import 'package:google_fonts/google_fonts.dart';

class regconfirmPage extends StatefulWidget {
  regconfirmPage({Key key, this.name}) : super(key: key);

  final String name;

  @override
  _regconfirmPageState createState() => _regconfirmPageState();
}

class _regconfirmPageState extends State<regconfirmPage> {
  Widget _submitButton() {
    return InkWell(
      onTap: () {
       // exit(0);
        Navigator.push(
           context, MaterialPageRoute(builder: (context) => WelcomePage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width-100,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xffdf8e33).withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Color(0xfff7892b)),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Text(
          'Register now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _label() {

    return Container(

       margin: EdgeInsets.only(top: 40, left: 12),
        child: Column(
          children: <Widget>[
            Text(
              'Your have registerd successfully',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),


          ],
        ));
  }

  Widget _title() {
    return Container(

        child: Image.asset('images/nlogo1.png'),
      );

  }

  @override
  Widget build(BuildContext context) {

    return  WillPopScope(
        onWillPop: _onBackPressed,
        child: new Scaffold(

      body:SingleChildScrollView(

        child:Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xfffbb448), Color(0xffe46b10)])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _title(),
              SizedBox(height: 60,),
              Center(child: _label()),
              Center(child: _submitButton())
            ],
          ),
        ),
      ),
    ),);
  }
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: Text("NO    "),
          ),
          SizedBox(height: 26),
          new GestureDetector(
            onTap: () => exit(0),
            // onTap: () => Navigator.of(context).pop(true),
            child: Text("YES   "),
          ),
        ],
      ),
    ) ??
        false;
  }
}
