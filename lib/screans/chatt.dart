import 'package:chaaaaat/constans/const.dart';
import 'package:chaaaaat/cubits/chatcubit/cubit/chatcubit_cubit.dart';
import 'package:chaaaaat/models/Model_listmessage.dart';

import 'package:chaaaaat/widget/Chat_text.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class chatt extends StatelessWidget {
  chatt({super.key});
  List<modelmessage> messageslist = [];
  CollectionReference messages =
      FirebaseFirestore.instance.collection('message');
  // اضافه ال  cllectionمن firestore
  TextEditingController controller = TextEditingController();
  final scrool = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    // دي علشان افرق بين اللي انا بكمه)(ببعت الايميل)
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kprimarycolor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                child: ClipOval(
                    child: Image.asset(
                  "assets/download.jpeg",
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                )),
              ),
              const Text(
                "chat",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            BlocConsumer<Chatcubit, ChatcubitState>(
              listener: (context, state) {
                if (state is messagesucssess_state) {
                  messageslist=state.messages;
                  
                }
              },
              builder: (context, state) {
                return Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: scrool,
                    itemCount: messageslist.length,
                    itemBuilder: (context, index) {
                      return messageslist[index].id == email
                          ? Chat_Text(txt: messageslist[index])
                          : Chatfriend_Text(txt: messageslist[index]);
                    },
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: TextField(
                controller: controller,
                onSubmitted: (data) {
                  controller.clear();

                  scrool.animateTo(
                    0,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 500),
                  );
                },
                decoration: const InputDecoration(
                    suffixIcon: Icon(
                      Icons.send,
                      color: kprimarycolor,
                    ),
                    hintText: "send message",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(color: Colors.red)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: kprimarycolor))),
              ),
            )
          ],
        ));
  }
}
