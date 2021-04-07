import 'package:flutter/material.dart';
import 'package:google_drive_tryout/name.dart';

import 'google_oauth.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _login;

  @override
  void initState() {
    super.initState();
    _login = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Parking Reporter"),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                _login
                    ? _signInButton()
                    : Column(
                  children: <Widget>[
                    SizedBox(height: 50),
                    _signInButton(),
                  ],
                  mainAxisSize: MainAxisSize.min,
                ),
                FlatButton(
                    onPressed: () {
                      setState(() {
                        _login = !_login;
                      });
                    },
                    child: Text(!_login ? "Login" : "Sign Up"))
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () async {
        signInWithGoogle().then((result) {
          print("tried");
          print(result.metadata.toString() + "ehloo");
          if (result != null) {
            print("signed in");
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Name();
                  },
                ),
              );
          }

        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Log In',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
