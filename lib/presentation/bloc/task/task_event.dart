part of 'task_bloc.dart';

@freezed
class TaskEvent with _$TaskEvent {
  const factory TaskEvent.onLoadTasks({
    @Default(10) int limit,
    @Default(0) int skip,
  }) = _OnLoadTasks;

  const factory TaskEvent.onAddTask({
    required String todo,
    required bool completed,
    required int userId,
  }) = _OnAddTask;

  const factory TaskEvent.onUpdateTask({
    required int id,
    String? todo,
    bool? completed,
    int? userId,
  }) = _OnUpdateTask;

  const factory TaskEvent.onDeleteTask({required int id}) = _OnDeleteTask;

  const factory TaskEvent.onToggleTask({
    required int id,
    required bool completed,
  }) = _OnToggleTask;

  const factory TaskEvent.onSearchTasks({required String query}) =
      _OnSearchTasks;
}
