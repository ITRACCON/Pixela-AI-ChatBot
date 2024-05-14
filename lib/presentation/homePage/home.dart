import 'package:flutter/material.dart';
import 'package:pixela/misc/colors.dart';
import 'package:pixela/misc/models.dart';
import 'package:pixela/presentation/homePage/home/home_content.dart';
import 'package:pixela/presentation/homePage/home_history_chat.dart';
import 'package:pixela/widgets/sliding_segment.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  typeAI typeAIView = typeAI.chat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: AppColors.bgAppBar,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: const BoxDecoration(gradient: AppColors.bgGradient),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: [
                  SlidingSegment(
                      onValueChanged: (typeAI page) {
                        setState(() {
                          typeAIView = page;
                        });
                      },
                      value: typeAIView),
                  typeAIView == typeAI.chat ? const HomeContent() : const HistoryPage(),
                ],
              ),
            ]),
      ),
    );
  }
}
