import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_system/features/all_courses/data/models/all_courses_response_model.dart';
import 'package:pos_system/features/all_courses/data/models/complete_course_request.dart';
import 'package:pos_system/features/all_courses/data/repo/all_courses_repo.dart';
import 'package:pos_system/features/all_courses/logic/all_courses_state.dart';

class AllCoursesCubit extends Cubit<AllCoursesState> {
  final AllCoursesRepo _allCoursesRepo;

  AllCoursesCubit(this._allCoursesRepo) : super(InitialState());

  List<CourseDataModel> allCourses = [];

  getAllCourses() {
    emit(OnGetAllCoursesLoadingState());
    allCourses = [];
    _allCoursesRepo.getAllCourses().then((value) {
      value.fold((l) {
        emit(OnGetAllCoursesErrorState());
      }, (r) {
        allCourses = r.courses;
        emit(OnGetAllCoursesSuccessState());
      });
    }).catchError((error) {
      emit(OnGetAllCoursesErrorState());
    });
  }

  List<String> selectedImagePaths = [];
  int? courseID;

  uploadImages(int courseId) async {
    courseID = courseId;
    final ImagePicker picker = ImagePicker();
    final List<XFile>? images = await picker.pickMultiImage();

    if (images != null && images.isNotEmpty) {
      selectedImagePaths = images.map((image) => image.path).toList();
      completeCourse(courseId);
      emit(OnChangeSelectedImagesState());
    }
  }

  completeCourse(int courseID) {
    emit(OnCompleteCourseLoadingState());
    _allCoursesRepo
        .completeCourse(CompleteCourseRequest(
            courseId: courseID, images: selectedImagePaths))
        .then((value) {
      value.fold((l) {
        emit(OnCompleteCourseErrorState());
      }, (r) {
        getAllCourses();
        emit(OnCompleteCourseSuccessState());
      });
    }).catchError((error) {
      emit(OnCompleteCourseCatchErrorState());
    });
  }

  static AllCoursesCubit get(context) => BlocProvider.of(context);
}
