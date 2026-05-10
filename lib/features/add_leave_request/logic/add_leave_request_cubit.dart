import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/features/add_leave_request/logic/add_leave_request_state.dart';
import 'package:pos_system/features/add_my_request/data/models/add_my_request_request.dart';
import 'package:pos_system/features/add_my_request/data/repo/add_my_request_repo.dart';

class AddLeaveRequestCubit extends Cubit<AddLeaveRequestState> {
  final AddMyRequestRepo _addMyRequestRepo;

  AddLeaveRequestCubit(this._addMyRequestRepo) : super(InitialState());

  TextEditingController notesController = TextEditingController();
  GlobalKey<FormState> addLeaveRequestKey = GlobalKey();

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

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
  DateTime selectedDate1 = DateTime.now();

  Future<void> selectDate1(BuildContext context) async {
    if (Platform.isAndroid) {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate1,
        firstDate: DateTime(1900),
        lastDate: DateTime(2200),
      );
      if (pickedDate != null) {
        selectedDate1 = pickedDate;
      }
    } else if (Platform.isIOS) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return SizedBox(
            height: 250.h,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: selectedDate1,
              minimumDate: DateTime(2000),
              maximumDate: DateTime(2100),
              onDateTimeChanged: (DateTime newDate) {
                selectedDate1 = newDate;

                emit(OnChangeDateState());
              },
            ),
          );
        },
      );
    }
    emit(OnChangeDateState());
  }




  addLeaveRequest() {
    emit(OnAddLeaveRequestLoadingState());
    _addMyRequestRepo
        .addMyRequest(AddMyRequestRequest(
            type: 'annual',
            reason: notesController.text,
            startDate: _formatDate(selectedDate),
            endDate: _formatDate(selectedDate1),
    ))
        .then((value) {
      value.fold((l) {
        emit(OnAddLeaveRequestErrorState());
      }, (r) async {
        emit(OnAddLeaveRequestSuccessState());
      });
    }).catchError((error) {
      emit(OnAddLeaveRequestCatchErrorState(error: "error".tr()));
    });
  }

  clearSelectedData() {
    notesController.clear();
  }

  static AddLeaveRequestCubit get(context) => BlocProvider.of(context);
}
