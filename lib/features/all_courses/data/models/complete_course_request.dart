class CompleteCourseRequest {
  int courseId;
  List<String> images;

  CompleteCourseRequest({
    required this.courseId,
    required this.images,
  });

  Map<String, dynamic> toJson() => {
    "course_id": courseId,
    "images": images,
  };
}
