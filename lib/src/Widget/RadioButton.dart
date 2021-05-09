import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app7/src/Widget/bezierContainer.dart';
import 'package:flutter_app7/src/Widget/SEPSS.dart';
import 'package:flutter_app7/src/Widget/loginPage21.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'bezierContainer.dart';

class RadioButton extends StatefulWidget {
  final String email2;
  //final String title;
  // RadioButton({Key key, this.title}) : super(key: key);
  RadioButton({Key key, @required this.email2}) : super(key: key);
  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  //final String title;
  //_RadioButtonState({Key key, @required this.email1, this.title}) : super(key: key);
  Widget _title() {
    return Center(
      child: Container(
        child: Image.asset('images/headline.png'),
        //child: Text('How was your day today?'+'',style: TextStyle(fontSize: 30,fontStyle: FontStyle.italic),),
      ),
    );
  }

  String radioItem = '';
  var _value;
  //String _value = 'null';
  bool visible = false;

  // Getting value from TextField widget.
  // final emailController = TextEditingController();
  //emailController.text = 'ali';;
  TextEditingController emailController = TextEditingController()..text = '';

  Future userLogin() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    //String email;
    emailController.text = '$_value';
    String email = emailController.text;
    //String password = passwordController.text;

    // SERVER LOGIN API URL
    var url = 'http://www.byco.com.pk/happyometer/login_user.php';

