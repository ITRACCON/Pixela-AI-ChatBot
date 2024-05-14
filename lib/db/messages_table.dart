import 'package:isar/isar.dart';
import 'package:pixela/misc/models.dart';

part 'messages_table.g.dart';

@collection
class Messages {
  final int id;
  final String title;
  final List<MessageModele> messages;
  
  Messages(this.id, this.title, this.messages);
}

@embedded
class MessageModele {
  String messageContent;
  roleMess messageRole;

  MessageModele(
      {required this.messageContent,
      required this.messageRole});
}
