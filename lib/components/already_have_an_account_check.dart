import 'package:flutter/material.dart';

import '../constants.dart';


class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key, 
    this.login = true, 
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "No tienes una cuenta ? " : "Ya tienes una cuenta ? ",
          style: TextStyle(color: kPrimaryColor,fontSize: 14),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In", 
            style: TextStyle(
              color: kPrimaryColor, 
              fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
}
