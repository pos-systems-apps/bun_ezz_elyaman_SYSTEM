import 'package:equatable/equatable.dart';

class SuccessResponseModel extends Equatable {
  final String? message;

  const SuccessResponseModel({
    required this.message,
  });

  factory SuccessResponseModel.fromJson(Map<String, dynamic> json) =>
      SuccessResponseModel(
        message: json["message"],
      );

  @override
  List<Object?> get props => [message];
}
