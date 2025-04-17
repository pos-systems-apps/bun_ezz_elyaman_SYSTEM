import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_system/features/all_courses/data/models/complete_course_request.dart';
import 'package:pos_system/features/all_courses/data/repo/all_courses_repo.dart';
import 'package:pos_system/features/daily_fingerprint_management/logic/daily_fingerprint_management_state.dart';

class DailyFingerprintManagementCubit extends Cubit<DailyFingerprintManagementState> {
  final AllCoursesRepo _allCoursesRepo;

  DailyFingerprintManagementCubit(this._allCoursesRepo) : super(InitialState());
  //
  // List<CourseDataModel> allCourses = [];
  //
  // getAllCourses() {
  //   emit(OnGetAllCoursesLoadingState());
  //   allCourses = [];
  //   _allCoursesRepo.getAllCourses().then((value) {
  //     value.fold((l) {
  //       emit(OnGetAllCoursesErrorState());
  //     }, (r) {
  //       allCourses = r.courses;
  //       emit(OnGetAllCoursesSuccessState());
  //     });
  //   }).catchError((error) {
  //     emit(OnGetAllCoursesErrorState());
  //   });
  // }
  //
  // List<String> selectedImagePaths = [];
  // int? courseID;
  //
  // uploadImages(int courseId) async {
  //   courseID = courseId;
  //   final ImagePicker picker = ImagePicker();
  //   final List<XFile>? images = await picker.pickMultiImage();
  //
  //   if (images != null && images.isNotEmpty) {
  //     selectedImagePaths = images.map((image) => image.path).toList();
  //     completeCourse(courseId);
  //     emit(OnChangeSelectedImagesState());
  //   }
  // }
  //
  // completeCourse(int courseID) {
  //   emit(OnCompleteCourseLoadingState());
  //   _allCoursesRepo
  //       .completeCourse(CompleteCourseRequest(
  //           courseId: courseID, images: selectedImagePaths))
  //       .then((value) {
  //     value.fold((l) {
  //       emit(OnCompleteCourseErrorState());
  //     }, (r) {
  //       getAllCourses();
  //       emit(OnCompleteCourseSuccessState());
  //     });
  //   }).catchError((error) {
  //     emit(OnCompleteCourseCatchErrorState());
  //   });
  // }

  static DailyFingerprintManagementCubit get(context) => BlocProvider.of(context);
}
