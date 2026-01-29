import 'package:injectable/injectable.dart';
import '../../models/task_model.dart';
import '../../models/task_list_response_model.dart';
import '../../models/add_task_request_model.dart';
import '../../models/update_task_request_model.dart';
import '../../network/dio_client.dart';

/// Remote data source for task operations
@Injectable()
class TaskRemoteDataSource {
  final _apiClient = DioClient.getApiClient();

  Future<TaskListResponseModel> getTasks({
    required int limit,
    required int skip,
  }) async {
    return await _apiClient.getTasks(limit: limit, skip: skip);
  }

  Future<TaskModel> addTask(AddTaskRequestModel request) async {
    return await _apiClient.addTask(request);
  }

  Future<TaskModel> updateTask(int id, UpdateTaskRequestModel request) async {
    return await _apiClient.updateTask(id, request);
  }

  Future<void> deleteTask(int id) async {
    await _apiClient.deleteTask(id);
  }
}
