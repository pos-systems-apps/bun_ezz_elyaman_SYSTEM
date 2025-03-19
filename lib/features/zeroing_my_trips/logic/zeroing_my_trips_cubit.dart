import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/features/zeroing_my_trips/data/models/zeroing_my_trips_request_model.dart';
import 'package:pos_system/features/zeroing_my_trips/data/repo/zeroing_my_trips_repo.dart';
import 'package:pos_system/features/zeroing_my_trips/logic/zeroing_my_trips_state.dart';

class ZeroingMyTripsCubit extends Cubit<ZeroingMyTripsState> {
  final ZeroingMyTripsRepo _zeroingMyTripsRepo;

  ZeroingMyTripsCubit(this._zeroingMyTripsRepo) : super(InitialState());

  zeroingMyTripsRepo(String email, String password) {
    emit(OnZeroingMyTripsLoadingState());
    _zeroingMyTripsRepo
        .zeroingMyTrips(
            ZeroingMyTripsRequestModel(email: email, password: password))
        .then((value) {
      value.fold((l) {
        emit(OnZeroingMyTripsErrorState(error: l.message));
      }, (r) async {
        emit(OnZeroingMyTripsSuccessState());
      });
    }).catchError((error) {
      emit(OnZeroingMyTripsCatchErrorState(error: "error".tr()));
    });
  }

  static ZeroingMyTripsCubit get(context) => BlocProvider.of(context);
}
