import 'package:expenses_app/pages/HomePage.dart';
import 'package:flutter/material.dart';

class FakeLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('Login now!'),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => HomePage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
