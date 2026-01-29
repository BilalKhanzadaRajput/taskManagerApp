import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/task/task_bloc.dart';
import '../../domain/entities/task_entity.dart';
import '../factories/usecase_factory.dart';
import '../screens/login_screen.dart';
import '../screens/task_list_screen.dart';
import '../screens/add_edit_task_screen.dart';
import '../screens/view_task_screen.dart';
import '../constants/route_constants.dart';

class AppRouter {
  static TaskBloc? _cachedTaskBloc;

  static void clearCachedTaskBloc() {
    _cachedTaskBloc = null;
  }

  static GoRouter createRouter(AuthBloc authBloc) {
    return GoRouter(
      initialLocation: RouteConstants.LOGIN_SCREEN_ROUTE,
      redirect: (context, state) {
        final isAuthenticated = authBloc.state.isAuthenticated;
        final isLoginRoute =
            state.matchedLocation == RouteConstants.LOGIN_SCREEN_ROUTE;

        if (!isAuthenticated && !isLoginRoute) {
          return RouteConstants.LOGIN_SCREEN_ROUTE;
        }

        if (isAuthenticated && isLoginRoute) {
          return RouteConstants.TASK_LIST_SCREEN_ROUTE;
        }

        return null;
      },
      routes: [
        GoRoute(
          path: RouteConstants.LOGIN_SCREEN_ROUTE,
          builder: (context, state) =>
              BlocProvider.value(value: authBloc, child: const LoginScreen()),
        ),
        GoRoute(
          path: RouteConstants.TASK_LIST_SCREEN_ROUTE,
          builder: (context, state) {
            TaskBloc? existingBloc;
            try {
              existingBloc = context.read<TaskBloc>();
              _cachedTaskBloc = existingBloc;
            } catch (_) {
              // No TaskBloc in context
            }

            if (_cachedTaskBloc == null) {
              _cachedTaskBloc = TaskBloc(
                getTasksUseCase: UseCaseFactory.createGetTasksUseCase(),
                addTaskUseCase: UseCaseFactory.createAddTaskUseCase(),
                updateTaskUseCase: UseCaseFactory.createUpdateTaskUseCase(),
                deleteTaskUseCase: UseCaseFactory.createDeleteTaskUseCase(),
              )..add(const TaskEvent.onLoadTasks());
            } else {
              if (_cachedTaskBloc!.state.tasks.isEmpty &&
                  !_cachedTaskBloc!.state.isLoading) {
                _cachedTaskBloc!.add(const TaskEvent.onLoadTasks());
              }
            }

            return MultiBlocProvider(
              providers: [
                BlocProvider.value(value: authBloc),
                BlocProvider.value(value: _cachedTaskBloc!),
              ],
              child: const TaskListScreen(),
            );
          },
          routes: [
            GoRoute(
              path: 'add',
              builder: (context, state) {
                if (_cachedTaskBloc == null) {
                  _cachedTaskBloc = TaskBloc(
                    getTasksUseCase: UseCaseFactory.createGetTasksUseCase(),
                    addTaskUseCase: UseCaseFactory.createAddTaskUseCase(),
                    updateTaskUseCase: UseCaseFactory.createUpdateTaskUseCase(),
                    deleteTaskUseCase: UseCaseFactory.createDeleteTaskUseCase(),
                  );
                }

                return BlocProvider.value(
                  value: _cachedTaskBloc!,
                  child: const AddEditTaskScreen(),
                );
              },
            ),
            GoRoute(
              path: 'view',
              builder: (context, state) {
                final task = state.extra as TaskEntity;

                if (_cachedTaskBloc == null) {
                  _cachedTaskBloc = TaskBloc(
                    getTasksUseCase: UseCaseFactory.createGetTasksUseCase(),
                    addTaskUseCase: UseCaseFactory.createAddTaskUseCase(),
                    updateTaskUseCase: UseCaseFactory.createUpdateTaskUseCase(),
                    deleteTaskUseCase: UseCaseFactory.createDeleteTaskUseCase(),
                  );
                }

                return BlocProvider.value(
                  value: _cachedTaskBloc!,
                  child: ViewTaskScreen(task: task),
                );
              },
            ),
            GoRoute(
              path: 'edit',
              builder: (context, state) {
                final task = state.extra as TaskEntity;

                if (_cachedTaskBloc == null) {
                  _cachedTaskBloc = TaskBloc(
                    getTasksUseCase: UseCaseFactory.createGetTasksUseCase(),
                    addTaskUseCase: UseCaseFactory.createAddTaskUseCase(),
                    updateTaskUseCase: UseCaseFactory.createUpdateTaskUseCase(),
                    deleteTaskUseCase: UseCaseFactory.createDeleteTaskUseCase(),
                  );
                }

                return BlocProvider.value(
                  value: _cachedTaskBloc!,
                  child: AddEditTaskScreen(task: task),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
