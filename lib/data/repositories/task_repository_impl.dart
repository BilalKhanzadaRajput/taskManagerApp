import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/repositories/task_repository.dart';
import '../../domain/exceptions/local_update_exception.dart';
import '../mappers/task_mapper.dart';
import '../models/add_task_request_model.dart';
import '../models/update_task_request_model.dart';
import '../models/task_model.dart';
import '../models/task_list_response_model.dart';
import '../datasources/remote/task_remote_datasource.dart';
import '../datasources/local/local_storage_datasource.dart';

/// Data layer implementation of TaskRepository
/// Implements the domain repository interface
@Injectable(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource _remoteDataSource;
  final LocalStorageDataSource _localDataSource;

  TaskRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<TaskListResult> getTasks({
    required int limit,
    required int skip,
  }) async {
    try {
      final response = await _remoteDataSource.getTasks(
        limit: limit,
        skip: skip,
      );

      // Cache tasks locally
      await _localDataSource.saveTasks(response.todos);

      return TaskListResult(
        tasks: TaskMapper.toEntityList(response.todos),
        total: response.total,
        skip: response.skip,
        limit: response.limit,
      );
    } catch (e) {
      // If network fails, try to return cached tasks
      final cachedTasks = await _localDataSource.getCachedTasks();
      if (cachedTasks != null && cachedTasks.isNotEmpty) {
        return TaskListResult(
          tasks: TaskMapper.toEntityList(cachedTasks),
          total: cachedTasks.length,
          skip: skip,
          limit: limit,
        );
      }
      rethrow;
    }
  }

  @override
  Future<TaskEntity> addTask({
    required String todo,
    required bool completed,
    required int userId,
  }) async {
    try {
      final request = AddTaskRequestModel(
        todo: todo,
        completed: completed,
        userId: userId,
      );
      final result = await _remoteDataSource.addTask(request);
      return TaskMapper.toEntity(result);
    } on DioException catch (e) {
      // Handle 404 or other errors - still create task locally
      if (e.response?.statusCode == 404 || e.response?.statusCode == null) {
        // Generate a local ID
        final localId = DateTime.now().millisecondsSinceEpoch % 1000000;
        return TaskEntity(
          id: localId,
          todo: todo,
          completed: completed,
          userId: userId,
        );
      }
      rethrow;
    }
  }

  @override
  Future<TaskEntity> updateTask({
    required int id,
    String? todo,
    bool? completed,
    int? userId,
  }) async {
    try {
      final request = UpdateTaskRequestModel(
        todo: todo,
        completed: completed,
        userId: userId,
      );
      final result = await _remoteDataSource.updateTask(id, request);
      return TaskMapper.toEntity(result);
    } on DioException catch (e) {
      // Handle 404 - task doesn't exist on server
      if (e.response?.statusCode == 404) {
        throw LocalUpdateException(
          id: id,
          todo: todo,
          completed: completed,
          userId: userId,
        );
      }
      rethrow;
    }
  }

  @override
  Future<void> deleteTask(int id) async {
    await _remoteDataSource.deleteTask(id);
  }
}
