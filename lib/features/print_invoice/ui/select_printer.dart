import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:x_printer/x_printer.dart';

class SelectPrinter extends StatefulWidget {
  const SelectPrinter({super.key, required this.plugin});

  final XPrinter plugin;

  @override
  State<SelectPrinter> createState() => _SelectPrinterState();
}

class _SelectPrinterState extends State<SelectPrinter> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        widget.plugin.startScan();

        widget.plugin.statusStream.listen((value) {
          print(">>> status: ${value.status.name}");
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();

    widget.plugin.stopScan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            verticalSpace(10),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    padding: EdgeInsets.all(8.r),
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 10,
                              spreadRadius: 0,
                              color:
                                  AppColors.blackColor.withValues(alpha: .1)),
                        ]),
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.blueColor72,
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  "حدد جهاز ",
                  style: TextStyles.font20BlueColorA4Weight600,
                ),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
            verticalSpace(28),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ButtonWidget(
                        isLoading: false,
                        buttonHeight: 48.h,
                        borderRadius: 10.r,
                        buttonText: "Scan",
                        backGroundColor: AppColors.mainColor,
                        textStyle: TextStyles.font14WhiteColorWeight500,
                        onPressed: () {
                          widget.plugin.startScan();
                        }),
                  ),
                  horizontalSpace(30),
                  Expanded(
                    child: ButtonWidget(
                        isLoading: false,
                        buttonHeight: 48.h,
                        borderRadius: 10.r,
                        buttonText: "Stop",
                        backGroundColor: AppColors.redColor000,
                        textStyle: TextStyles.font14WhiteColorWeight500,
                        onPressed: () {
                          widget.plugin.stopScan();
                        }),
                  ),
                ],
              ),
            ),
            verticalSpace(28),
            StreamBuilder(
              stream: widget.plugin.isScanningStream,
              builder: (context, snapshot) {
                if (snapshot.data == true) {
                  return LinearProgressIndicator(
                    color: AppColors.mainColor,
                  );
                }
                return SizedBox.shrink();
              },
            ),
            Expanded(
              child: StreamBuilder<List<Peripheral>>(
                stream: widget.plugin.peripheralsStream,
                builder: (context, snapshot) {
                  if (snapshot.data?.isNotEmpty != true) {
                    return Center(
                      child: Column(
                        children: [
                          Image.asset(ImageAsset.notFoundImage),
                          verticalSpace(24),
                          Text(
                            "لا توجد اجهزة قريبة  ",
                            style: TextStyles.font20MainColorWeightBold,
                          ),
                        ],
                      ),
                    );
                  }

                  final peripherals = snapshot.data!;
                  return ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    shrinkWrap: true,
                    itemCount: peripherals.length,
                    separatorBuilder: (context, index) {
                      return verticalSpace(16);
                    },
                    itemBuilder: (context, index) {
                      final peripheral = peripherals[index];

                      return GestureDetector(
                        onTap: () {
                          if (peripheral.uuid == null ||
                              peripheral.state == PeripheralState.connected) {
                            return;
                          }
                          widget.plugin.connect(peripheral.uuid!);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 16.h),
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(4.r),
                              border:
                                  Border.all(color: AppColors.blueColorEEE)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                peripheral.name ?? '',
                                maxLines: 2,
                                style: TextStyles.font16BlackWeight500,
                              ),
                              verticalSpace(4),
                              Text(peripheral.uuid ?? '',
                                  maxLines: 1,
                                  style: TextStyles.font14GreyColor66Weight400),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
