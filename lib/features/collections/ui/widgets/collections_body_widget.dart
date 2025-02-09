import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/features/collections/logic/collections_cubit.dart';
import 'package:pos_system/features/collections/ui/widgets/collections_buttons_widget.dart';
import 'package:pos_system/features/collections/ui/widgets/select_items/collections_bank_account_widget.dart';
import 'package:pos_system/features/collections/ui/widgets/select_items/collections_pay_account_widget.dart';
import 'package:pos_system/features/collections/ui/widgets/text_fields/bill_text_field_widget.dart';
import 'package:pos_system/features/collections/ui/widgets/text_fields/money_text_field_widget.dart';
import 'package:pos_system/features/collections/ui/widgets/text_fields/notes_text_field_widget.dart';
import 'package:pos_system/features/collections/ui/widgets/text_fields/search_user_widget.dart';
import 'package:pos_system/features/collections/ui/widgets/upload_image_widget.dart';

class CollectionsBodyWidget extends StatelessWidget {
  const CollectionsBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
        key: CollectionsCubit.get(context).formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BillWidget(),
            verticalSpace(13),
            SearchUserWidget(),
            verticalSpace(16),
            Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: "اختر  الحساب",
                    style: TextStyles.font12GreyColor66Weight400),
                TextSpan(text: "*", style: TextStyles.font12RedColorWeight400),
              ]),
            ),
            verticalSpace(8),
            CollectionsBankAccountWidget(),
            verticalSpace(16),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: "طريقه الدفع",
                  style: TextStyles.font12GreyColor66Weight400),
              TextSpan(text: "*", style: TextStyles.font12RedColorWeight400),
            ])),
            verticalSpace(8),
            CollectionsPayAccountWidget(),
            verticalSpace(16),
            MoneyTextFieldWidget(),
            verticalSpace(16),
            UploadImageWidget(),
            verticalSpace(16),
            NotesTextFieldWidget(),
            verticalSpace(40),
            CollectionsButtonsWidget(),
            verticalSpace(50),
          ],
        ),
      ),
    ));
  }
}
