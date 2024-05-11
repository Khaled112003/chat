import 'package:flutter/material.dart';

// ignore: must_be_immutable
class customtextfiald extends StatelessWidget {
  customtextfiald({super.key, required this.hintText, this.onChanged,this.obscureText=false});
  final String hintText;
  Function(String)? onChanged;
  bool ?obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:obscureText! ,


    
      validator: (data) {
        if (data!.isEmpty) return "field is required";
      },
      onChanged: onChanged,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.blue))
          //  hintText: hintText
          ,
          hintStyle: const TextStyle(color: Colors.white, fontSize: 20),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white)),
          hintText: hintText
          // ,hintStyle: const TextStyle(color: Colors.white, fontSize: 20)

          ),
    );
  }
}
