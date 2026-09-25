import 'package:flutter/material.dart';

class Customtextfeild extends StatelessWidget {
  String texthint;
  bool? obsecure;
  String label;
  Function(String)? onChanged;
  String? Function(String?)? validator;
  IconData? icon;
  Customtextfeild({
    this.icon,
    required this.label,
    required this.texthint,
    this.onChanged,
    this.validator,
    this.obsecure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecure!,
      validator: validator,
      onChanged: onChanged,
      style: TextStyle(fontSize: 20, color: Colors.white),
      decoration: InputDecoration(
        suffixIcon: Icon(icon, color: Colors.white, size: 35),
        labelText: label,
        labelStyle: TextStyle(fontSize: 23, color: Colors.white),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        hintText: texthint,
        hintStyle: TextStyle(fontSize: 20, color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
