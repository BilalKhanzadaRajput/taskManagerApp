import '../repositories/auth_repository.dart';

/// Use case for checking authentication status
/// Encapsulates the business logic for verifying login state
class CheckAuthStatusUseCase {
  final AuthRepository _repository;

  CheckAuthStatusUseCase(this._repository);

  Future<bool> call() async {
    return await _repository.isLoggedIn();
  }
}
