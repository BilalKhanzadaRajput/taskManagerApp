import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/task/task_bloc.dart';
import '../constants/colors_resource.dart';
import '../constants/dimensions_resource.dart';
import '../utils/text_styles.dart';
import '../utils/theme_extensions.dart';

class SearchBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final TextEditingController searchController;

  const SearchBarWidget({super.key, required this.searchController});

  @override
  Size get preferredSize => Size.fromHeight(DimensionsResource.D_56.h);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  void initState() {
    super.initState();
    // Listen to controller changes to prevent loops
    widget.searchController.addListener(_onControllerChanged);
  }

  @override
  void dispose() {
    widget.searchController.removeListener(_onControllerChanged);
    super.dispose();
  }

  void _onControllerChanged() {
    // This prevents infinite loops when we update controller from state
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskBloc, TaskState>(
      listenWhen: (previous, current) {
        return previous.searchQuery != current.searchQuery;
      },
      listener: (context, state) {
        // Sync controller when state changes programmatically (e.g., when task is added)
        if (widget.searchController.text != state.searchQuery) {
          // Temporarily remove listener to prevent triggering onChanged
          widget.searchController.removeListener(_onControllerChanged);
          widget.searchController.text = state.searchQuery;
          widget.searchController.addListener(_onControllerChanged);
        }
      },
      child: BlocBuilder<TaskBloc, TaskState>(
        buildWhen: (previous, current) {
          // Only rebuild when search query changes (for suffix icon)
          return previous.searchQuery != current.searchQuery;
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: DimensionsResource.D_16.w,
              vertical: DimensionsResource.D_8.h,
            ),
            child: TextField(
              controller: widget.searchController,
              decoration: InputDecoration(
                hintText: 'Search tasks...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: state.searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          widget.searchController.clear();
                          context.read<TaskBloc>().add(
                            TaskEvent.onSearchTasks(query: ''),
                          );
                        },
                      )
                    : null,
                filled: true,
                fillColor: context.cardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    DimensionsResource.RADIUS_8,
                  ),
                  borderSide: BorderSide(color: context.borderColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    DimensionsResource.RADIUS_8,
                  ),
                  borderSide: BorderSide(color: context.borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    DimensionsResource.RADIUS_8,
                  ),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: DimensionsResource.D_16.w,
                  vertical: DimensionsResource.D_12.h,
                ),
              ),
              style: AppTextStyles.bodyMedium(context).copyWith(
                fontSize: DimensionsResource.FONT_SIZE_14.sp,
                color: context.primaryTextColor,
              ),
              onChanged: (value) {
                // Update bloc state when user types
                context.read<TaskBloc>().add(
                  TaskEvent.onSearchTasks(query: value),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
