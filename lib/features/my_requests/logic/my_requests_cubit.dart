import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/features/my_requests/data/models/all_requests_response.dart';

import 'package:pos_system/features/my_requests/data/repo/my_requests_repo.dart';
import 'package:pos_system/features/my_requests/logic/my_requests_state.dart';

class MyRequestsCubit extends Cubit<MyRequestsState> {
  final MyRequestsRepo _myRequestsRepo;

  MyRequestsCubit(this._myRequestsRepo) : super(InitialState());
  List<RequestDataModel> requestData = [];

  getAllRequestsUrl() {
    requestData = [];
    emit(OnGetMyRequestsLoadingState());
    _myRequestsRepo
        .getAllRequestsUrl(
      AppConstant.requestsType['my_orders']!,
    )
        .then((value) {
      value.fold((l) {
        emit(OnGetMyRequestsErrorState());
      }, (r) {
        requestData = r.data;
        emit(OnGetMyRequestsSuccessState());
      });
    }).catchError((error) {
      emit(OnGetMyRequestsCatchErrorState());
    });
  }

  static MyRequestsCubit get(context) => BlocProvider.of(context);
}
