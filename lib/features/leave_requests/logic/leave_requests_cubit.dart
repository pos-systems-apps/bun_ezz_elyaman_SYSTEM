
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/features/leave_requests/data/repo/leave_requests_repo.dart';
import 'package:pos_system/features/leave_requests/logic/leave_requests_state.dart';



class LeaveRequestsCubit extends Cubit<LeaveRequestsState> {
  final LeaveRequestsRepo _leaveRequestsRepo;

  LeaveRequestsCubit(this._leaveRequestsRepo) : super(InitialState());



  static LeaveRequestsCubit get(context) => BlocProvider.of(context);
}
