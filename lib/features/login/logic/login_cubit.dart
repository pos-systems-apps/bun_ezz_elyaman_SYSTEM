
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/cache_helper.dart';
import '../../../core/utils/constant_keys.dart';
import '../data/models/login_request_model.dart';
import '../data/repo/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(InitialState());


  bool reminderBox = false;

  changeReminderBox(bool value) {
    reminderBox = value;
    emit(OnChangeReminderBoxState());
  }

  login(String login, String password) {
    emit(OnLoginLoadingState());
    _loginRepo
        .login(LoginRequestModel(login: login, password: password))
        .then((value) {
      value.fold((l) {
        emit(OnLoginErrorState());
      }, (r) async {
        await saveUserToken(r.token);
        emit(OnLoginSuccessState());
      });
    }).catchError((error) {
      emit(OnLoginCatchErrorState());
    });
  }

  Future<void> saveUserToken(String token) async {
    await CacheHelper.setSecuredString(ConstantKeys.saveTokenToShared, token);
  }

  static LoginCubit get(context) => BlocProvider.of(context);
}
