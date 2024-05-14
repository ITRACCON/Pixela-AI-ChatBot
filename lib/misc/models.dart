import 'package:pixela/db/messages_table.dart';

enum typeAI { chat, history }

enum roleMess { user, AI }

enum pixelaType { normal, load, sad }

final List<MessageModele> startMessanges = [
  MessageModele(messageContent: "Привет !", messageRole: roleMess.AI),
  MessageModele(messageContent: "Чем могу помочь ?", messageRole: roleMess.AI)
];
