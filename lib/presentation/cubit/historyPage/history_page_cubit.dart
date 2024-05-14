import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixela/db/messages_table.dart';
import 'package:pixela/domain/repository/messages_repository.dart';

part 'history_page_cubit.freezed.dart';

part 'history_page_state.dart';

class HistoryPageCubit extends Cubit<HistoryPageState> {
  final MessagesRepository _messagesRepository = MessagesRepository();

  HistoryPageCubit() : super(const Loading());

  Future<void> intialChats() async {
    List<Messages> chats = await _messagesRepository.getAllChat();
    chats = chats..sort(((a, b) => b.id.compareTo(a.id)));
    emit(Intial(chats));
  }

  Future<void> deleteChat(id) async {
    await _messagesRepository.deleteChat(id);
    List<Messages> chats = await _messagesRepository.getAllChat();
    chats = chats..sort(((a, b) => b.id.compareTo(a.id)));
    emit(Intial(chats));
  }
}
