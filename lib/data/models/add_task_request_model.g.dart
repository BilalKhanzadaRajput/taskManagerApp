// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTaskRequestModel _$AddTaskRequestModelFromJson(Map<String, dynamic> json) =>
    AddTaskRequestModel(
      todo: json['todo'] as String,
      completed: json['completed'] as bool,
      userId: (json['userId'] as num).toInt(),
    );

Map<String, dynamic> _$AddTaskRequestModelToJson(
  AddTaskRequestModel instance,
) => <String, dynamic>{
  'todo': instance.todo,
  'completed': instance.completed,
  'userId': instance.userId,
};
