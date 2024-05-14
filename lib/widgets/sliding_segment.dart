import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:pixela/misc/colors.dart';
import 'package:pixela/misc/models.dart';
import 'package:pixela/widgets/text.dart';

class SlidingSegment extends StatelessWidget {
  final typeAI value;
  final void Function(typeAI) onValueChanged;
  const SlidingSegment(
      {required this.onValueChanged, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSlidingSegmentedControl<typeAI>(
      initialValue: value,
      children: {
        typeAI.chat: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const AppText(
                text: 'Chat AI',
                textStyle: TextStyle(color: Colors.white, fontSize: 20))),
        typeAI.history: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const AppText(
                text: 'History',
                textStyle: TextStyle(color: Colors.white, fontSize: 20))),
      },
      decoration: BoxDecoration(
        color: AppColors.bgButton,
        borderRadius: BorderRadius.circular(30),
      ),
      thumbDecoration: BoxDecoration(
        color: AppColors.bgButton2,
        borderRadius: BorderRadius.circular(30),
      ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInToLinear,
      onValueChanged: onValueChanged,
    );
  }
}
