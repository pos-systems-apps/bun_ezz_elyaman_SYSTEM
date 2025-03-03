import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/core/services/geocoding_service.dart';
import 'package:pos_system/features/visits_carried_out/data/models/visit_list_carried_out_response.dart';
import 'package:pos_system/features/visits_carried_out/data/repo/visits_carried_out_repo.dart';
import 'package:pos_system/features/visits_carried_out/logic/visits_carried_out_state.dart';

class VisitsCarriedOutCubit extends Cubit<VisitsCarriedOutState> {
  final VisitsCarriedOutRepo _visitsCarriedOutRepo;

  VisitsCarriedOutCubit(this._visitsCarriedOutRepo) : super(InitialState());

  List<VisitListCarriedOut> visitListCarriedOuts = [];

  getVisitsCarriedOut() {
    emit(OnGetVisitsCarriedOutLoadingState());
    _visitsCarriedOutRepo.visitsCarriedOut().then((value) {
      value.fold((l) {
        emit(OnGetVisitsCarriedOutErrorState());
      }, (r) {
        visitListCarriedOuts = r.visitListCarriedOuts;
        emit(OnGetVisitsCarriedOutSuccessState());
      });
    }).catchError((error) {
      emit(OnGetVisitsCarriedOutCatchErrorState());
    });
  }




  static VisitsCarriedOutCubit get(context) => BlocProvider.of(context);
}
