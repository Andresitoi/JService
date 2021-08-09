import 'package:flutter/material.dart';

import '../constants.dart';
import 'text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final TextEditingController ctrl;
  final ValueChanged<String> onChanged;
  final String hintText;
  const RoundedPasswordField({
    Key key, 
    this.onChanged, 
    this.ctrl, 
    this.hintText, 
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _isHidden = true;
  void _toggleVisibility(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return TextFieldContainer(
      child: TextField(
        controller: widget.ctrl,
        obscureText: widget.hintText == "Contraseña" ? _isHidden : true,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: widget.hintText,
          icon: Icon(
            Icons.lock, 
            color: kPrimaryColor,
          ),
          // suffixIcon: Icon(
          //   Icons.visibility,
          //   color: kPrimaryColor,
          // ),
          suffixIcon: widget.hintText == "Contraseña" ? IconButton(
            onPressed: _toggleVisibility,
            color: kPrimaryColor,
            icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
          ) : null,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

