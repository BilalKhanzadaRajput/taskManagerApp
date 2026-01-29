import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/task_entity.dart';
import '../../../domain/exceptions/local_update_exception.dart';
import '../../../domain/usecases/get_tasks_usecase.dart';
import '../../../domain/usecases/add_task_usecase.dart';
import '../../../domain/usecases/update_task_usecase.dart';
import '../../../domain/usecases/delete_task_usecase.dart';
import '../../utils/error_message_helper.dart';

part 'task_event.dart';
part 'task_state.dart';
part 'task_bloc.freezed.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final GetTasksUseCase _getTasksUseCase;
  final AddTaskUseCase _addTaskUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;

  TaskBloc({
    required GetTasksUseCase getTasksUseCase,
    required AddTaskUseCase addTaskUseCase,
    required UpdateTaskUseCase updateTaskUseCase,
    required DeleteTaskUseCase deleteTaskUseCase,
  }) : _getTasksUseCase = getTasksUseCase,
       _addTaskUseCase = addTaskUseCase,
       _updateTaskUseCase = updateTaskUseCase,
       _deleteTaskUseCase = deleteTaskUseCase,
       super(const TaskState()) {
    on<_OnLoadTasks>(_onLoadTasks);
    on<_OnAddTask>(_onAddTask);
    on<_OnUpdateTask>(_onUpdateTask);
    on<_OnDeleteTask>(_onDeleteTask);
    on<_OnToggleTask>(_onToggleTask);
    on<_OnSearchTasks>(_onSearchTasks);
  }

  Future<void> _onLoadTasks(_OnLoadTasks event, Emitter<TaskState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final response = await _getTasksUseCase(
        limit: event.limit,
        skip: event.skip,
      );

      final updatedTasks = event.skip == 0
          ? response.tasks
          : [...state.tasks, ...response.tasks];

      emit(
        state.copyWith(
          isLoading: false,
          tasks: updatedTasks,
          total: response.total,
          skip: response.skip,
          limit: response.limit,
          hasMore: response.hasMore,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: ErrorMessageHelper.getErrorMessage(e),
        ),
      );
    }
  }

  Future<void> _onAddTask(_OnAddTask event, Emitter<TaskState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final newTask = await _addTaskUseCase(
        todo: event.todo,
        completed: event.completed,
        userId: event.userId,
      );

      emit(
        state.copyWith(
          isLoading: false,
          tasks: [newTask, ...state.tasks],
          total: state.total + 1,
          searchQuery: '',
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: ErrorMessageHelper.getErrorMessage(e),
        ),
      );
    }
  }

  Future<void> _onUpdateTask(
    _OnUpdateTask event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final updatedTask = await _updateTaskUseCase(
        id: event.id,
        todo: event.todo,
        completed: event.completed,
        userId: event.userId,
      );

      final taskIndex = state.tasks.indexWhere(
        (TaskEntity task) => task.id == event.id,
      );
      final List<TaskEntity> updatedTasks;

      if (taskIndex >= 0) {
        updatedTasks = List<TaskEntity>.from(state.tasks);
        updatedTasks[taskIndex] = updatedTask;
      } else {
        updatedTasks = [updatedTask, ...state.tasks];
      }

      emit(
        state.copyWith(
          isLoading: false,
          tasks: updatedTasks,
          errorMessage: null,
        ),
      );
    } on LocalUpdateException catch (localUpdate) {
      final taskIndex = state.tasks.indexWhere(
        (TaskEntity task) => task.id == localUpdate.id,
      );
      if (taskIndex >= 0) {
        final existingTask = state.tasks[taskIndex];
        final updatedTask = TaskEntity(
          id: existingTask.id,
          todo: localUpdate.todo ?? existingTask.todo,
          completed: localUpdate.completed ?? existingTask.completed,
          userId: localUpdate.userId ?? existingTask.userId,
        );

        final updatedTasks = List<TaskEntity>.from(state.tasks);
        updatedTasks[taskIndex] = updatedTask;

        emit(
          state.copyWith(
            isLoading: false,
            tasks: updatedTasks,
            errorMessage: null,
          ),
        );
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: 'Task not found'));
      }
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: ErrorMessageHelper.getErrorMessage(e),
        ),
      );
    }
  }

  Future<void> _onDeleteTask(
    _OnDeleteTask event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      await _deleteTaskUseCase(event.id);

      final updatedTasks = state.tasks
          .where((TaskEntity task) => task.id != event.id)
          .toList();

      emit(
        state.copyWith(
          isLoading: false,
          tasks: updatedTasks,
          total: state.total - 1,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: ErrorMessageHelper.getErrorMessage(e),
        ),
      );
    }
  }

  Future<void> _onToggleTask(
    _OnToggleTask event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final updatedTask = await _updateTaskUseCase(
        id: event.id,
        completed: event.completed,
      );

      final updatedTasks = state.tasks.map((TaskEntity task) {
        return task.id == event.id ? updatedTask : task;
      }).toList();

      emit(
        state.copyWith(
          isLoading: false,
          tasks: updatedTasks,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: ErrorMessageHelper.getErrorMessage(e),
        ),
      );
    }
  }

  Future<void> _onSearchTasks(
    _OnSearchTasks event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(searchQuery: event.query));
  }
}
