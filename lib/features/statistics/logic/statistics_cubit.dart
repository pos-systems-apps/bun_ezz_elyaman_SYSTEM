import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/features/statistics/data/models/statistics_response_model.dart';
import '../data/repo/statistics_repo.dart';
import 'statistics_state.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  final StatisticsRepo _statisticsRepo;

  StatisticsCubit(this._statisticsRepo) : super(InitialState());

  StatisticsResponseModel? _statisticsResponseModel;

  StatisticsResponseModel? get statisticsResponseModel =>
      _statisticsResponseModel;

  getStatistics() {
    emit(OnGetStaticsLoadingState());
    _statisticsRepo.getStatistics().then((value) {
      value.fold((l) {
        emit(OnGetStaticsErrorState(error: l.message));
      }, (r) async {
        _statisticsResponseModel = r;
        emit(OnGetStaticsSuccessState());
      });
    }).catchError((error) {
      emit(OnGetStaticsCatchErrorState(error: "error".tr()));
    });
  }

  static StatisticsCubit get(context) => BlocProvider.of(context);
}
