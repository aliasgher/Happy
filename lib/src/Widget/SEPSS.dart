import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app7/src/Widget/bezierContainer.dart';
import 'package:flutter_app7/src/Widget/loginPage21.dart';
import 'package:flutter_app7/src/Widget/thanksPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'bezierContainer.dart';
class SEPSS extends StatefulWidget {
   final String email2;
   //final String title;
 // RadioButton({Key key, this.title}) : super(key: key);
   SEPSS({Key key, @required this.email2}) : super(key: key);
  @override
  _SEPSS createState() => _SEPSS();
}

class _SEPSS extends State<SEPSS> {


  //final String title;
  //_RadioButtonState({Key key, @required this.email1, this.title}) : super(key: key);
  Widget _title() {
    return Center(
      child: Container(
        //child: Image.asset('images/headline.jpg'),
        //child: Text('Bring Your Contributions Out'+'\n'+'SEPSS - Personal Scorecard',style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
          child:RichText(
          text:
          TextSpan(
            text: '',
            //style: DefaultTextStyle.of(context).style,
              style: TextStyle(fontSize: 20),
            children: <TextSpan>[
              TextSpan(text: '   B',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: Colors.orange)),
              TextSpan(text: 'ring',style: TextStyle(color: Colors.orange) ),
              TextSpan(text: ' Y',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: Colors.orange)),
              TextSpan(text: 'our  ',style: TextStyle(color: Colors.orange)),
              TextSpan(text: '  C',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: Colors.white)),
              TextSpan(text: 'ontribution', ),
              TextSpan(text: ' O',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: Colors.white)),
              TextSpan(text: 'ut', ),

            ],
          ),
        )

      ),
    );
  }

  var _value;
  //String _value = 'null';
  bool visible = false ;

  // Getting value from TextField widget.
 // final emailController = TextEditingController();
  //emailController.text = 'ali';;
  TextEditingController safetyControler = TextEditingController()..text = '';
  TextEditingController EffeciencyControler = TextEditingController()..text = '';
  TextEditingController ProfitabilityControler = TextEditingController()..text = '';
  TextEditingController SustainabilityControler = TextEditingController()..text = '';
  TextEditingController SavingControler = TextEditingController()..text = '';

  Future userLogin() async{
    setState(() {
      visible = true ;
    });
    //safetyControler.text = '$_value';
    String safety = safetyControler.text;
    String efficiency = EffeciencyControler.text;
    String profitability = ProfitabilityControler.text;
    String sustainability = SustainabilityControler.text;
    String saving = SavingControler.text;
   // String empid;

    // SERVER LOGIN API URL
    var url = 'http://www.byco.com.pk/happyometer/spessform.php';

    // Store all data with Param Name.
    var data = {'safety': safety,'efficiency': efficiency,'profitability': profitability,'sustainability': sustainability,'saving': saving,'empid':'${widget.email2}'};

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If the Response Message is Matched.
    if(message == 'Login Matched')
    {

      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });

      // Navigate to Profile Screen & Sending Email to Next Screen.
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ThanksPage(email2: '${widget.email2}',))
      );
    }else{

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
  Future userLogin1() async{

    showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Note: Are you sure you want to skip?'),
        content: new Text('Once you skip you will not be able to fill this form today'),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: Text("NO    "),
          ),
          SizedBox(height: 26),
          new GestureDetector(
            onTap: () => userLogin2(),
            // onTap: () => Navigator.of(context).pop(true),
            child: Text("    YES   "),
          ),
        ],
      ),
    );
}
Future userLogin2() async{
  setState(() {
    visible = true ;
  });
  //safetyControler.text = '$_value';
  String safety = 'SKIP';
  String efficiency = 'SKIP';
  String profitability = 'SKIP';
  String sustainability = 'SKIP';
  String saving = 'SKIP';
  // String empid;

  // SERVER LOGIN API URL
  var url = 'http://www.byco.com.pk/happyometer/spessform.php';

  // Store all data with Param Name.
  var data = {'safety': safety,'efficiency': efficiency,'profitability': profitability,'sustainability': sustainability,'saving': saving,'empid':'${widget.email2}'};

  // Starting Web API Call.
  var response = await http.post(url, body: json.encode(data));

  // Getting Server response into variable.
  var message = jsonDecode(response.body);

  // If the Response Message is Matched.
  if(message == 'Login Matched')
  {

    // Hiding the CircularProgressIndicator.
    setState(() {
      visible = false;
    });

    // Navigate to Profile Screen & Sending Email to Next Screen.
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ThanksPage(email2: '${widget.email2}',))
    );
  }else{

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
      backgroundColor:Colors.white,
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
                    SizedBox(height: MediaQuery.of(context).size.height * .1),
                    _title(),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                          padding: EdgeInsets.all(1.0),
                          child: Text('Employee ID = ' + '${widget.email2}',
                              style: TextStyle(fontSize: 20))
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Safety:',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10.0),
                        child: TextField(
                          controller: safetyControler,
                          maxLines: 5,
                          //textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.multiline,
                          autocorrect: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '(Any Safety related action or initiative that I have ensured)',
                              fillColor: Color(0xfff3f3f4),
                              filled: true),
                        )
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Efficiency:',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10.0),
                        child: TextField(
                          controller: EffeciencyControler,
                          maxLines: 5,
                          //textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.multiline,
                          autocorrect: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '(Any time or quality efficiency I contributed towards)',
                              fillColor: Color(0xfff3f3f4),
                              filled: true),
                        )
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Profitability:',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10.0),
                        child: TextField(
                          controller: ProfitabilityControler,
                          maxLines: 5,
                          //textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.multiline,
                          autocorrect: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '(Any profit I brought in)',
                              fillColor: Color(0xfff3f3f4),
                              filled: true),
                        )
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Sustainability:',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10.0),
                        child: TextField(
                          controller: SustainabilityControler,
                          maxLines: 5,
                          //textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.multiline,
                          autocorrect: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '(What steps did I take today for a sustainable tomorrow)',
                              fillColor: Color(0xfff3f3f4),
                              filled: true),
                        )
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Saving:',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10.0),
                        child: TextField(
                          controller: SavingControler,
                          maxLines: 5,
                          //textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.multiline,
                          autocorrect: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '(Any Saving I achieved)',
                              fillColor: Color(0xfff3f3f4),
                              filled: true),
                        )
                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Please Note:',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'This is a voluntary declaration that will enable you to track,'
                            'stockpile and review your daily achievements and allow us to assess your '
                            'engagement level during the day.',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'This form is not part of the annual performance appraisal activity.',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Action on the form is compulsory, you may press "SKIP" if there are no '
                            'significant declarations for the day.',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            width:100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.red.shade200,
                                      offset: Offset(2, 4),
                                      blurRadius: 5,
                                      spreadRadius: 2)
                                ],
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [Color(0xffef5350), Color(0xfff44336)])),
                            child: Center(
                              child: FlatButton(
                                onPressed: userLogin1,
                                minWidth: 100,
                                color: Colors.transparent,
                                textColor: Colors.white,
                                padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                                child: Text('Skip >>'),

                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          // child: Icon(CupertinoIcons.film),
                          // SizedBox(height: height * .14),
                        ),
                        Center(
                          child: Container(
                            width:100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.grey.shade500,
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
                                minWidth: 100,
                                color: Colors.transparent,
                                textColor: Colors.white,
                                padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                                child: Text('Submit'),

                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  SizedBox(height: 30,)
                  // Text('$_value', style: TextStyle(fontSize: 23),),

                    // Container(
                    //
                    //     padding: EdgeInsets.all(10.0),
                    //     child: TextField(
                    //       controller: safety1,
                    //       keyboardType: TextInputType.number,
                    //       //keyboardType:TextInputType.number,
                    //       style: TextStyle(color: Colors.white),
                    //
                    //       // Value: '$_value',
                    //       textInputAction: TextInputAction.next,
                    //       autocorrect: true,
                    //       decoration: InputDecoration(
                    //           border: InputBorder.none,
                    //
                    //           //fillColor: Color(0xfff3f3f4),
                    //          ),
                    //     )
                    // ),
                  ],

                ),

              ),
            ),
          // Positioned(top: 40, left: 0, child:
          //  Center(
          //    child: Visibility(
          //        visible: visible,
          //        child: Container(
          //            margin: EdgeInsets.only(bottom: 30),
          //            child: CircularProgressIndicator(),
          //
          //        ),
          //    ),
          //  ),
          // ),
          ],
        ),
      ),
    ),);
  }
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Note: Are you sure you want to skip?'),
        content: new Text('Once you skip you will not be able to fill this form today'),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: Text("   NO    "),
          ),
          SizedBox(height: 26),
          new GestureDetector(
            onTap: () => userLogin2(),
            // onTap: () => Navigator.of(context).pop(true),
            child: Text("   YES   "),
          ),
        ],
      ),
    ) ??
        false;
  }
}
