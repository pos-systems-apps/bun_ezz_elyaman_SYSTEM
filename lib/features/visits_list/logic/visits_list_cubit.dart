import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/features/visits_list/data/repo/visits_list_repo.dart';
import 'package:pos_system/features/visits_list/logic/visits_list_state.dart';

class VisitsListCubit extends Cubit<VisitsListState> {
  final VisitsListRepo _visitsListRepo;

  VisitsListCubit(this._visitsListRepo) : super(InitialState());




  static VisitsListCubit get(context) => BlocProvider.of(context);
}