    // Store all data with Param Name.
    var data = {'email': email, 'empid': '${widget.email2}'};

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If the Response Message is Matched.
    if (message == 'Login Matched') {
      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });

      // Navigate to Profile Screen & Sending Email to Next Screen.
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SEPSS(email2: '${widget.email2}')));
    } else {
      // If Email or Password did not Matched.
      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });

      // Showing Alert Dialog with Response JSON Message.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Log out',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: new Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        //height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height * .15),

                    _title(),

                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                          padding: EdgeInsets.all(1.0),
                          child: Text('Employee ID = ' + '${widget.email2}',
                              style: TextStyle(fontSize: 20))),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Container(
                      padding: EdgeInsets.all(1.0),
                      // child: Icon(CupertinoIcons.film),
                      // SizedBox(height: height * .14),
                    ),
                    // Column(
                    //   children: [
                    //     RadioListTile(
                    //       groupValue: radioItem,
                    //       title: Text('Wow'),
                    //       value: 'Wow',
                    //       onChanged: (val) {
                    //         setState(() {
                    //           radioItem = val;
                    //         });
                    //       },
                    //     ),
                    //
                    //     RadioListTile(
                    //       groupValue: radioItem,
                    //       title: Text('Happy'),
                    //       value: 'Happy',
                    //       onChanged: (val) {
                    //         setState(() {
                    //           radioItem = val;
                    //         });
                    //       },
                    //     ),
                    //     RadioListTile(
                    //       groupValue: radioItem,
                    //       title: Text('Okay'),
                    //       value: 'Okay',
                    //       onChanged: (val) {
                    //         setState(() {
                    //           radioItem = val;
                    //         });
                    //       },
                    //     ),
                    //     RadioListTile(
                    //       groupValue: radioItem,
                    //       title: Text('Not Bad'),
                    //       value: 'Not Bad',
                    //       onChanged: (val) {
                    //         setState(() {
                    //           radioItem = val;
                    //         });
                    //       },
                    //     ),
                    //     RadioListTile(
                    //       groupValue: radioItem,
                    //       title: Text('Hmmm'),
                    //       value: 'Hmmm',
                    //       onChanged: (val) {
                    //         setState(() {
                    //           radioItem = val;
                    //         });
                    //       },
                    //     ),
                    //
                    //     Text('$radioItem', style: TextStyle(fontSize: 23),)
                    //   //  Text('$radioItem', style: TextStyle(fontSize: 23),),
                    //
                    //
                    //   ],
                    // ),
                    Container(
                      padding: EdgeInsets.fromLTRB(12,0,0,20),

                      child: GestureDetector(
                        onTap: () => setState(() => _value = 'Very Happy'),
                        child: AnimatedContainer(
                          height: 50,
                          width: 156,
                          duration:Duration(seconds: 2),
                          curve:Curves.fastOutSlowIn,
                          decoration: _value == 'Very Happy'
                              ? BoxDecoration(
                            color: Colors.grey[300],
                            border: Border.all(color:Colors.orange,width:3),
                            borderRadius: BorderRadius.circular(15.0),
                          ): BoxDecoration(
                            color: Colors.white,
                            //border: Border.all(color:Colors.orange,width:3),
                            // borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Image.asset('images/f1.png'),
                        ),
                      ),
                    ),
                    SizedBox(width: 4),
                    Container(
                      padding: EdgeInsets.fromLTRB(12,0,0,20),
                      child: GestureDetector(
                        onTap: () => setState(() => _value = 'Happy'),
                        child: AnimatedContainer(
                          height: 50,
                          width: 156,
                          duration:Duration(seconds: 2),
                          curve:Curves.fastOutSlowIn,
                          decoration: _value == 'Happy'
                              ? BoxDecoration(
                            color: Colors.grey[300],
                            border: Border.all(color:Colors.orange,width:3),
                            borderRadius: BorderRadius.circular(15.0),
                          ): BoxDecoration(
                            color: Colors.white,
                            //border: Border.all(color:Colors.orange,width:3),
                            // borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Image.asset('images/f2.png'),
                        ),
                      ),
                    ),
                    SizedBox(width: 4),
                    Container(
                      padding: EdgeInsets.fromLTRB(12,0,0,20),
                      child: GestureDetector(
                        onTap: () => setState(
                            () => _value = 'Neither Happy Nor Unhappy'),
                        child: AnimatedContainer(
                          height: 50,
                          width: 156,
                          duration:Duration(seconds: 2),
                          curve:Curves.fastOutSlowIn,
                          decoration: _value == 'Neither Happy Nor Unhappy'
                              ? BoxDecoration(
                            color: Colors.grey[300],
                            border: Border.all(color:Colors.orange,width:3),
                            borderRadius: BorderRadius.circular(15.0),
                          ): BoxDecoration(
                            color: Colors.white,
                            //border: Border.all(color:Colors.orange,width:3),
                            // borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Image.asset('images/f3.png'),
                        ),
                      ),
                    ),
                    SizedBox(width: 4),
                    Container(
                      padding: EdgeInsets.fromLTRB(12,0,0,20),
                      child: GestureDetector(
                        onTap: () => setState(() => _value = 'Not Very Happy'),
                        child: AnimatedContainer(
                          height: 50,
                          width: 156,
                          duration:Duration(seconds: 2),
                          curve:Curves.fastOutSlowIn,
                          decoration: _value == 'Not Very Happy'
                              ? BoxDecoration(
                            color: Colors.grey[300],
                            border: Border.all(color:Colors.orange,width:3),
                            borderRadius: BorderRadius.circular(15.0),
                          ): BoxDecoration(
                            color: Colors.white,
                            //border: Border.all(color:Colors.orange,width:3),
                            // borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Image.asset('images/f4.png'),
                        ),
                      ),
                    ),
                    SizedBox(width: 4),
                    Container(
                      padding: EdgeInsets.fromLTRB(12,0,0,30),
                      child: GestureDetector(
                        onTap: () => setState(() => _value = 'Unhappy'),
                        child: AnimatedContainer(
                          height: 50,
                          width: 156,

                          duration:Duration(seconds: 2),
                          curve:Curves.fastOutSlowIn,
                            decoration: _value == 'Unhappy'
                             ? BoxDecoration(
                             color: Colors.grey[300],
                             border: Border.all(color:Colors.orange,width:3),
                             borderRadius: BorderRadius.circular(15.0),
                           ): BoxDecoration(
                                color: Colors.white,
                                //border: Border.all(color:Colors.orange,width:3),
                                // borderRadius: BorderRadius.circular(25.0),
                              ),
                          child: Image.asset('images/f5.png'),
                        ),
                      ),
                    ),

                    Center(
                      child: Container(

                        width: 250,
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
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xfffbb448),
                                  Color(0xfff7892b)
                                ])),
                        child: Center(
                          child: FlatButton(
                            onPressed: userLogin,
                            minWidth: 200,
                            color: Colors.transparent,
                            textColor: Colors.white,
                            padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                            child: Text('Next >>'),
                          ),
                        ),
                      ),
                    ),
                    // Text('$_value', style: TextStyle(fontSize: 23),),

                    Container(
                        padding: EdgeInsets.all(10.0),
                        child: TextField(
                          controller: emailController,
                          keyboardType: TextInputType.number,
                          //keyboardType:TextInputType.number,
                          style: TextStyle(color: Colors.white),

                          // Value: '$_value',
                          textInputAction: TextInputAction.next,
                          autocorrect: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,

                            //fillColor: Color(0xfff3f3f4),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
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
