import '../entities/task_entity.dart';

/// Domain repository interface for tasks
/// This defines the contract that data layer must implement
abstract class TaskRepository {
  Future<TaskListResult> getTasks({
    required int limit,
    required int skip,
  });

  Future<TaskEntity> addTask({
    required String todo,
    required bool completed,
    required int userId,
  });

  Future<TaskEntity> updateTask({
    required int id,
    String? todo,
    bool? completed,
    int? userId,
  });

  Future<void> deleteTask(int id);
}

/// Result model for paginated task list
class TaskListResult {
  final List<TaskEntity> tasks;
  final int total;
  final int skip;
  final int limit;

  const TaskListResult({
    required this.tasks,
    required this.total,
    required this.skip,
    required this.limit,
  });

  bool get hasMore => skip + limit < total;
}
