import 'package:flutter/material.dart';

import 'SigninPage.dart';

class GotoSignInPage extends StatelessWidget {
  final ValueChanged onPressed;
  const GotoSignInPage({
    Key key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "You have an Account ?   ",
          style: TextStyle(color: Colors.grey),
        ),
        GestureDetector(
          child: Text(
            "Sign In",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return MyAppSignInPage();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
