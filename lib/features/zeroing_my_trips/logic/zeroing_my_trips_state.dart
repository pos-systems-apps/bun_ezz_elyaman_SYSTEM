abstract class ZeroingMyTripsState {}

class InitialState extends ZeroingMyTripsState {}

class OnZeroingMyTripsLoadingState extends ZeroingMyTripsState {}

class OnZeroingMyTripsSuccessState extends ZeroingMyTripsState {}

class OnZeroingMyTripsErrorState extends ZeroingMyTripsState {
  final String error;

  OnZeroingMyTripsErrorState({required this.error});
}

class OnZeroingMyTripsCatchErrorState extends ZeroingMyTripsState {
  final String error;

  OnZeroingMyTripsCatchErrorState({required this.error});
}
