import 'package:json_annotation/json_annotation.dart';

part 'update_task_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class UpdateTaskRequestModel {
  final String? todo;
  final bool? completed;
  final int? userId;

  const UpdateTaskRequestModel({this.todo, this.completed, this.userId});

  factory UpdateTaskRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateTaskRequestModelToJson(this);
}
