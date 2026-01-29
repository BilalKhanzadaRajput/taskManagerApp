import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/task/task_bloc.dart';
import '../../domain/entities/task_entity.dart';
import '../constants/colors_resource.dart';
import '../constants/dimensions_resource.dart';
import '../../data/utils/secure_storage_helper.dart';
import '../widgets/custom_text_field_widget.dart';
import '../widgets/custom_button_widget.dart';

class AddEditTaskScreen extends StatefulWidget {
  final dynamic task;

  const AddEditTaskScreen({super.key, this.task});

  @override
  State<AddEditTaskScreen> createState() => _AddEditTaskScreenState();
}

class _AddEditTaskScreenState extends State<AddEditTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _todoController;
  bool _completed = false;
  int? _userId;
  bool _isLoadingUserId = true;

  @override
  void initState() {
    super.initState();
    final task = widget.task as TaskEntity?;
    _todoController = TextEditingController(text: task?.todo ?? '');
    _completed = task?.completed ?? false;
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    try {
      final userIdString = await SecureStorageHelper.getUserId();
      if (userIdString != null) {
        setState(() {
          _userId = int.tryParse(userIdString);
          _isLoadingUserId = false;
        });
      } else {
        setState(() {
          _isLoadingUserId = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoadingUserId = false;
      });
    }
  }

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  void _handleSave() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_isLoadingUserId) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please wait, loading user information...'),
          backgroundColor: ColorsResource.ERROR_COLOR,
        ),
      );
      return;
    }

    if (_userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('User ID not found. Please login again.'),
          backgroundColor: ColorsResource.ERROR_COLOR,
        ),
      );
      return;
    }

    final task = widget.task as TaskEntity?;
    if (task == null) {
      context.read<TaskBloc>().add(
        TaskEvent.onAddTask(
          todo: _todoController.text.trim(),
          completed: _completed,
          userId: _userId!,
        ),
      );
    } else {
      context.read<TaskBloc>().add(
        TaskEvent.onUpdateTask(
          id: task.id,
          todo: _todoController.text.trim(),
          completed: _completed,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final task = widget.task as TaskEntity?;
    final isEditMode = task != null;

    return BlocListener<TaskBloc, TaskState>(
      listenWhen: (previous, current) {
        final loadingCompleted = previous.isLoading && !current.isLoading;

        if (loadingCompleted) {
          if (widget.task == null) {
            // For add: check if task was added or error occurred
            final taskAdded = current.tasks.length > previous.tasks.length;
            return taskAdded || current.errorMessage != null;
          }

          if (widget.task != null) {
            // For update: check if task exists (was updated) or error occurred
            final taskId = (widget.task as TaskEntity).id;
            final taskUpdated = current.tasks.any((t) => t.id == taskId);
            return taskUpdated || current.errorMessage != null;
          }
        }

        return false;
      },
      listener: (context, state) {
        if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: ColorsResource.ERROR_COLOR,
              duration: const Duration(seconds: 3),
            ),
          );
        } else {
          // Show success message and navigate back
          if (widget.task == null) {
            // Task added successfully
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Task successfully added'),
                backgroundColor: ColorsResource.SUCCESS_COLOR,
                duration: const Duration(seconds: 2),
              ),
            );
          } else {
            // Task updated successfully
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Task successfully updated'),
                backgroundColor: ColorsResource.SUCCESS_COLOR,
                duration: const Duration(seconds: 2),
              ),
            );
          }

          if (mounted) {
            Future.delayed(const Duration(milliseconds: 500), () {
              if (mounted) {
                context.pop();
              }
            });
          }
        }
      },
      child: Scaffold(
        backgroundColor: isDark
            ? ColorsResource.DARK_BACKGROUND_COLOR
            : ColorsResource.BACKGROUND_COLOR,
        appBar: AppBar(
          title: Text(
            isEditMode ? 'Edit Task' : 'Add Task',
            style: GoogleFonts.lora(
              fontSize: DimensionsResource.FONT_SIZE_20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(DimensionsResource.D_24.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(
                    controller: _todoController,
                    labelText: 'Task',
                    hintText: 'Enter task description',
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a task description';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: DimensionsResource.D_24.h),
                  Card(
                    color: isDark
                        ? ColorsResource.DARK_CARD_COLOR
                        : ColorsResource.CARD_COLOR,
                    child: SwitchListTile(
                      title: Text(
                        'Completed',
                        style: GoogleFonts.roboto(
                          fontSize: DimensionsResource.FONT_SIZE_16.sp,
                          color: isDark
                              ? ColorsResource.DARK_TEXT_PRIMARY_COLOR
                              : ColorsResource.TEXT_PRIMARY_COLOR,
                        ),
                      ),
                      value: _completed,
                      onChanged: (value) {
                        setState(() {
                          _completed = value;
                        });
                      },
                      activeColor: ColorsResource.PRIMARY_COLOR,
                    ),
                  ),
                  SizedBox(height: DimensionsResource.D_32.h),
                  BlocBuilder<TaskBloc, TaskState>(
                    builder: (context, state) {
                      return CustomButton(
                        text: isEditMode ? 'Update Task' : 'Add Task',
                        onPressed: (_isLoadingUserId || _userId == null)
                            ? null
                            : _handleSave,
                        isLoading: state.isLoading || _isLoadingUserId,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
