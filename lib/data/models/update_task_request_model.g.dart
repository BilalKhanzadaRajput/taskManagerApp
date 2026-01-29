// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_task_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateTaskRequestModel _$UpdateTaskRequestModelFromJson(
  Map<String, dynamic> json,
) => UpdateTaskRequestModel(
  todo: json['todo'] as String?,
  completed: json['completed'] as bool?,
  userId: (json['userId'] as num?)?.toInt(),
);

Map<String, dynamic> _$UpdateTaskRequestModelToJson(
  UpdateTaskRequestModel instance,
) => <String, dynamic>{
  'todo': ?instance.todo,
  'completed': ?instance.completed,
  'userId': ?instance.userId,
};
