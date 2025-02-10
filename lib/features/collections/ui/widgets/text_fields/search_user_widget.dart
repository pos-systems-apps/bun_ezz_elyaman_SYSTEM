import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/search_widget.dart';
import 'package:pos_system/features/collections/logic/collections_cubit.dart';
import 'package:pos_system/features/collections/logic/collections_state.dart';

class SearchUserWidget extends StatelessWidget {
  const SearchUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Timer? _delay;
    return BlocBuilder<CollectionsCubit, CollectionsState>(
      buildWhen: (previous, current) {
        return current is OnGetUsersLoadingState ||
            current is OnGetUsersSuccessState ||
            current is OnGetUsersErrorState ||
            current is OnGetUsersCatchErrorState ||
            current is OnSelectUserState;
      },
      builder: (context, state) {
        return Column(
          children: [
            SearchWidget(
              hintText: "ابحث عن عميل",
              hintStyle: TextStyles.font14GreyColor87Weight400,
              textStyle: TextStyles.font14BlackColorWeight400,
              controller: CollectionsCubit.get(context).searchUserController,
              backgroundColor: AppColors.whiteColor,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: SvgPicture.asset(ImageAsset.searchICon),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.greyColorDB, width: 1.3),
                  borderRadius: BorderRadius.circular(8.r)),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.greyColorDB, width: 1.3),
                  borderRadius: BorderRadius.circular(8.r)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.redColor, width: 1.3),
                  borderRadius: BorderRadius.circular(8.r)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.redColor, width: 1.3),
                  borderRadius: BorderRadius.circular(8.r)),
              keyboardType: TextInputType.text,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "field".tr();
                }
                return null;
              },
              onchange: (String? value) {
                if (_delay?.isActive ?? false) {
                  _delay!.cancel();
                }
                _delay = Timer(Duration(seconds: 1), () {
                  CollectionsCubit.get(context).getUsers();
                });
              },
            ),
            if (CollectionsCubit.get(context).users.isNotEmpty)
              Container(
                height: 250.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 5),
                        color: Colors.black12.withValues(alpha: .2),
                        blurRadius: 5)
                  ],
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: CollectionsCubit.get(context).users.length,
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: AppColors.greyColor66.withValues(alpha: .2),
                    );
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        context.locale.languageCode == "ar"
                            ? CollectionsCubit.get(context).users[index].nameAr
                            : CollectionsCubit.get(context).users[index].nameEn,
                        maxLines: 2,
                        style: TextStyles.font16BlackWeight500,
                      ),
                      onTap: () {
                        CollectionsCubit.get(context).onSelectUser(
                            CollectionsCubit.get(context).users[index]);
                      },
                    );
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
