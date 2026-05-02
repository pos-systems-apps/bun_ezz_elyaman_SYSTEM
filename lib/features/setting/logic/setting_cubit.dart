import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/features/login/data/repo/login_repo.dart';
import 'package:pos_system/features/setting/logic/setting_state.dart';

import '../../../core/services/cache_helper.dart';
import '../../../core/utils/constant_keys.dart';

class LogOutCubit extends Cubit<SettingState> {
  final LoginRepo _loginRepo;

  LogOutCubit(this._loginRepo) : super(InitialState());

  logOut() {
    emit(OnLogOutLoadingState());
    _loginRepo.logOut().then((value) {
      value.fold((l) {
        emit(OnLogOutErrorState());
      }, (r) async {
        await removeUserToken();

        emit(OnLogOutSuccessState());
      });
    }).catchError((error) {
      emit(OnLogOutCatchErrorState());
    });
  }

  Future<void> removeUserToken() async {
    await CacheHelper.removeSecureData(ConstantKeys.saveTokenToShared);
    await CacheHelper.removeSecureData(ConstantKeys.saveMandoubeNameToShared);
    await CacheHelper.removeSecureData(ConstantKeys.saveEmailToShared);
    await CacheHelper.removeSecureData(ConstantKeys.savePhoneToShared);
  }

  static LogOutCubit get(context) => BlocProvider.of(context);
}
