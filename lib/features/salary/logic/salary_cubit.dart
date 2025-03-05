import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:pos_system/features/salary/data/models/get_salary_response_model.dart';
import 'package:pos_system/features/salary/data/repo/salary_repo.dart';
import 'package:pos_system/features/salary/logic/salary_state.dart';

class SalaryCubit extends Cubit<SalaryState> {
  final SalaryRepo _salaryRepo;

  SalaryCubit(this._salaryRepo) : super(InitialState());

  List<Salary> salary = [];

  getSalary(BuildContext context) {
    salary = [];
    emit(OnGetSalaryLoadingState());
    _salaryRepo.getSalary(getFormattedDate(context)).then((value) {
      value.fold((l) {
        emit(OnGetSalaryErrorState());
      }, (r) {
        salary = r.salaries;
        emit(OnGetSalarySuccessState());
      });
    }).catchError((error) {
      emit(OnGetSalaryCatchErrorState());
    });
  }

  DateTime selectedFilterDate = DateTime.now();

  Future<void> selectFilterDate(BuildContext context) async {
    if (Platform.isAndroid) {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedFilterDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2200),
      );
      if (pickedDate != null) {
        selectedFilterDate = DateTime(pickedDate.year, pickedDate.month, 1);
        getSalary(context);
      }
    } else if (Platform.isIOS) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return SizedBox(
            height: 250.h,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: selectedFilterDate,
              minimumDate: DateTime(2000),
              maximumDate: DateTime(2100),
              onDateTimeChanged: (DateTime newDate) {
                selectedFilterDate = DateTime(newDate.year, newDate.month, 1);
                getSalary(context);
              },
            ),
          );
        },
      );
    }
  }

  String getFormattedDate(BuildContext context) {
    return intl.DateFormat('yyyy-MM', context.locale.languageCode).format(selectedFilterDate);
  }

  static SalaryCubit get(context) => BlocProvider.of(context);
}
