import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobserv/Screens/Login/components/background.dart';
import 'package:jobserv/Screens/Signup/signup_screen.dart';
import 'package:jobserv/Screens/home/home_screen.dart';
import 'package:jobserv/components/already_have_an_account_check.dart';
import 'package:jobserv/components/google_signup_button_widget.dart';
import 'package:jobserv/components/rounded_button.dart';
import 'package:jobserv/components/rounded_input_field.dart';
import 'package:jobserv/components/rounded_password_field.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final emailController = TextEditingController(); 
  final passwordController = TextEditingController(); 


  _logIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text,
      );
      
      setState(() {});

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));

    } on FirebaseAuthException catch (e) {
      var message = '';

      switch (e.code) {
        case 'invalid-email':
          message = 'El email introducido no es valido';
          break;
        case 'user-disabled':
          message = 'El usuario esta deshabilitado'; 
          break;
        case 'user-not-found':
          message = 'El usuario no se encuentra'; 
          break;
        case 'wrong-password':
          message = 'contraseña incorrecta'; 
          break;
      }
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text('Error al Inciar'),
          content: Text(message),
          actions: [
            TextButton(onPressed: () {
              Navigator.of(context).pop();
            }, child: Text('Ok'))
          ],
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // User user = FirebaseAuth.instance.currentUser;

    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              // 'Auth User (Logged ' + (user == null ? 'out' : 'in') + ')',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0, color: kPrimaryColor),
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              ctrl: emailController,
              hintText: "Correo",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              ctrl: passwordController,
              hintText: "Contraseña",
              onChanged: (value){},
            ),
            RoundedButton(
              text: "INGRESAR", 
              press: () =>  _logIn()
            ),
            SizedBox(height: size.height * 0.03,),
            GoogleSignupButtonWidget(),
            SizedBox(height: size.height * 0.03,),
            AlreadyHaveAnAccountCheck(
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
      ),);
  }
}
