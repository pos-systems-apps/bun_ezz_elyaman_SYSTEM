
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pos_system/features/my_requests/data/repo/my_requests_repo.dart';
import 'package:pos_system/features/my_requests/logic/my_requests_state.dart';


class MyRequestsCubit extends Cubit<MyRequestsState> {
  final MyRequestsRepo _myRequestsRepo;

  MyRequestsCubit(this._myRequestsRepo) : super(InitialState());



  static MyRequestsCubit get(context) => BlocProvider.of(context);
}
