import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixela/presentation/cubit/chatPage/chat_page_cubit.dart';
import 'package:pixela/presentation/chatPage/chat_%D1%81ontent.dart';

class ChatPage extends StatefulWidget {
  final String title;
  final int id;
  const ChatPage({required this.title, super.key, required this.id});

  @override
  State<ChatPage> createState() => _ChatPagetState();
}

class _ChatPagetState extends State<ChatPage> {
  late ChatPageCubit cubit;
  final _chatInputController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    cubit = ChatPageCubit()..intialMessages(widget.id);
  }

  @override
  void dispose() {
    _chatInputController.dispose();
    super.dispose();
  }

  void sendMess(id) {
    cubit.sendMessUser(_chatInputController.text, widget.title, id);
    _chatInputController.clear();

    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(microseconds: 300), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatPageCubit, ChatPageState>(
        bloc: cubit,
        builder: (context, state) {
          return state.when(
              initial: (message, id) {
                return ChatContent(
                  messages: message,
                  chatInputController: _chatInputController,
                  scrollController: _scrollController,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    sendMess(id);
                  },
                  title: widget.title,
                );
              },
              loading: () => Container(),
              error: () => Container());
        });
  }
}
