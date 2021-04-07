import 'package:flutter/material.dart';
import 'package:google_drive_tryout/google_oauth.dart';
import 'package:google_drive_tryout/sign_in_page.dart';

class Name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(name),
          RaisedButton(
            onPressed: () {
              signOutGoogle().then((value) => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  })));
            },
            child: Text("Sign Out"),
          )
        ],
      )),
    );
  }
}
