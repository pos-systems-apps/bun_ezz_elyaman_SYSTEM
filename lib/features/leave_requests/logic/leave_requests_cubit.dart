import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/features/leave_requests/logic/leave_requests_state.dart';
import 'package:pos_system/features/my_requests/data/models/all_requests_response.dart';
import 'package:pos_system/features/my_requests/data/repo/my_requests_repo.dart';

class LeaveRequestsCubit extends Cubit<LeaveRequestsState> {
  final MyRequestsRepo _myRequestsRepo;

  LeaveRequestsCubit(this._myRequestsRepo) : super(InitialState());

  List<RequestDataModel> leaveRequestData = [];

  getAllRequestsUrl() {
    leaveRequestData = [];
    emit(OnGetMyRequestsLoadingState());
    _myRequestsRepo
        .getAllRequestsUrl(
      AppConstant.requestsType['leave_orders']!,
    )
        .then((value) {
      value.fold((l) {
        emit(OnGetMyRequestsErrorState());
      }, (r) {
        leaveRequestData = r.data;
        emit(OnGetMyRequestsSuccessState());
      });
    }).catchError((error) {
      emit(OnGetMyRequestsCatchErrorState());
    });
  }

  static LeaveRequestsCubit get(context) => BlocProvider.of(context);
}
