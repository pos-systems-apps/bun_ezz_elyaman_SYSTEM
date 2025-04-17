class AllCoursesResponseModel {
  List<CourseDataModel> courses;

  AllCoursesResponseModel({required this.courses});

  factory AllCoursesResponseModel.fromJson(Map<String, dynamic> json) {
    return AllCoursesResponseModel(
        courses: List<CourseDataModel>.from(
      json['data'].map((item) => CourseDataModel.fromJson(item)).toList(),
    ));
  }
}

class CourseDataModel {
  int id;
  String name;
  String link;
  String? image;

  CourseDataModel({
    required this.id,
    required this.name,
    required this.link,
    required this.image,
  });

  factory CourseDataModel.fromJson(Map<String, dynamic> json) {
    return CourseDataModel(
      id: json['id'],
      name: json['name']??"",
      link: json['link']??"",
      image: json['img'],
    );
  }
}
