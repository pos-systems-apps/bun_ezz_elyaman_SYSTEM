abstract class StatisticsState {}

class InitialState extends StatisticsState {}

class OnGetStaticsLoadingState extends StatisticsState {}

class OnGetStaticsSuccessState extends StatisticsState {}

class OnGetStaticsErrorState extends StatisticsState {
  String error;

  OnGetStaticsErrorState({required this.error});
}

class OnGetStaticsCatchErrorState extends StatisticsState {
  String error;

  OnGetStaticsCatchErrorState({required this.error});
}
