import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobserv/Screens/Welcome/welcome_screen.dart';
import 'package:jobserv/Screens/home/chat.dart';
import 'package:jobserv/provider/google_sign_in.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Tu AsistenteBot'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: const IconButton(
          //   icon: Icon(Icons.menu),
          //   tooltip: 'Navigation menu',
          //   onPressed: null,
          // ),
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
            child: Chat()
        ),


        drawer: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Text('Drawer Header'),
                ),
                ListTile(
                  title: const Text('Configuraciones'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Cerrar Sesion'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                    provider.logout();
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => WelcomeScreen()));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Salir'),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    setState(() {});
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => WelcomeScreen()));
                  },
                ),
              ],
            ),
          )




    );
  }
}