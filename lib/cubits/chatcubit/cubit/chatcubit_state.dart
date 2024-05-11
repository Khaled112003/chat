part of 'chatcubit_cubit.dart';

 class ChatcubitState {}

final class ChatcubitInitial extends ChatcubitState {}
final class messagesucssess_state extends ChatcubitState {
  messagesucssess_state({required this.messages});
  List<modelmessage> messages;
}
