import 'package:flutter/material.dart';
import 'package:pos_system/core/utils/styles.dart';

class ReturnMoneyTitleWidget2 extends StatelessWidget {
  const ReturnMoneyTitleWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Text("اسم الصنف",
              textAlign: TextAlign.start,
              maxLines: 1,
              style: TextStyles.font10GreyColor78Weight400),
        ),
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 2,
          child: Text("المتاح ",
              textAlign: TextAlign.start,
              maxLines: 1,
              style: TextStyles.font10GreyColor78Weight400),
        ),
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 2,
          child: Text("المطلوب ",
              textAlign: TextAlign.start,
              maxLines: 1,
              style: TextStyles.font10GreyColor78Weight400),
        ),
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 2,
          child: Text("السعر",
              textAlign: TextAlign.start,
              maxLines: 1,
              style: TextStyles.font10GreyColor78Weight400),
        ),
      ],
    );
  }
}
