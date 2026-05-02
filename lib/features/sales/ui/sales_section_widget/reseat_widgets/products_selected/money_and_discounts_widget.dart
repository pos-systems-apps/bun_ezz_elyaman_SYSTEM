import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/config/routes/routes.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/app_text_field.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/core/widgets/error_alert_dialog.dart';
import 'package:pos_system/features/sales/data/entities/percent_types_class.dart';
import 'package:pos_system/features/sales/data/entities/selected_product_class.dart';
import 'package:pos_system/features/sales/logic/sales_cubit.dart';
import 'package:pos_system/features/sales/logic/sales_state.dart';
import 'package:pos_system/features/sales/ui/sales_section_widget/reseat_widgets/sales_money_text_field_widget.dart';
import 'package:pos_system/features/splash/data/models/pay_class.dart';

class MoneyAndDiscountsWidget extends StatelessWidget {
  const MoneyAndDiscountsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: AppColors.blueColorEEE),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text("ادخل نسبه الخصم", style: TextStyles.font14GreyColor33Weight400),
          verticalSpace(8),
          // Row(
          //   children: [
          //     Expanded(
          //       flex: 1,
          //       child: DropdownMenu<PercentTypesClass>(
          //           hintText: "نوع الخصم",
          //           textStyle: TextStyles.font14GreyColorA5Weight400,
          //           menuStyle: MenuStyle(
          //             backgroundColor:
          //                 WidgetStateProperty.all(AppColors.whiteColor),
          //           ),
          //           onSelected: (PercentTypesClass? value) {
          //             SalesCubit.get(context).selectedPercentType = value;
          //           },
          //           dropdownMenuEntries: AppConstant.percentTypes
          //               .map((item) => DropdownMenuEntry(
          //                     value: item,
          //                     label: item.nameAr,
          //                   ))
          //               .toList()),
          //     ),
          //     horizontalSpace(7),
          //     Expanded(
          //       flex: 1,
          //       child: AppTextFormField(
          //           hintText: "",
          //           controller: SalesCubit.get(context).percentController,
          //           hintStyle: TextStyles.font14GreyColorA5Weight400,
          //           contentPadding:
          //               EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
          //           focusedBorder: OutlineInputBorder(
          //             borderSide: BorderSide(
          //               color: AppColors.blueColorEEE,
          //             ),
          //             borderRadius: BorderRadius.circular(4.r),
          //           ),
          //           enabledBorder: OutlineInputBorder(
          //             borderSide: BorderSide(
          //               color: AppColors.blueColorEEE,
          //             ),
          //             borderRadius: BorderRadius.circular(4.r),
          //           ),
          //           validator: (String? value) {},
          //           keyboardType: TextInputType.number),
          //     ),
          //     horizontalSpace(7),
          //     Expanded(
          //       flex: 1,
          //       child: ButtonWidget(
          //           isLoading: false,
          //           buttonText: "إضافة",
          //           backGroundColor: AppColors.whiteColor,
          //           borderColor: AppColors.mainColor,
          //           borderRadius: 4,
          //           textStyle: TextStyles.font14MainColorWeight400,
          //           onPressed: () {
          //             SalesCubit.get(context).changeState();
          //           }),
          //     ),
          //   ],
          // ),
          verticalSpace(16),
          BlocBuilder<SalesCubit, SalesState>(
            buildWhen: (previous, current) {
              return current is OnChangeSelectedProductState;
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ملخص الطلب",
                      style: TextStyles.font14GreyColor33Weight400),
                  verticalSpace(16),
                  _moneyWidget("اجمالي الفاتوره",
                      " 'جنيه'  ${(ReseatSelectedProducts(selectedProducts: SalesCubit.get(context).selectedProducts).getReseatData(discountTypeId: SalesCubit.get(context).selectedPercentType?.id, discount: SalesCubit.get(context).percentController.text)['totalReseat'])!.toStringAsFixed(3)}"),
                  verticalSpace(16),

                  _moneyWidget("خصم المنتج",
                      " 'جنيه'  ${(ReseatSelectedProducts(selectedProducts: SalesCubit.get(context).selectedProducts).getReseatData(discountTypeId: SalesCubit.get(context).selectedPercentType?.id, discount: SalesCubit.get(context).percentController.text)['totalDiscount'])!.toStringAsFixed(3)}"),
                  // verticalSpace(16),
                  // _moneyWidget("خصم اضافي",
                  //     "${AppConstant.currency} ${(ReseatSelectedProducts(selectedProducts: SalesCubit.get(context).selectedProducts).getReseatData(discountTypeId: SalesCubit.get(context).selectedPercentType?.id, discount: SalesCubit.get(context).percentController.text)['extraDiscount'])!.toStringAsFixed(3)}"),

                  ///stop value tax
                  verticalSpace(16),
                  _moneyWidget(
                      "الضريبة",
                      " 'جنيه'  "
                          "${(ReseatSelectedProducts(selectedProducts: SalesCubit.get(context).selectedProducts).getReseatData(discountTypeId: SalesCubit.get(context).selectedPercentType?.id, discount: SalesCubit.get(context).percentController.text)['valueTax'])!.toStringAsFixed(3)}"),
                  verticalSpace(16),
                  Divider(color: AppColors.blueColorEEE),
                  verticalSpace(16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("الإجمالى",
                              maxLines: 1,
                              style: TextStyles.font16GreyColor33Weight500),
                          verticalSpace(4),
                          Text.rich(TextSpan(children: [
                            TextSpan(
                              text: "الاسعار شاملة للضريبة ",
                              style: TextStyles.font14GreyColorA5Weight400,
                            ),
                            TextSpan(
                              text: "*",
                              style: TextStyles.font14RedColorWeight400,
                            ),
                          ])),
                        ],
                      )),
                      Text(
                          " 'جنيه'  ${(ReseatSelectedProducts(selectedProducts: SalesCubit.get(context).selectedProducts).getReseatData(discountTypeId: SalesCubit.get(context).selectedPercentType?.id, discount: SalesCubit.get(context).percentController.text)['total'])!.toStringAsFixed(3)}",
                          style: TextStyles.font16GreyColor33Weight500),
                    ],
                  ),
                  verticalSpace(16),
                ],
              );
            },
          ),
          Text(
            "طريقه الدفع",
            style: TextStyles.font18GreyColor33Weight500,
          ),
          verticalSpace(16),

          ///
          BlocBuilder<SalesCubit, SalesState>(
            buildWhen: (previous, current) {
              return current is OnChangePaySelectState;
            },
            builder: (context, state) {
              List<PayClass> selectedItems =
                  SalesCubit.get(context).selectedOrderType.id == 7
                      ? SalesCubit.get(context)
                          .pays
                          .where((item) => item.id == 2)
                          .toList()
                      : SalesCubit.get(context).pays;
              return Column(
                children: selectedItems
                    .map((item) => GestureDetector(
                          onTap: () {
                            SalesCubit.get(context).changeSelectedPay(item);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 10.h),
                            margin: EdgeInsets.symmetric(vertical: 6.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              border: Border.all(color: AppColors.blueColorEEE),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  item.nameAr,
                                  style: TextStyles.font15GreyColor66Weight400,
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.all(3.r),
                                  decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                          color: SalesCubit.get(context)
                                                      .selectedPay ==
                                                  item
                                              ? AppColors.mainColor
                                              : AppColors.greyColorBC,
                                          width: SalesCubit.get(context)
                                                      .selectedPay ==
                                                  item
                                              ? 4
                                              : 2)),
                                  child: Container(
                                    height: 20.r,
                                    width: 20.r,
                                    decoration: BoxDecoration(
                                      color:
                                          SalesCubit.get(context).selectedPay ==
                                                  item
                                              ? AppColors.mainColor
                                              : AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      color: AppColors.whiteColor,
                                      size: 18.r,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              );
            },
          ),
          verticalSpace(16),

          BlocBuilder<SalesCubit, SalesState>(
            buildWhen: (previous, current) {
              return current is OnChangePaySelectState;
            },
            builder: (context, state) {
              if (SalesCubit.get(context).selectedPay?.id == 2 &&
                  SalesCubit.get(context).selectedOrderType.id == 4) {
                return SalesMoneyTextFieldWidget();
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          verticalSpace(16),
          BlocConsumer<SalesCubit, SalesState>(
            buildWhen: (previous, current) {
              return current is OnCreateOrderLoadingState ||
                  current is OnCreateOrderSuccessState ||
                  current is OnCreateOrderErrorState ||
                  current is OnCreateOrderCatchErrorState;
            },
            listener: (_, state) {
              if (state is OnCreateOrderSuccessState) {
                context.pushNamed(Routes.electronicInvoiceScreen,
                    arguments: {"invoiceId": state.orderId});
              } else if (state is OnCreateOrderErrorState) {
                ErrorAlertDialog.getDialog(context, state.message);
              } else if (state is OnCreateOrderCatchErrorState) {
                ErrorAlertDialog.getDialog(context, state.message);
              }
            },
            builder: (context, state) {
              return ButtonWidget(
                  isLoading: state is OnCreateOrderLoadingState,
                  buttonHeight: 56.h,
                  buttonText: "إتمام الطلب",
                  backGroundColor: AppColors.mainColor,
                  borderRadius: 4.r,
                  textStyle: TextStyles.font16WhiteColorWeight500,
                  onPressed: () {
                    ///create order
                    if (SalesCubit.get(context).selectedProducts.isEmpty) {
                      ErrorAlertDialog.getDialog(context, "قم بتحديد منتجات ");
                    } else {
                      if (SalesCubit.get(context).selectedUser == null) {
                        ErrorAlertDialog.getDialog(context, "ادخل اسم عميل ");
                      } else {
                        if (SalesCubit.get(context).selectedPay == null) {
                          ErrorAlertDialog.getDialog(
                              context, "قم باختيار طريقة الدفع ");
                        } else {
                          if (((double.tryParse(SalesCubit.get(context)
                                          .moneyController
                                          .text) ??
                                      0) >
                                  ReseatSelectedProducts(
                                          selectedProducts:
                                              SalesCubit.get(context)
                                                  .selectedProducts)
                                      .getReseatData(
                                          discountTypeId:
                                              SalesCubit.get(context)
                                                  .selectedPercentType
                                                  ?.id,
                                          discount: SalesCubit.get(context)
                                              .percentController
                                              .text)['total']!) &&
                              SalesCubit.get(context).selectedPay?.id == 2) {
                            ErrorAlertDialog.getDialog(
                                context, "المبلغ الدفوع اكبر من القيمة الكلية");
                          } else {
                            SalesCubit.get(context).createOrder(context);
                          }
                        }
                      }
                    }
                  });
            },
          ),
          verticalSpace(16),
        ],
      ),
    );
  }

  Row _moneyWidget(String text, String money) {
    return Row(
      children: [
        Expanded(
            child: Text(text,
                maxLines: 2, style: TextStyles.font15GreyColor66Weight400)),
        Text(money, style: TextStyles.font15GreyColor66Weight400),
      ],
    );
  }
}
