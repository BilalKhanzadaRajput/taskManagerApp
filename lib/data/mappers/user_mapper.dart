import '../../domain/entities/user_entity.dart';
import '../models/user_model.dart';

/// Mapper to convert between Data models and Domain entities
class UserMapper {
  /// Convert Data model to Domain entity
  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      username: model.username,
      email: model.email,
      firstName: model.firstName,
      lastName: model.lastName,
      gender: model.gender,
      image: model.image,
      token: model.token,
    );
  }

  /// Convert Domain entity to Data model
  static UserModel toModel(UserEntity entity) {
    return UserModel(
      id: entity.id,
      username: entity.username,
      email: entity.email,
      firstName: entity.firstName,
      lastName: entity.lastName,
      gender: entity.gender,
      image: entity.image,
      token: entity.token,
    );
  }
}
