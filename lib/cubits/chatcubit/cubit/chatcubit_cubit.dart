

import 'package:bloc/bloc.dart';
import 'package:chaaaaat/models/Model_listmessage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'chatcubit_state.dart';

class Chatcubit extends Cubit<ChatcubitState> {
  Chatcubit() : super(ChatcubitInitial());
    List<modelmessage> messageslist=[];
  CollectionReference messages =
      FirebaseFirestore.instance.collection('message');
      void send_message({required String message,required String email}){
        try {
  messages.add({
                      "message": message,
                      "time": DateTime.now(),"id":email
                    });
} on Exception catch (e) {
  // TODO
}

      }
      void get_message(){
        messages.orderBy("time",descending: true).snapshots().listen((event) {
          emit(messagesucssess_state(messages: messageslist));
        
          for (var element in event.docs) {
            messageslist.add(modelmessage.fromjson(element));

            
          }

        });

      }
}
