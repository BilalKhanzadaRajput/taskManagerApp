/// Domain exception to signal that task should be updated locally
/// Used when a task doesn't exist on the server (e.g., locally created task)
/// This is a domain-level exception representing a business rule
class LocalUpdateException implements Exception {
  final int id;
  final String? todo;
  final bool? completed;
  final int? userId;

  LocalUpdateException({
    required this.id,
    this.todo,
    this.completed,
    this.userId,
  });

  @override
  String toString() =>
      'LocalUpdateException: Task $id should be updated locally';
}
