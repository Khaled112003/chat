// ignore_for_file: unused_local_variable


import 'package:chaaaaat/screans/signin.dart';
import 'package:chaaaaat/widget/custombuttonfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widget/cusstomtextfield.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;

  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 39, 57, 67),
        body: Form(
          key: formkey,
          child: ListView(
            children: [
              const SizedBox(
                height: 80,
              ),
              CircleAvatar(
                radius: 70,
                child: ClipOval(
                    child: Image.asset(
                  "assets/download.jpeg",
                  fit: BoxFit.cover,
                  width: 140,
                  height: 140,
                )),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "schoolar chat",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                children: [
                  Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              customtextfiald(
                hintText: "Email",
                onChanged: (data) {
                  email = data;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              customtextfiald(
                hintText: "Password",
                onChanged: (data) {
                  password = data;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              custombuttonfield(
                  text: "Register",
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      isloading = true;
                      setState(() {});
                      try {
                        await customUser();

                        Navigator.pushNamed(context, "sign_in",arguments: email);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == "weak password") {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("weak password")));
                        } else if (e.code == "email-already-in-use")
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "The account already exists for that email")));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("exist an error,pls try again")));
                      }
                      isloading = false;
                      setState(() {});
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have any account.',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, MaterialPageRoute(
                        builder: (context) {
                          return sign_in();
                        },
                      ));
                    },
                    child: const Text('login',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> customUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
