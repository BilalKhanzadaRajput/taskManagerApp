// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskListResponseModel _$TaskListResponseModelFromJson(
  Map<String, dynamic> json,
) => TaskListResponseModel(
  todos: (json['todos'] as List<dynamic>)
      .map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
  skip: (json['skip'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
);

Map<String, dynamic> _$TaskListResponseModelToJson(
  TaskListResponseModel instance,
) => <String, dynamic>{
  'todos': instance.todos,
  'total': instance.total,
  'skip': instance.skip,
  'limit': instance.limit,
};
