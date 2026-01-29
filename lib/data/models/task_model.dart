import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  final int id;
  final String todo;
  final bool completed;
  final int userId;

  const TaskModel({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);

  TaskModel copyWith({int? id, String? todo, bool? completed, int? userId}) {
    return TaskModel(
      id: id ?? this.id,
      todo: todo ?? this.todo,
      completed: completed ?? this.completed,
      userId: userId ?? this.userId,
    );
  }
}
