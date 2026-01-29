import '../repositories/task_repository.dart';

/// Use case for deleting a task
/// Encapsulates the business logic for removing tasks
class DeleteTaskUseCase {
  final TaskRepository _repository;

  DeleteTaskUseCase(this._repository);

  Future<void> call(int id) async {
    return await _repository.deleteTask(id);
  }
}
