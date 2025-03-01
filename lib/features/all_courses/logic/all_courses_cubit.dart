import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/features/all_courses/data/repo/all_courses_repo.dart';
import 'package:pos_system/features/all_courses/logic/all_courses_state.dart';

class AllCoursesCubit extends Cubit<AllCoursesState> {
  final AllCoursesRepo _allCoursesRepo;

  AllCoursesCubit(this._allCoursesRepo) : super(InitialState());




  static AllCoursesCubit get(context) => BlocProvider.of(context);
}
