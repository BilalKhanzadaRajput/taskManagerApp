import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/task/task_bloc.dart';
import '../bloc/theme/theme_cubit.dart';
import '../../domain/entities/task_entity.dart';
import '../constants/dimensions_resource.dart';
import '../constants/route_constants.dart';
import '../utils/text_styles.dart';
import '../utils/theme_extensions.dart';
import '../router/app_router.dart';
import '../widgets/task_item_widget.dart';
import '../widgets/search_bar_widget.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();

  int _previousTaskCount = 0;
  bool _wasAuthenticated = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  List<TaskEntity> _getFilteredTasks(List<TaskEntity> tasks, String query) {
    if (query.isEmpty) {
      return tasks;
    }
    final lowerQuery = query.toLowerCase();
    return tasks.where((task) {
      return task.todo.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  void _onScroll() {
    if (_isBottom) {
      final taskBloc = context.read<TaskBloc>();
      final state = taskBloc.state;
      // Only load more if there are more tasks and not currently searching
      if (state.hasMore && !state.isLoading && state.searchQuery.isEmpty) {
        taskBloc.add(
          TaskEvent.onLoadTasks(
            limit: state.limit,
            skip: state.skip + state.limit,
          ),
        );
      }
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _handleLogout() {
    AppRouter.clearCachedTaskBloc();
    context.read<AuthBloc>().add(const AuthEvent.onLogout());
    // Navigation will happen in BlocListener when logout completes
  }

  void _handleAddTask() {
    context.push(RouteConstants.ADD_TASK_SCREEN_ROUTE);
  }

  void _handleViewTask(TaskEntity task) {
    context.push(RouteConstants.VIEW_TASK_SCREEN_ROUTE, extra: task);
  }

  void _handleEditTask(TaskEntity task) {
    context.push(RouteConstants.EDIT_TASK_SCREEN_ROUTE, extra: task);
  }

  void _handleDeleteTask(TaskEntity task) {
    final taskBloc = context.read<TaskBloc>();
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete Task'),
        content: const Text('Are you sure you want to delete this task?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              taskBloc.add(TaskEvent.onDeleteTask(id: task.id));
            },
            child: Text('Delete', style: TextStyle(color: context.errorColor)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            // Handle logout - navigate to login when logout completes
            if (_wasAuthenticated &&
                !state.isAuthenticated &&
                !state.isLoading &&
                state.user == null) {
              // Show success message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Successfully logged out'),
                  backgroundColor: context.successColor,
                  duration: const Duration(seconds: 2),
                ),
              );
              // Navigate to login screen after logout completes
              Future.microtask(() {
                if (context.mounted) {
                  context.go(RouteConstants.LOGIN_SCREEN_ROUTE);
                }
              });
            }
            _wasAuthenticated = state.isAuthenticated;
          },
        ),
        BlocListener<TaskBloc, TaskState>(
          listener: (context, state) {
            if (state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage!),
                  backgroundColor: context.errorColor,
                ),
              );
            }

            // Show success message when task is deleted
            if (state.tasks.length < _previousTaskCount && !state.isLoading) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Task successfully deleted'),
                  backgroundColor: context.successColor,
                  duration: const Duration(seconds: 2),
                ),
              );
            }

            // Scroll to top when new task is added
            if (state.tasks.length > _previousTaskCount) {
              if (_scrollController.hasClients) {
                Future.microtask(() {
                  if (_scrollController.hasClients) {
                    _scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  }
                });
              }
            }

            _previousTaskCount = state.tasks.length;
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: context.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'My Tasks',
            style: GoogleFonts.lora(
              fontSize: DimensionsResource.FONT_SIZE_20.sp,
              fontWeight: FontWeight.w600,
              color: context.primaryTextColor,
            ),
          ),
          actions: [
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, themeState) {
                final systemBrightness = MediaQuery.of(
                  context,
                ).platformBrightness;
                final isDark =
                    themeState.themeMode == ThemeMode.dark ||
                    (themeState.themeMode == ThemeMode.system &&
                        systemBrightness == Brightness.dark);
                return IconButton(
                  icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                  onPressed: () {
                    context.read<ThemeCubit>().toggleTheme(systemBrightness);
                  },
                  tooltip: isDark
                      ? 'Switch to light mode'
                      : 'Switch to dark mode',
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: _handleLogout,
              tooltip: 'Logout',
            ),
          ],
          bottom: SearchBarWidget(searchController: _searchController),
        ),
        body: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            final filteredTasks = _getFilteredTasks(
              state.tasks,
              state.searchQuery,
            );

            // Show loading indicator only on initial load
            if (state.tasks.isEmpty && state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // Show empty state when no tasks exist (and not searching)
            if (state.tasks.isEmpty &&
                !state.isLoading &&
                state.searchQuery.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.task_outlined,
                      size: DimensionsResource.D_64.w,
                      color: context.secondaryTextColor,
                    ),
                    SizedBox(height: DimensionsResource.D_16.h),
                    Text(
                      'No tasks yet',
                      style: AppTextStyles.titleLarge(context).copyWith(
                        fontSize: DimensionsResource.FONT_SIZE_18.sp,
                        color: context.secondaryTextColor,
                      ),
                    ),
                    SizedBox(height: DimensionsResource.D_8.h),
                    Text(
                      'Tap + to add a new task',
                      style: AppTextStyles.bodyMedium(context).copyWith(
                        fontSize: DimensionsResource.FONT_SIZE_14.sp,
                        color: context.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              );
            }

            // Show no search results when filtering returns empty
            if (filteredTasks.isEmpty && state.searchQuery.isNotEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_off,
                      size: DimensionsResource.D_64.w,
                      color: context.secondaryTextColor,
                    ),
                    SizedBox(height: DimensionsResource.D_16.h),
                    Text(
                      'No tasks found',
                      style: AppTextStyles.titleLarge(context).copyWith(
                        fontSize: DimensionsResource.FONT_SIZE_18.sp,
                        color: context.secondaryTextColor,
                      ),
                    ),
                    SizedBox(height: DimensionsResource.D_8.h),
                    Text(
                      'Try a different search term',
                      style: AppTextStyles.bodyMedium(context).copyWith(
                        fontSize: DimensionsResource.FONT_SIZE_14.sp,
                        color: context.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<TaskBloc>().add(
                  const TaskEvent.onLoadTasks(limit: 10, skip: 0),
                );
              },
              child: ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.symmetric(
                  vertical: DimensionsResource.D_8.h,
                ),
                itemCount:
                    filteredTasks.length +
                    (state.hasMore && state.searchQuery.isEmpty ? 1 : 0),
                itemBuilder: (context, index) {
                  // Show loading indicator at the bottom when loading more
                  if (index >= filteredTasks.length) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  final task = filteredTasks[index];
                  return TaskItemWidget(
                    task: task,
                    index: index,
                    onTap: () => _handleViewTask(task),
                    onEdit: () => _handleEditTask(task),
                    onDelete: () => _handleDeleteTask(task),
                  );
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _handleAddTask,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
