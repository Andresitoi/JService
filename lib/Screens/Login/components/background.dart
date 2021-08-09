import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    this.child,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   child: Image.asset(
          //     "assets/images/virus.png",
          //     width: size.width * 0.35,
          //   )
          // ),
          // Positioned(
          //   top: 150,
          //   left: 0,
          //   child: Image.asset(
          //     "assets/images/virus.png",
          //     width: size.width * 0.15,
          //   )
          // ),
          // Positioned(
          //   bottom: -70,
          //   right: -70,
          //   child: Image.asset(
          //     "assets/images/virus.png",
          //     width: size.width * 0.5,
          //   )
          // ),
          child,
        ],
      ),
    );
  }
}