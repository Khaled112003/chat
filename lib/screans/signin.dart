// ignore_for_file: unused_local_variable

import 'package:chaaaaat/constans/message.dart';
import 'package:chaaaaat/cubits/logincubit/logincubit.dart';
import 'package:chaaaaat/cubits/logincubit/loginstates.dart';
import 'package:chaaaaat/widget/cusstomtextfield.dart';
import 'package:chaaaaat/widget/custombuttonfield.dart';


import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constans/const.dart';
import 'RegisterPage.dart';

class sign_in extends StatelessWidget {
  String? email;

  String? password;

  GlobalKey<FormState> formkey = GlobalKey();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<logincubit, loginstate>(
      listener: (context, state) {
        if(state is loooadingstate){
          isloading=true;
        }
        else if (state is succsesstate){
          Navigator.pushNamed(context, 'chatt',
                              arguments: email);
                              isloading=false;
          
        }else if(state is failurestate){
          
          showSnackBar(context, state.message);
          isloading=false;
                                    
           
          
          
        }
      },
      builder:(context, state) => ModalProgressHUD(
        inAsyncCall: isloading,
        child: Scaffold(
          backgroundColor: kprimarycolor,
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
                      "login",
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
                  obscureText: true,
                  hintText: "Password",
                  onChanged: (data) {
                    password = data;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),

                // من هناااااا

                custombuttonfield(
                    text: "sign in",
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        
BlocProvider.of<logincubit>(context).customUser(email: email!, password: password!);
                        
                      }
                    }),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'dont have any account.',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return RegisterPage();
                          },
                        ));
                      },
                      child: const Text('sign up',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}
