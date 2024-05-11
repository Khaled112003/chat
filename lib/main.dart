import 'package:chaaaaat/cubits/chatcubit/cubit/chatcubit_cubit.dart';
import 'package:chaaaaat/cubits/logincubit/logincubit.dart';
import 'package:chaaaaat/firebase_options.dart';
import 'package:chaaaaat/screans/RegisterPage.dart';
import 'package:chaaaaat/screans/chatt.dart';

import 'package:chaaaaat/screans/signin.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp( khaled());
}

class khaled extends StatelessWidget {
   khaled({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => logincubit(),),
       BlocProvider(create: (context) => Chatcubit(),)

    ],
      child: MaterialApp(routes: {
        'sign_in': (context) => sign_in(),
        'RegisterPage': (context) => RegisterPage(),
        'chatt': (context) => chatt()
      }, initialRoute: 'sign_in'),
    );
  }
}
