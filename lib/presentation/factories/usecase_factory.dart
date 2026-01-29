import '../../domain/usecases/get_tasks_usecase.dart';
import '../../domain/usecases/add_task_usecase.dart';
import '../../domain/usecases/update_task_usecase.dart';
import '../../domain/usecases/delete_task_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/check_auth_status_usecase.dart';
import '../../domain/repositories/task_repository.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../data/repositories/task_repository_impl.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/datasources/remote/task_remote_datasource.dart';
import '../../data/datasources/local/local_storage_datasource.dart';
import '../../data/datasources/local/secure_storage_datasource.dart';

/// Factory to create UseCases manually
/// TODO: Replace with DI (getIt) after running build_runner
class UseCaseFactory {
  // Lazy singletons
  static TaskRepository? _taskRepository;
  static AuthRepository? _authRepository;

  static TaskRepository _getTaskRepository() {
    _taskRepository ??= TaskRepositoryImpl(
      TaskRemoteDataSource(),
      LocalStorageDataSource(),
    );
    return _taskRepository!;
  }

  static AuthRepository _getAuthRepository() {
    _authRepository ??= AuthRepositoryImpl(SecureStorageDataSource());
    return _authRepository!;
  }

  // UseCase factories
  static GetTasksUseCase createGetTasksUseCase() {
    return GetTasksUseCase(_getTaskRepository());
  }

  static AddTaskUseCase createAddTaskUseCase() {
    return AddTaskUseCase(_getTaskRepository());
  }

  static UpdateTaskUseCase createUpdateTaskUseCase() {
    return UpdateTaskUseCase(_getTaskRepository());
  }

  static DeleteTaskUseCase createDeleteTaskUseCase() {
    return DeleteTaskUseCase(_getTaskRepository());
  }

  static LoginUseCase createLoginUseCase() {
    return LoginUseCase(_getAuthRepository());
  }

  static LogoutUseCase createLogoutUseCase() {
    return LogoutUseCase(_getAuthRepository());
  }

  static CheckAuthStatusUseCase createCheckAuthStatusUseCase() {
    return CheckAuthStatusUseCase(_getAuthRepository());
  }
}
