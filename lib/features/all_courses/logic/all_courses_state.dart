abstract class AllCoursesState {}

class InitialState extends AllCoursesState {}
class OnGetAllCoursesLoadingState extends AllCoursesState {}
class OnGetAllCoursesSuccessState extends AllCoursesState {}
class OnGetAllCoursesErrorState extends AllCoursesState {}
class OnGetAllCoursesCatchErrorState extends AllCoursesState {}

class OnChangeSelectedImagesState extends AllCoursesState {}

class OnCompleteCourseLoadingState extends AllCoursesState {}
class OnCompleteCourseSuccessState extends AllCoursesState {}
class OnCompleteCourseErrorState extends AllCoursesState {}
class OnCompleteCourseCatchErrorState extends AllCoursesState {}