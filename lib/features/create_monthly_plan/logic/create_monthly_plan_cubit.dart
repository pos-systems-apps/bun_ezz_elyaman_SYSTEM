import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/features/create_monthly_plan/data/models/create_monthly_plan_request.dart';
import 'package:pos_system/features/create_monthly_plan/data/repo/create_monthly_plan_repo.dart';
import 'package:pos_system/features/create_monthly_plan/logic/create_monthly_plan_state.dart';
import 'package:pos_system/features/splash/data/models/users_response_model.dart';
import 'package:pos_system/features/splash/data/repo/splash_repo.dart';

class CreateMonthlyPlanCubit extends Cubit<CreateMonthlyPlanState> {
  final CreateMonthlyPlanRepo _createMonthlyPlanRepo;
  final SplashRepo _splashRepo;

  CreateMonthlyPlanCubit(this._createMonthlyPlanRepo, this._splashRepo)
      : super(InitialState());

  TextEditingController searchUserController = TextEditingController();
  GlobalKey<FormState> monthlyKey = GlobalKey();

  ///customers
  List<UserResponseData> users = [];

  getUsers() {
    emit(OnGetUsersLoadingState());
    _splashRepo.getUsers(searchUserController.text).then((value) {
      value.fold((l) {
        emit(OnGetUsersErrorState());
      }, (r) {
        users = r.userResponseData;
        emit(OnGetUsersSuccessState());
      });
    }).catchError((error) {
      emit(OnGetUsersCatchErrorState());
    });
  }

  UserResponseData? selectedUser;

  onSelectUser(UserResponseData vale) {
    searchUserController.text = vale.nameAr;
    selectedUser = vale;
    users.clear();
    emit(OnSelectUserState());
  }

  clearSelectedUSer() {
    selectedUser = null;
    users.clear();
    emit(OnSelectUserState());
  }

  TextEditingController notesController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    if (Platform.isAndroid) {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2200),
      );
      if (pickedDate != null) {
        selectedDate = pickedDate;
      }
    } else if (Platform.isIOS) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return SizedBox(
            height: 250.h,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: selectedDate,
              minimumDate: DateTime(2000),
              maximumDate: DateTime(2100),
              onDateTimeChanged: (DateTime newDate) {
                selectedDate = newDate;

                emit(OnChangeDateState());
              },
            ),
          );
        },
      );
    }
    emit(OnChangeDateState());
  }

  ///
  createMonthlyPlan(double lat, double lang) {
    emit(OnCreateMonthlyLoadingState());
    _createMonthlyPlanRepo
        .createMonthlyPlan(CreateMonthlyPlanRequest(
            date: _formatDate(selectedDate),
            customerId: selectedUser!.id,
            note: notesController.text))
        .then((value) {
      value.fold((l) {
        emit(OnCreateMonthlyErrorState());
      }, (r) async {
        emit(OnCreateMonthlySuccessState());
      });
    }).catchError((error) {
      emit(OnCreateMonthlyCatchErrorState(error: "error".tr()));
    });
  }

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  clearSelectedData() {
    notesController.clear();
    selectedDate = DateTime.now();
    selectedUser = null;
    searchUserController.clear();
    users = [];
  }

  static CreateMonthlyPlanCubit get(context) => BlocProvider.of(context);
}
