import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/features/required_visits_list/data/models/required_visit_list_response.dart';
import 'package:pos_system/features/required_visits_list/data/repo/required_visits_list_repo.dart';
import 'package:pos_system/features/required_visits_list/logic/required_visits_list_state.dart';

class RequiredVisitsListCubit extends Cubit<RequiredVisitsListState> {
  final RequiredVisitsListRepo _requiredVisitsListRepo;

  RequiredVisitsListCubit(this._requiredVisitsListRepo) : super(InitialState());

  List<RequiredVisitor> requiredVisitors = [];

  getRequiredVisitorList() {
    emit(OnGetRequiredVisitorListLoadingState());
    _requiredVisitsListRepo.requiredVisitsList().then((value) {
      value.fold((l) {
        emit(OnGetRequiredVisitorListErrorState());
      }, (r) {
        requiredVisitors = r.requiredVisitors;
        emit(OnGetRequiredVisitorListSuccessState());
      });
    }).catchError((error) {
      emit(OnGetRequiredVisitorListCatchErrorState());
    });
  }

  static RequiredVisitsListCubit get(context) => BlocProvider.of(context);
}
