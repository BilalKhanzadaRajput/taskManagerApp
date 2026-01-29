part of 'task_bloc.dart';

@freezed
abstract class TaskState with _$TaskState {
  const factory TaskState({
    @Default(false) bool isLoading,
    @Default([]) List<TaskEntity> tasks,
    @Default(0) int total,
    @Default(0) int skip,
    @Default(10) int limit,
    @Default(false) bool hasMore,
    @Default('') String searchQuery,
    String? errorMessage,
  }) = _TaskState;
}
