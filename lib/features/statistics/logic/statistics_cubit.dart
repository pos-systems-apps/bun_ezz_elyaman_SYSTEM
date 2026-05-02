 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pos_system/core/services/location_service.dart';
import 'package:pos_system/features/login/data/models/update_user_location_request.dart';
import 'package:pos_system/features/login/data/repo/login_repo.dart';
import 'package:pos_system/features/statistics/data/models/statistics_response_model.dart';
import '../data/repo/statistics_repo.dart';
import 'statistics_state.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  final StatisticsRepo _statisticsRepo;
  final LoginRepo _loginRepo;

  StatisticsCubit(this._statisticsRepo, this._loginRepo)
      : super(InitialState());

  StatisticsResponseModel? _statisticsResponseModel;

  StatisticsResponseModel? get statisticsResponseModel =>
      _statisticsResponseModel;

  getStatistics() async {
    Position? position = await YourLocation.getCurrentLocation();
    await _loginRepo.updateUseLocation(UpdateUserLocationRequest(
        latitude: position?.latitude ?? 0,
        longitude: position?.longitude ?? 0));
    emit(OnGetStaticsLoadingState());
    _statisticsRepo.getStatistics().then((value) {
      value.fold((l) {
        emit(OnGetStaticsErrorState(error: l.message));
      }, (r) async {
        _statisticsResponseModel = r;
        emit(OnGetStaticsSuccessState());
      });
    }).catchError((error) {
      emit(OnGetStaticsCatchErrorState(error: "error"));
    });
  }

  static StatisticsCubit get(context) => BlocProvider.of(context);
}
