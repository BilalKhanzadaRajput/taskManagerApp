import '../entities/user_entity.dart';

/// Domain repository interface for authentication
/// This defines the contract that data layer must implement
abstract class AuthRepository {
  Future<UserEntity> login(String username, String password);
  Future<void> logout();
  Future<bool> isLoggedIn();
  Future<String?> getCurrentUserId();
}
