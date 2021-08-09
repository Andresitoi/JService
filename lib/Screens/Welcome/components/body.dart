import 'package:flutter/material.dart';
import 'package:jobserv/Screens/Login/login_screen.dart';
import 'package:jobserv/Screens/Signup/signup_screen.dart';
import 'package:jobserv/Screens/Welcome/components/background.dart';
import 'package:jobserv/components/rounded_button.dart';
import 'package:jobserv/constants.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Tu",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 52.0, color: kPrimaryColor),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedButton(
              text: "INGRESA",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context){ 
                      return LoginScreen();
                    }
                  )
                );
              },
            ),
            RoundedButton(
              text: "REGÍSTRATE",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      )
    );
  }
}


