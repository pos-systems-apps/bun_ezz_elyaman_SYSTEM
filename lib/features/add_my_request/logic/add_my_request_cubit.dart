import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/features/add_my_request/data/models/add_my_request_request.dart';
import 'package:pos_system/features/add_my_request/data/repo/add_my_request_repo.dart';
import 'package:pos_system/features/add_my_request/logic/add_my_request_state.dart';

class AddMyRequestCubit extends Cubit<AddMyRequestState> {
  final AddMyRequestRepo _addMyRequestRepo;

  AddMyRequestCubit(this._addMyRequestRepo) : super(InitialState());

  TextEditingController notesController = TextEditingController();
  GlobalKey<FormState> addRequestKey = GlobalKey();

  addMyRequest() {
    emit(OnAddMyRequestLoadingState());
    _addMyRequestRepo
        .addMyRequest(AddMyRequestRequest(
            type: AppConstant.requestsType['my_orders']!,
            note: notesController.text,
            date: null))
        .then((value) {
      value.fold((l) {
        emit(OnAddMyRequestErrorState());
      }, (r) async {
        emit(OnAddMyRequestSuccessState());
      });
    }).catchError((error) {
      emit(OnAddMyRequestCatchErrorState(error: "error".tr()));
    });
  }

  clearSelectedData() {
    notesController.clear();
  }

  static AddMyRequestCubit get(context) => BlocProvider.of(context);
}
