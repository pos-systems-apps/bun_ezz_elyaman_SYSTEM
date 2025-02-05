import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/features/collections/ui/widgets/bill_text_field_widget.dart';
import 'package:pos_system/features/collections/ui/widgets/money_text_field_widget.dart';
import 'package:pos_system/features/collections/ui/widgets/notes_text_field_widget.dart';
import 'package:pos_system/features/collections/ui/widgets/search_user_widget.dart';

class CollectionsScreen extends StatelessWidget {
  final TextEditingController billNumberController = TextEditingController();
  final TextEditingController moneyController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController searchUserController = TextEditingController();

  CollectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(10),
            Center(
                child: Text(
              "التحصيلات النقديه",
              style: TextStyles.font20BlueColorA4Weight600,
            )),
            verticalSpace(16),
            Expanded(
                child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BillWidget(billNumberController: billNumberController),
                  verticalSpace(13),
                  SearchUserWidget(searchUserController: searchUserController),
                  verticalSpace(16),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "اختر  الحساب",
                        style: TextStyles.font12GreyColor66Weight400),
                    TextSpan(
                        text: "*", style: TextStyles.font12RedColorWeight400),
                  ])),
                  verticalSpace(8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      height: 56.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                              color: AppColors.greyColorDB, width: 1.2)),
                      child: Row(
                        children: [
                          Container(
                            height: double.infinity,
                            width: 175.w,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: .5.h),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.mainColor, width: 2))),
                            child: Text(
                              "بنك الراجحي",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: TextStyles.font14blueColor89rWeight400
                                  .copyWith(color: AppColors.mainColor),
                            ),
                          ),
                          Container(
                            width: 1.w,
                            height: double.infinity,
                            color: AppColors.blueColor89,
                          ),
                          Container(
                            height: double.infinity,
                            width: 175.w,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: .5.h),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.mainColor, width: 2))),
                            child: Text(
                              "بنك الراجحي",
                              style: TextStyles.font14blueColor89rWeight400
                                  .copyWith(color: AppColors.mainColor),
                            ),
                          ),
                          Container(
                            width: 1.w,
                            height: double.infinity,
                            color: AppColors.blueColor89,
                          ),
                          Container(
                            height: double.infinity,
                            width: 175.w,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: .5.h),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.mainColor, width: 2))),
                            child: Text(
                              "بنك الراجحي",
                              style: TextStyles.font14blueColor89rWeight400
                                  .copyWith(color: AppColors.mainColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpace(16),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "طريقه الدفع",
                        style: TextStyles.font12GreyColor66Weight400),
                    TextSpan(
                        text: "*", style: TextStyles.font12RedColorWeight400),
                  ])),
                  verticalSpace(8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      height: 56.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                              color: AppColors.greyColorDB, width: 1.2)),
                      child: Row(
                        children: [
                          Container(
                            height: double.infinity,
                            width: 175.w,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: .5.h),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.mainColor, width: 2))),
                            child: Text(
                              "بنك الراجحي",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: TextStyles.font14blueColor89rWeight400
                                  .copyWith(color: AppColors.mainColor),
                            ),
                          ),
                          Container(
                            width: 1.w,
                            height: double.infinity,
                            color: AppColors.blueColor89,
                          ),
                          Container(
                            height: double.infinity,
                            width: 175.w,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: .5.h),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.mainColor, width: 2))),
                            child: Text(
                              "بنك الراجحي",
                              style: TextStyles.font14blueColor89rWeight400
                                  .copyWith(color: AppColors.mainColor),
                            ),
                          ),
                          Container(
                            width: 1.w,
                            height: double.infinity,
                            color: AppColors.blueColor89,
                          ),
                          Container(
                            height: double.infinity,
                            width: 175.w,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: .5.h),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.mainColor, width: 2))),
                            child: Text(
                              "بنك الراجحي",
                              style: TextStyles.font14blueColor89rWeight400
                                  .copyWith(color: AppColors.mainColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpace(16),
                  MoneyTextFieldWidget(moneyController: moneyController),
                  verticalSpace(16),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: [12, 12],
                    color: AppColors.blueColorEEE,
                    strokeWidth: 1.4,
                    radius: Radius.circular(4.r),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(4.r)),
                      child: Container(
                        height: 132.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(ImageAsset.addImageICon),
                            verticalSpace(4),
                            Text("قم برفع الصوره",style: TextStyles.font16MainColorWeight500,),
                          ],
                        ),
                      ),
                    ),
                  ),
                  verticalSpace(16),
                  NotesTextFieldWidget(notesController: notesController),
                  verticalSpace(40),
                  Row(
                    children: [

                    ],
                  ),
                  verticalSpace(30),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
