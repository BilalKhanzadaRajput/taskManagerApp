import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/user_model.dart';
import '../models/auth_request_model.dart';
import '../models/task_model.dart';
import '../models/task_list_response_model.dart';
import '../models/add_task_request_model.dart';
import '../models/update_task_request_model.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // Auth Endpoints
  @POST('/auth/login')
  Future<UserModel> login(@Body() AuthRequestModel request);

  // Task Endpoints
  @GET('/todos')
  Future<TaskListResponseModel> getTasks({
    @Query('limit') int limit = 10,
    @Query('skip') int skip = 0,
  });

  @GET('/todos/{id}')
  Future<TaskModel> getTaskById(@Path('id') int id);

  @POST('/todos/add')
  Future<TaskModel> addTask(@Body() AddTaskRequestModel request);

  @PUT('/todos/{id}')
  Future<TaskModel> updateTask(
    @Path('id') int id,
    @Body() UpdateTaskRequestModel request,
  );

  @DELETE('/todos/{id}')
  Future<TaskModel> deleteTask(@Path('id') int id);
}
