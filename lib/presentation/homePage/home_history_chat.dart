import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixela/misc/models.dart';
import 'package:pixela/presentation/cubit/historyPage/history_page_cubit.dart';
import 'package:pixela/presentation/homePage/history/list_chats.dart';
import 'package:pixela/widgets/pixela.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late HistoryPageCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = HistoryPageCubit()..intialChats();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void deleteChat(id) {
    cubit.deleteChat(id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryPageCubit, HistoryPageState>(
        bloc: cubit,
        builder: (context, state) {
          return state.when(
              initial: (chats) => chats.isNotEmpty
                  ? ListChats(
                      chats: chats,
                      deleteChat: (id) {
                        deleteChat(id);
                      })
                  : const PixelaInfo(
                      type: pixelaType.sad,
                      text: "История пустая",
                    ),
              loading: () => const PixelaInfo(
                    type: pixelaType.load,
                    text: "Загружаю историю",
                  ),
              error: () => const PixelaInfo(
                    type: pixelaType.sad,
                    text: "Произошла ошибка во время прогрузки истории",
                  ));
        });
  }
}
