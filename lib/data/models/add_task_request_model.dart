import 'package:json_annotation/json_annotation.dart';

part 'add_task_request_model.g.dart';

@JsonSerializable()
class AddTaskRequestModel {
  final String todo;
  final bool completed;
  final int userId;

  const AddTaskRequestModel({
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory AddTaskRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddTaskRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddTaskRequestModelToJson(this);
}
