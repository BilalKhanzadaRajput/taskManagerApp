import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';

/// Use case for getting paginated tasks
/// Encapsulates the business logic for fetching tasks
class GetTasksUseCase {
  final TaskRepository _repository;

  GetTasksUseCase(this._repository);

  Future<TaskListResult> call({required int limit, required int skip}) async {
    return await _repository.getTasks(limit: limit, skip: skip);
  }
}
