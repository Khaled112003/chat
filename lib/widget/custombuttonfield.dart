import 'package:flutter/material.dart';

class custombuttonfield extends StatelessWidget {
   custombuttonfield({super.key, required this.text,  this.onTap});
  final String text;
   VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.white),
              width: double.infinity,
              height: 50,
              child: Center(
                  child: Text(text
                ,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
            ),
    );
  }
}