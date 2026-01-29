import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';

/// Use case for updating an existing task
/// Encapsulates the business logic for updating tasks
class UpdateTaskUseCase {
  final TaskRepository _repository;

  UpdateTaskUseCase(this._repository);

  Future<TaskEntity> call({
    required int id,
    String? todo,
    bool? completed,
    int? userId,
  }) async {
    return await _repository.updateTask(
      id: id,
      todo: todo,
      completed: completed,
      userId: userId,
    );
  }
}
