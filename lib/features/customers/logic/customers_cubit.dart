import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/features/customers/logic/customers_state.dart';
import 'package:pos_system/features/splash/data/models/users_response_model.dart';
import 'package:pos_system/features/splash/data/repo/splash_repo.dart';

class CustomersCubit extends Cubit<CustomersState> {
  final SplashRepo _splashRepo;

  CustomersCubit(this._splashRepo) : super(InitialState());

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

  static CustomersCubit get(context) => BlocProvider.of(context);
}
