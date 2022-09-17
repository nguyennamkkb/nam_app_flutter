import 'package:flutter/material.dart';
import 'package:nam_app/src/blocs/login_bloc.dart';
import 'package:nam_app/src/resources/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc bloc = new LoginBloc();
  bool _showPass = true;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  var _userErr = "Tai khoan khong hop le";
  var _passErr = "Mat khau khong hop le";
  var _userInvalid = false;
  var _passInvalid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        // alignment: Alignment.centerLeft,
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
                child: Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffd8d8d8)),
                  child: FlutterLogo(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Text(
                "Hello\nWelcome back",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: StreamBuilder(
                stream: bloc.userStream,
                builder: (context, snapshot) => TextField(
                  controller: _userController,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      labelText: "User name",
                      errorText: snapshot.hasError? snapshot.error.toString() : null,
                      labelStyle: TextStyle(
                        color: Color(0xf8888888),
                        fontSize: 15,
                      )),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    StreamBuilder(
                      stream: bloc.passStream,
                      builder: (context, snapshot) => TextField(
                        controller: _passController,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        obscureText: _showPass,
                        decoration: InputDecoration(
                            labelText: "Password",
                            errorText:  snapshot.hasError? snapshot.error.toString() : null,
                            labelStyle: TextStyle(
                              color: Color(0xf8888888),
                              fontSize: 15,
                            )),
                      ),
                    ),
                    GestureDetector(
                      onTap: onToggleShowPass,
                      child: Text(
                        !_showPass ? "HIDE" : "SHOW",
                        style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)))),
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  onPressed: onSignInClick,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "NEW USER? SIGN UP",
                      style: TextStyle(fontSize: 14, color: Colors.black38),
                    ),
                    Text(
                      "FORGOT PASSWORD",
                      style: TextStyle(fontSize: 14, color: Colors.blue),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSignInClick() {
    setState(() {
     if(bloc.isValidInfo(_userController.text, _passController.text)){

       Navigator.push(context, MaterialPageRoute(builder: goToHome));
     }

    });
  }

  Widget goToHome(BuildContext context) {
    return HomePage();
  }
}
