import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kirk_app/login_screen.dart';
import 'package:kirk_app/style_constants.dart';

class ForgotPassScreen2 extends StatefulWidget {
  static const String id = 'forgot_pass_screen_2';

  @override
  _ForgotPassScreen2State createState() => _ForgotPassScreen2State();
}

class _ForgotPassScreen2State extends State<ForgotPassScreen2> {
  final codeTextController = TextEditingController();
  final passTextController = TextEditingController();
  final vPassTextController = TextEditingController();

  String code = '';
  String pass = '';
  String vPass = '';

  bool errorFree = false;

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid Information'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                      "The code you entered is incorrect or your passwords don't match or are too short"),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/fullscreen.png"),
                  fit: BoxFit.cover,
                )),
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .04,
            ),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .045,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * .06),
                        child: Text(
                          'Forgot My Password',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: .105 * MediaQuery.of(context).size.width,
                            fontFamily: 'Carter One',
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .05,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.0),
                          child: TextField(
                            style: TextStyle(color: Colors.black),
                            controller: codeTextController,
                            onChanged: (value) {
                              code = value;
                            },
                            decoration: InputDecoration(
                              hintText: "Enter the code sent to your email",
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 1.5),
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(1.0))),
                            ),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .03,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.0),
                          child: TextField(
                            obscureText: true,
                            style: TextStyle(color: Colors.black),
                            controller: passTextController,
                            onChanged: (value) {
                              pass = value;
                            },
                            decoration: InputDecoration(
                              hintText: "Enter your new password",
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 1.5),
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(1.0))),
                            ),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .03,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.0),
                          child: TextField(
                            obscureText: true,
                            style: TextStyle(color: Colors.black),
                            controller: vPassTextController,
                            onChanged: (value) {
                              vPass = value;
                            },
                            decoration: InputDecoration(
                              hintText: "Verify your new password",
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 1.5),
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(1.0))),
                            ),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .05,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 0.0),
                        child: Material(
                          elevation: 5.0,
                          color: Colors.blue[1000],
                          borderRadius: BorderRadius.circular(60.0),
                          child: MaterialButton(
                            onPressed: () {
                              errorFree = (pass.length > 3 && pass == vPass);
                              if (errorFree) {
                                Navigator.pushNamed(context, LoginScreen.id);
                              } else {
                                _showMyDialog();
                              }
                            },
                            minWidth: MediaQuery.of(context).size.width * .5,
                            height: MediaQuery.of(context).size.height * .05,
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: .045 * MediaQuery.of(context).size.width,
                                fontFamily: font,
                                color: Colors.red[200],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]))));
  }
}