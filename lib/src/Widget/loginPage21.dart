import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app7/src/Widget/signup.dart';
import 'package:flutter_app7/src/Widget/errorPage.dart';
import 'package:flutter_app7/src/Widget/RadioButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cupertino_icons/cupertino_icons.dart';
import 'bezierContainer.dart';

class LoginUser extends StatefulWidget {

  LoginUserState createState() => LoginUserState();

}
class LoginUserState extends State {

  // For CircularProgressIndicator.
  bool visible = false ;

  // Getting value from TextField widget.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future userLogin() async{

    // Showing CircularProgressIndicator.
    setState(() {
      visible = true ;
    });

    // Getting value from Controller
    String email = emailController.text;
    String password = passwordController.text;

    // SERVER LOGIN API URL
    var url = 'http://www.byco.com.pk/happyometer/login/login_user.php';

    // Store all data with Param Name.
    var data = {'email': email, 'password' : password};

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);
   //  // import 'dart:convert';



    // If the Response Message is Matched.
    if(message == 'Login Matchedtrue')
    {

      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });

      // Navigate to Profile Screen & Sending Email to Next Screen.
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RadioButton(email2:emailController.text))
      );
    }
    else if(message == 'Login Matchedfalse')
    {

      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });

      // Navigate to Profile Screen & Sending Email to Next Screen.
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => errorPage(email2:emailController.text))
      );
    }
    else{

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
      );}

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
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
  Widget _title() {
    return Center(
      child: Container(

        child: Image.asset('images/nlogo1.png'),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return WillPopScope(
        onWillPop: _onBackPressed,
        child: new Scaffold(
      //backgroundColor:Colors.white,
      //scrollDirection:Axis.horizontal,
       body: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Positioned(
                      top: -MediaQuery.of(context).size.height * .15,
                      right: -MediaQuery.of(context).size.width * .4,
                      child: BezierContainer()),
                  Container(

                    child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        _backButton(),
                        SizedBox(height: height * .1),
                        _title(),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'Emp id',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),

                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(10.0),
                            child: TextField(
                              controller: emailController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              autocorrect: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Color(0xfff3f3f4),
                                  filled: true),
                            )
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'Pin',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(10.0),
                            child: TextField(
                              controller: passwordController,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.number,
                              autocorrect: true,
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Color(0xfff3f3f4),
                                  filled: true),

                            )
                        ),
                        SizedBox(height: 40),
                        Center(
                          child: Container(
                            width:340,
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
                                    colors: [Color(0xfffbb448), Color(0xfff7892b)])),
                            child: Center(
                              child: FlatButton(
                                onPressed: userLogin,
                                minWidth: 300,
                                color: Colors.transparent,
                                textColor: Colors.white,
                                padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                                child: Text('Login',style: TextStyle(fontSize: 20, color: Colors.white),),

                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Visibility(
                              visible: visible,
                              child: Container(
                                  margin: EdgeInsets.only(bottom: 30),
                                  child: CircularProgressIndicator()
                              )
                          ),
                        ),
                      ],

                    )

                  ),

                ],

              ),
            )
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
class ProfileScreen extends StatelessWidget {

// Creating String Var to Hold sent Email.
  final String email;
//enum BestTutorSite {javapoint.w3schools.}
// Receiving Email using Constructor.
  ProfileScreen({Key key, @required this.email}) : super(key: key);
//BestTutorSite _site
// User Logout Function.
  logout(BuildContext context){

    Navigator.pop(context);

  }
  Widget _title() {
    return Center(
      child: Container(

       // child: Image.asset('images/nlogo1.png'),
          child: Text('Employee ID = ' + email,
              style: TextStyle(fontSize: 20))
      ),
    );
  }
  _handlRadioValueChange(){

  }
  @override
  Widget build(BuildContext context) {
    String radioItem = '';
   // crossAxisAlignment: CrossAxisAlignment.start;
    return Scaffold(
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
                //  crossAxisAlignment: CrossAxisAlignment.center,
                 // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height * .2),
                    _title(),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        padding: EdgeInsets.all(1.0),
                        child: Text('Employee ID = ' + email,
                            style: TextStyle(fontSize: 20))
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        padding: EdgeInsets.all(1.0),
                        child: Icon(CupertinoIcons.film),
                   // SizedBox(height: height * .14),
                    ),
                    Column(
                      children: [
                       // new Radio(value: 0, groupValue: radioValue1, onChanged: _handlRadioValueChange()),
                        //new Radio(value: 1, groupValue: radioValue1, onChanged: _handlRadioValueChange()),
                        RadioListTile(
                          groupValue: radioItem,
                          title: Text('Radio Button Item 1'),
                          value: 'Item 1',
                          onChanged: (val) {
                          //  setState(() {
                            //  radioItem = val;
                            //});
                          },
                        ),

                        RadioListTile(
                          groupValue: radioItem,
                          title: Text('Radio Button Item 2'),
                          value: 'Item 2',
                          onChanged: (val) {
                            //setState(() {
                             // radioItem = val;
                            //});
                          },
                        ),

                        Text('$radioItem', style: TextStyle(fontSize: 23),),
                        ListTile(
                          title: Text('Radio A'),
                          leading: Radio(
                            value: 'WoW',
  //                          groupValue: _site,


                          )
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            //Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}