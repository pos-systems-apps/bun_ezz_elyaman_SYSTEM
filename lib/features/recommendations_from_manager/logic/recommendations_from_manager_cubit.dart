import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/features/my_requests/data/models/all_requests_response.dart';
import 'package:pos_system/features/my_requests/data/repo/my_requests_repo.dart';
import 'package:pos_system/features/recommendations_from_manager/logic/recommendations_from_manager_state.dart';

class RecommendationsFromManagerCubit
    extends Cubit<RecommendationsFromManagerState> {
  final MyRequestsRepo _myRequestsRepo;

  RecommendationsFromManagerCubit(this._myRequestsRepo) : super(InitialState());

  List<RequestDataModel> managerOrders = [];

  getManagerRequests() {
    managerOrders = [];
    emit(OnGetManagerRequestsLoadingState());
    _myRequestsRepo
        .getAllRequestsUrl(
      AppConstant.requestsType['orders_from_manager']!,
    )
        .then((value) {
      value.fold((l) {
        emit(OnGetManagerRequestsErrorState());
      }, (r) {
        managerOrders = r.data;
        emit(OnGetManagerRequestsSuccessState());
      });
    }).catchError((error) {
      emit(OnGetManagerRequestsCatchErrorState());
    });
  }

  static RecommendationsFromManagerCubit get(context) =>
      BlocProvider.of(context);
}
