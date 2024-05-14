import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixela/db/messages_table.dart';
import 'package:pixela/domain/repository/messages_repository.dart';
import 'package:pixela/misc/models.dart';
import 'package:pixela/models/ai_model.dart';

part 'chat_page_cubit.freezed.dart';

part 'chat_page_state.dart';

class ChatPageCubit extends Cubit<ChatPageState> {
  final MessagesRepository _messagesRepository = MessagesRepository();

  ChatPageCubit() : super(const Loading());

  Future<void> sendMessUser(String mess, String title, int id) async {
    if (id != 0) {
      final Messages chat = await _messagesRepository.getChat(id);
      List<MessageModele> messBd = chat.messages;
      List<MessageModele> messBufer;

      messBd.add(MessageModele(messageContent: mess, messageRole: roleMess.user));
      messBufer = List.of(messBd);
      emit(Intial(messBufer, id));

      AiModel req = await _messagesRepository.responseAI(mess);

      messBd.add(MessageModele(messageContent: req.text, messageRole: roleMess.AI));

      id = await _messagesRepository.createChat(messBd, title, id);

      messBufer = List.of(messBd);
      emit(Intial(messBufer, id));
    } else {
      List<MessageModele> messagesBuf = List.of(startMessanges);
      messagesBuf
          .add(MessageModele(messageContent: mess, messageRole: roleMess.user));

      emit(Intial(messagesBuf, id));

      AiModel req = await _messagesRepository.responseAI(mess);
      messagesBuf
          .add(MessageModele(messageContent: req.text, messageRole: roleMess.AI));

      id = await _messagesRepository.createChat(messagesBuf, title, id);
      emit(Intial(messagesBuf, id));
    }
  }

  Future<void> intialMessages(id) async {
    print(id);
    if (id == 0) {
      List<MessageModele> messages = startMessanges;
      print(startMessanges);
      emit(Intial(messages, 0));
    } else {
      final Messages chat = await _messagesRepository.getChat(id);
      List<MessageModele> messBd = chat.messages;
      emit(Intial(messBd, id));
    }
  }
}
