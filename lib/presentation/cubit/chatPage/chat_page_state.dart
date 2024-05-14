part of 'chat_page_cubit.dart';

@freezed
abstract class ChatPageState with _$ChatPageState {
  const factory ChatPageState.initial(List<MessageModele> messages, int id) = Intial;

  const factory ChatPageState.loading() = Loading;

  const factory ChatPageState.error() = Error;
}
