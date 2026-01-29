import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../domain/entities/task_entity.dart';
import '../constants/colors_resource.dart';
import '../constants/dimensions_resource.dart';
import '../utils/text_styles.dart';
import '../utils/theme_extensions.dart';

class TaskItemWidget extends StatelessWidget {
  final TaskEntity task;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final int index;

  const TaskItemWidget({
    super.key,
    required this.task,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.only(
        bottom: DimensionsResource.D_12.h,
        left: DimensionsResource.D_16.w,
        right: DimensionsResource.D_16.w,
      ),
      color: context.cardColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DimensionsResource.RADIUS_12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: DimensionsResource.D_16.w,
          vertical: DimensionsResource.D_8.h,
        ),
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.primary,
          radius: DimensionsResource.D_16.w,
          child: Text(
            '${index + 1}',
            style: AppTextStyles.bodyMedium(context).copyWith(
              fontSize: DimensionsResource.FONT_SIZE_14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          task.todo,
          style: AppTextStyles.titleMedium(context).copyWith(
            fontSize: DimensionsResource.FONT_SIZE_16.sp,
            fontWeight: FontWeight.w500,
            color: context.primaryTextColor,
            decoration: task.completed
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        subtitle: task.completed
            ? Padding(
                padding: EdgeInsets.only(top: DimensionsResource.D_4.h),
                child: Text(
                  'Completed',
                  style: AppTextStyles.caption(context).copyWith(
                    fontSize: DimensionsResource.FONT_SIZE_12.sp,
                    color: context.successColor,
                  ),
                ),
              )
            : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              color: theme.colorScheme.primary,
              onPressed: onEdit,
              tooltip: 'Edit task',
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline),
              color: context.errorColor,
              onPressed: onDelete,
              tooltip: 'Delete task',
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
