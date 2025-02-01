import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/features/login/data/models/login_response_model.dart';

import '../../../core/services/cache_helper.dart';
import '../../../core/utils/constant_keys.dart';
import '../data/models/login_request_model.dart';
import '../data/repo/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(InitialState());

  login(String code, String password) {
    emit(OnLoginLoadingState());
    _loginRepo
        .login(LoginRequestModel(code: code, password: password))
        .then((value) {
      value.fold((l) {
        emit(OnLoginErrorState(error: l.message));
      }, (r) async {
        await saveUserToken(r);
        emit(OnLoginSuccessState());
      });
    }).catchError((error) {
      emit(OnLoginCatchErrorState(error: "error".tr()));
    });
  }

  Future<void> saveUserToken(LoginResponseModel loginResponse) async {
    await CacheHelper.setSecuredString(ConstantKeys.saveMandoubeNameToShared,
        loginResponse.data.firstName + loginResponse.data.lastName);
    await CacheHelper.setSecuredString(
        ConstantKeys.saveVehicleCodeToShared, loginResponse.data.vehicleCode);
    await CacheHelper.setSecuredString(
        ConstantKeys.saveMandoubeCodeToShared, loginResponse.data.mandobCode);
    await CacheHelper.setSecuredString(
        ConstantKeys.saveEmailToShared, loginResponse.data.email);
    await CacheHelper.setSecuredString(
        ConstantKeys.savePhoneToShared, loginResponse.data.phone);

    await CacheHelper.setSecuredString(
        ConstantKeys.saveTokenToShared, loginResponse.token);
  }

  static LoginCubit get(context) => BlocProvider.of(context);
}
