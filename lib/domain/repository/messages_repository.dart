import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pixela/data/api_ai.dart';
import 'package:pixela/db/messages_table.dart';
import 'package:pixela/models/ai_model.dart';

class MessagesRepository {
  final ApiAI _apiAI = ApiAI();
  late Isar bd;

  Future<Isar> open() async {
    final dir = await getApplicationDocumentsDirectory();
    Isar bd = await Isar.openAsync(
      schemas: [MessagesSchema],
      directory: dir.path,
    );
    return bd;
  }

  Future<AiModel> responseAI(String message) async {
    AiModel req = await _apiAI.getInfo(message);
    return req;
  }

  Future<int> createChat(List<MessageModele>listMess, String title, int id) async {
    bd = await open();

    final newMess =
        Messages(id == 0 ? bd.messages.autoIncrement() : id, title, listMess);

    await bd.writeAsync((bd) {
      return bd.messages.put(newMess);
    });

    return newMess.id;
  }

  Future<Messages> getChat(int id) async {
    bd = await open();
    Messages chat = bd.messages.get(id)!;
    return chat;
  }

  Future<List<Messages>> getAllChat() async {
    bd = await open();
    List<Messages> allChat = bd.messages.where().findAll();
    return allChat;
  }

  Future<void> clearHistory() async {
    bd = await open();
    bd.writeAsync((isar) => isar.messages.clear());
  }

  Future<void> deleteChat(int id) async {
    bd = await open();
    await bd.writeAsync((isar) => isar.messages.delete(id));
  }
}
