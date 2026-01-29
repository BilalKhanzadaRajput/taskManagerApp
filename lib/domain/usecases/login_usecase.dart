import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

/// Use case for user login
/// Encapsulates the business logic for authentication
class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  Future<UserEntity> call(String username, String password) async {
    return await _repository.login(username, password);
  }
}
