import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/task/task_bloc.dart';
import '../../domain/entities/task_entity.dart';
import '../constants/colors_resource.dart';
import '../constants/dimensions_resource.dart';
import '../widgets/custom_button_widget.dart';

class ViewTaskScreen extends StatelessWidget {
  final TaskEntity task;

  const ViewTaskScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        final currentTask = state.tasks.firstWhere(
          (t) => t.id == task.id,
          orElse: () => task,
        );

        return Scaffold(
          backgroundColor: isDark
              ? ColorsResource.DARK_BACKGROUND_COLOR
              : ColorsResource.BACKGROUND_COLOR,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: isDark
                ? ColorsResource.DARK_BACKGROUND_COLOR
                : ColorsResource.INFO_COLOR,
            title: Text(
              'Task Details',
              style: GoogleFonts.lora(
                fontSize: DimensionsResource.FONT_SIZE_24.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                color: isDark
                    ? ColorsResource.DARK_TEXT_PRIMARY_COLOR
                    : ColorsResource.DARK_TEXT_PRIMARY_COLOR,
              ),
            ),

            bottom: PreferredSize(
              preferredSize: Size.fromHeight(1.h),
              child: Container(
                color: isDark
                    ? ColorsResource.DARK_BORDER_COLOR
                    : ColorsResource.BORDER_COLOR,
                height: 1.h,
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(DimensionsResource.D_24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Task Number Badge
                  Center(
                    child: Container(
                      width: DimensionsResource.D_80.w,
                      height: DimensionsResource.D_80.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            ColorsResource.PRIMARY_COLOR,
                            ColorsResource.PRIMARY_DARK_COLOR,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: ColorsResource.PRIMARY_COLOR.withOpacity(
                              0.3,
                            ),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '#${currentTask.id}',
                          style: GoogleFonts.roboto(
                            fontSize: DimensionsResource.FONT_SIZE_24.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: DimensionsResource.D_32.h),

                  // Task Description Card
                  Container(
                    padding: EdgeInsets.all(DimensionsResource.D_24.w),
                    decoration: BoxDecoration(
                      color: isDark
                          ? ColorsResource.DARK_CARD_COLOR
                          : ColorsResource.CARD_COLOR,
                      borderRadius: BorderRadius.circular(
                        DimensionsResource.RADIUS_16,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: isDark
                              ? Colors.black.withOpacity(0.3)
                              : Colors.grey.withOpacity(0.1),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Task Description',
                          style: GoogleFonts.roboto(
                            fontSize: DimensionsResource.FONT_SIZE_14.sp,
                            fontWeight: FontWeight.w600,
                            color: isDark
                                ? ColorsResource.DARK_TEXT_SECONDARY_COLOR
                                : ColorsResource.TEXT_SECONDARY_COLOR,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: DimensionsResource.D_12.h),
                        Text(
                          currentTask.todo,
                          style: GoogleFonts.roboto(
                            fontSize: DimensionsResource.FONT_SIZE_18.sp,
                            fontWeight: FontWeight.w500,
                            color: isDark
                                ? ColorsResource.DARK_TEXT_PRIMARY_COLOR
                                : ColorsResource.TEXT_PRIMARY_COLOR,
                            decoration: currentTask.completed
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            decorationThickness: 2,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: DimensionsResource.D_24.h),

                  // Status Card
                  Container(
                    padding: EdgeInsets.all(DimensionsResource.D_24.w),
                    decoration: BoxDecoration(
                      color: isDark
                          ? ColorsResource.DARK_CARD_COLOR
                          : ColorsResource.CARD_COLOR,
                      borderRadius: BorderRadius.circular(
                        DimensionsResource.RADIUS_16,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: isDark
                              ? Colors.black.withOpacity(0.3)
                              : Colors.grey.withOpacity(0.1),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(DimensionsResource.D_12.w),
                          decoration: BoxDecoration(
                            color: currentTask.completed
                                ? ColorsResource.SUCCESS_COLOR.withOpacity(0.1)
                                : ColorsResource.WARNING_COLOR.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            currentTask.completed
                                ? Icons.check_circle_rounded
                                : Icons.pending_rounded,
                            color: currentTask.completed
                                ? ColorsResource.SUCCESS_COLOR
                                : ColorsResource.WARNING_COLOR,
                            size: DimensionsResource.ICON_SIZE_24.w,
                          ),
                        ),
                        SizedBox(width: DimensionsResource.D_16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Status',
                                style: GoogleFonts.roboto(
                                  fontSize: DimensionsResource.FONT_SIZE_14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: isDark
                                      ? ColorsResource.DARK_TEXT_SECONDARY_COLOR
                                      : ColorsResource.TEXT_SECONDARY_COLOR,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              SizedBox(height: DimensionsResource.D_4.h),
                              Text(
                                currentTask.completed ? 'Completed' : 'Pending',
                                style: GoogleFonts.roboto(
                                  fontSize: DimensionsResource.FONT_SIZE_18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: currentTask.completed
                                      ? ColorsResource.SUCCESS_COLOR
                                      : ColorsResource.WARNING_COLOR,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: DimensionsResource.D_24.h),

                  // User ID Card
                  Container(
                    padding: EdgeInsets.all(DimensionsResource.D_24.w),
                    decoration: BoxDecoration(
                      color: isDark
                          ? ColorsResource.DARK_CARD_COLOR
                          : ColorsResource.CARD_COLOR,
                      borderRadius: BorderRadius.circular(
                        DimensionsResource.RADIUS_16,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: isDark
                              ? Colors.black.withOpacity(0.3)
                              : Colors.grey.withOpacity(0.1),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(DimensionsResource.D_12.w),
                          decoration: BoxDecoration(
                            color: ColorsResource.PRIMARY_COLOR.withOpacity(
                              0.1,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person_rounded,
                            color: ColorsResource.PRIMARY_COLOR,
                            size: DimensionsResource.ICON_SIZE_24.w,
                          ),
                        ),
                        SizedBox(width: DimensionsResource.D_16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'User ID',
                                style: GoogleFonts.roboto(
                                  fontSize: DimensionsResource.FONT_SIZE_14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: isDark
                                      ? ColorsResource.DARK_TEXT_SECONDARY_COLOR
                                      : ColorsResource.TEXT_SECONDARY_COLOR,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              SizedBox(height: DimensionsResource.D_4.h),
                              Text(
                                '${currentTask.userId}',
                                style: GoogleFonts.roboto(
                                  fontSize: DimensionsResource.FONT_SIZE_18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: isDark
                                      ? ColorsResource.DARK_TEXT_PRIMARY_COLOR
                                      : ColorsResource.TEXT_PRIMARY_COLOR,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: DimensionsResource.D_24.h),

                  // Edit Button
                  CustomButton(
                    text: 'Edit Task',
                    onPressed: () {
                      context.push('/tasks/edit', extra: currentTask);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
