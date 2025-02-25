import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/features/create_visit/data/models/create_visit_request.dart';
import 'package:pos_system/features/create_visit/data/repo/create_visit_repo.dart';
import 'package:pos_system/features/create_visit/logic/create_visit_state.dart';
import 'package:pos_system/features/splash/data/models/users_response_model.dart';
import 'package:pos_system/features/splash/data/repo/splash_repo.dart';
import 'package:pos_system/features/statistics/data/models/statistics_response_model.dart';

class CreateVisitCubit extends Cubit<CreateVisitState> {
  final CreateVisitRepo _createVisitRepo;
  final SplashRepo _splashRepo;

  CreateVisitCubit(this._createVisitRepo, this._splashRepo)
      : super(InitialState());

  TextEditingController searchUserController = TextEditingController();

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

  createVisit() {
    emit(OnCreateVisitLoadingState());
    _createVisitRepo
        .createVisit(CreateVisitRequest(
            customerId: selectedUser!.id, note: notesController.text))
        .then((value) {
      value.fold((l) {
        emit(OnCreateVisitErrorState());
      }, (r) async {
        emit(OnCreateVisitSuccessState());
      });
    }).catchError((error) {
      emit(OnCreateVisitCatchErrorState(error: "error".tr()));
    });
  }

  clearSelectedData() {
    notesController.clear();
    selectedUser = null;
    searchUserController.clear();
    users = [];
  }

  static CreateVisitCubit get(context) => BlocProvider.of(context);
}
