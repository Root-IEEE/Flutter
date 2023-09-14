import '../shared/components/constants/constants.dart';

class Message {
  final String message;
  final String id;

  Message(this.message, this.id);

  factory Message.fromJson(jsonData) {
    return Message(jsonData[kMessage], 'ahmedmahmoudyahia72@gmail.com');
  }
}
