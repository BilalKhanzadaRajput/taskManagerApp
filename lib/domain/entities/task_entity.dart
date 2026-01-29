/// Domain entity representing a Task
/// This is the core business entity, independent of data sources
class TaskEntity {
  final int id;
  final String todo;
  final bool completed;
  final int userId;

  const TaskEntity({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  TaskEntity copyWith({
    int? id,
    String? todo,
    bool? completed,
    int? userId,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      todo: todo ?? this.todo,
      completed: completed ?? this.completed,
      userId: userId ?? this.userId,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          todo == other.todo &&
          completed == other.completed &&
          userId == other.userId;

  @override
  int get hashCode => id.hashCode ^ todo.hashCode ^ completed.hashCode ^ userId.hashCode;
}
