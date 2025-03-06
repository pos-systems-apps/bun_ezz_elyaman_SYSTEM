import 'package:flutter/material.dart';
import 'package:pos_system/core/utils/styles.dart';

class MoneyWidget1 extends StatelessWidget {
  final String text;
  final String value;

  const MoneyWidget1({required this.text, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(text,
                textAlign: TextAlign.start,
                maxLines: 2,
                style: TextStyles.font10GreyColor78Weight400)),
        Expanded(
            child: Text(value,
                textAlign: TextAlign.end,
                maxLines: 2,
                style: TextStyles.font10BlackColorWeight400)),
      ],
    );
  }
}
