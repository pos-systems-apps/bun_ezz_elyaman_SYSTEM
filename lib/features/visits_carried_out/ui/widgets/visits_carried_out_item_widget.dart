import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/features/visits_carried_out/data/models/visit_list_carried_out_response.dart';

class VisitsCarriedOutItemWidget extends StatefulWidget {
  final VisitListCarriedOut item;

  const VisitsCarriedOutItemWidget({required this.item, super.key});

  @override
  State<VisitsCarriedOutItemWidget> createState() =>
      _VisitsCarriedOutItemWidgetState();
}

class _VisitsCarriedOutItemWidgetState
    extends State<VisitsCarriedOutItemWidget> {
  String address = "";

  @override
  void initState() {
    super.initState();
    getAddressFromLocation();
  }

  getAddressFromLocation() async {
    address = await AppConstant.getLocationFromCoordinates(
        double.tryParse(widget.item.lat.toString()) ?? 0,
        double.tryParse(widget.item.lang.toString()) ?? 0);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: AppColors.blueColorEEE),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text("ملخص الزيارة ",
                style: TextStyles.font16MainColorWeight500),
          ),
          verticalSpace(4),
          Text.rich(
            textAlign: TextAlign.start,
            TextSpan(children: [
              TextSpan(
                  text: "رقم الزيارة",
                  style: TextStyles.font14GreyColor66Weight400.copyWith(
                      color: AppColors.greyColor66.withValues(alpha: .5))),
              TextSpan(
                  text: ": ${widget.item.id}",
                  style: TextStyles.font14GreyColor66Weight400),
            ]),
          ),
          verticalSpace(4),
          Text.rich(
            textAlign: TextAlign.start,
            TextSpan(children: [
              TextSpan(
                  text: "الملاحظة",
                  style: TextStyles.font14GreyColor66Weight400.copyWith(
                      color: AppColors.greyColor66.withValues(alpha: .5))),
              TextSpan(
                  text: ": ${widget.item.note}",
                  style: TextStyles.font14GreyColor66Weight400),
            ]),
          ),
          verticalSpace(4),
          Text.rich(
            textAlign: TextAlign.start,
            TextSpan(children: [
              TextSpan(
                  text: "العنوان",
                  style: TextStyles.font14GreyColor66Weight400.copyWith(
                      color: AppColors.greyColor66.withValues(alpha: .5))),
              TextSpan(
                  text: ": $address",
                  style: TextStyles.font14GreyColor66Weight400),
            ]),
          ),
          verticalSpace(4),
          Text.rich(
            textAlign: TextAlign.start,
            TextSpan(children: [
              TextSpan(
                  text: "اسم العميل",
                  style: TextStyles.font14GreyColor66Weight400.copyWith(
                      color: AppColors.greyColor66.withValues(alpha: .5))),
              TextSpan(
                  text: ": ${widget.item.customer.name}",
                  style: TextStyles.font14GreyColor66Weight400),
            ]),
          ),
          verticalSpace(4),
          Text.rich(
            textAlign: TextAlign.start,
            TextSpan(children: [
              TextSpan(
                  text: "رقم الجوال",
                  style: TextStyles.font14GreyColor66Weight400.copyWith(
                      color: AppColors.greyColor66.withValues(alpha: .5))),
              TextSpan(
                  text: ": ${widget.item.customer.mobile}",
                  style: TextStyles.font14GreyColor66Weight400),
            ]),
          ),
          verticalSpace(4),
          Text.rich(
            textAlign: TextAlign.start,
            TextSpan(children: [
              TextSpan(
                  text: "الرقم الضريبي",
                  style: TextStyles.font14GreyColor66Weight400.copyWith(
                      color: AppColors.greyColor66.withValues(alpha: .5))),
              TextSpan(
                  text: ": ${widget.item.customer.taxNumber}",
                  style: TextStyles.font14GreyColor66Weight400),
            ]),
          ),
          verticalSpace(4),
          Text.rich(
            textAlign: TextAlign.start,
            TextSpan(children: [
              TextSpan(
                  text: " السجل التجاري",
                  style: TextStyles.font14GreyColor66Weight400.copyWith(
                      color: AppColors.greyColor66.withValues(alpha: .5))),
              TextSpan(
                  text: ": ${widget.item.customer.commercialHistory}",
                  style: TextStyles.font14GreyColor66Weight400),
            ]),
          ),
          verticalSpace(4),
        ],
      ),
    );
  }
}
