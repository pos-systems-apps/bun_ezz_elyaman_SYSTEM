import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/features/recommendations_from_manager/data/repo/recommendations_from_manager_repo.dart';
import 'package:pos_system/features/recommendations_from_manager/logic/recommendations_from_manager_state.dart';

class RecommendationsFromManagerCubit extends Cubit<RecommendationsFromManagerState> {
  final RecommendationsFromManagerRepo _recommendationsFromManagerRepo;

  RecommendationsFromManagerCubit(this._recommendationsFromManagerRepo) : super(InitialState());




  static RecommendationsFromManagerCubit get(context) => BlocProvider.of(context);
}
