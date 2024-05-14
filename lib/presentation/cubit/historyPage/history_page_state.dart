part of 'history_page_cubit.dart';

@freezed
abstract class HistoryPageState with _$HistoryPageState {
  const factory HistoryPageState.initial(List<Messages> chats) = Intial;

  const factory HistoryPageState.loading() = Loading;

  const factory HistoryPageState.error() = Error;
}
