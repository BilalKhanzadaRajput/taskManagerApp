import '../repositories/auth_repository.dart';

/// Use case for user logout
/// Encapsulates the business logic for signing out
class LogoutUseCase {
  final AuthRepository _repository;

  LogoutUseCase(this._repository);

  Future<void> call() async {
    return await _repository.logout();
  }
}
