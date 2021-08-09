import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:jobserv/Screens/Login/login_screen.dart';
import 'package:jobserv/Screens/Welcome/home_page.dart';

// import 'Screens/Welcome/welcome_screen.dart';
import 'constants.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  
  final _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Auth',
          theme: ThemeData(
            primaryColor: kPrimaryLightColor,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: HomePage(),
        );
      }
    );
  }
}