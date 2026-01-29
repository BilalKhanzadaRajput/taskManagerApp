import 'package:json_annotation/json_annotation.dart';
import 'task_model.dart';

part 'task_list_response_model.g.dart';

@JsonSerializable()
class TaskListResponseModel {
  final List<TaskModel> todos;
  final int total;
  final int skip;
  final int limit;

  const TaskListResponseModel({
    required this.todos,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory TaskListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TaskListResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskListResponseModelToJson(this);
}
