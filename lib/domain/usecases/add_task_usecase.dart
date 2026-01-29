import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';

/// Use case for adding a new task
/// Encapsulates the business logic for creating tasks
class AddTaskUseCase {
  final TaskRepository _repository;

  AddTaskUseCase(this._repository);

  Future<TaskEntity> call({
    required String todo,
    required bool completed,
    required int userId,
  }) async {
    return await _repository.addTask(
      todo: todo,
      completed: completed,
      userId: userId,
    );
  }
}
