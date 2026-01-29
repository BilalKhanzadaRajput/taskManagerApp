import '../../domain/entities/task_entity.dart';
import '../models/task_model.dart';

/// Mapper to convert between Data models and Domain entities
class TaskMapper {
  /// Convert Data model to Domain entity
  static TaskEntity toEntity(TaskModel model) {
    return TaskEntity(
      id: model.id,
      todo: model.todo,
      completed: model.completed,
      userId: model.userId,
    );
  }

  /// Convert Domain entity to Data model
  static TaskModel toModel(TaskEntity entity) {
    return TaskModel(
      id: entity.id,
      todo: entity.todo,
      completed: entity.completed,
      userId: entity.userId,
    );
  }

  /// Convert list of Data models to Domain entities
  static List<TaskEntity> toEntityList(List<TaskModel> models) {
    return models.map((model) => toEntity(model)).toList();
  }

  /// Convert list of Domain entities to Data models
  static List<TaskModel> toModelList(List<TaskEntity> entities) {
    return entities.map((entity) => toModel(entity)).toList();
  }
}
