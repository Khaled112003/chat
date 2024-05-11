import 'package:chaaaaat/cubits/logincubit/loginstates.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class logincubit extends Cubit<loginstate> {
  logincubit() : super(initialstate());
  Future<void> customUser(
      {required String email, required String password}) async {
    try {
      emit(loooadingstate());
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      emit(succsesstate());
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        emit(failurestate(message: 'user-not-found'));
      } else if (e.code == "wrong-password")
        emit(failurestate(message: 'wrong-password'));
    } catch (e) {
      emit(failurestate(message: 'something wrong, please try agine'));
    }
  }
}
