import 'package:chaaaaat/models/Model_listmessage.dart';
import 'package:flutter/material.dart';

import '../constans/const.dart';

class Chat_Text extends StatelessWidget {
  const Chat_Text({
    super.key, required this.txt,   });
  final modelmessage txt;
  

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(10),
       
        
        padding: EdgeInsets.all(10),
       
        decoration: const BoxDecoration(
          color: kprimarycolor,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)),
        ),
        
        child: Text(
          txt.text,
          style: TextStyle(color: Colors.white,fontSize: 17),
        ),
      ),
    );
  }
}
class Chatfriend_Text extends StatelessWidget {
  const Chatfriend_Text({
    super.key, required this.txt,   });
  final modelmessage txt;
  

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.all(10),
       
        
        padding: EdgeInsets.all(10),
       
        decoration: const BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)),
        ),
        
        child: Text(
          txt.text,
          style: TextStyle(color: Colors.white,fontSize: 17),
        ),
      ),
    );
  }
}