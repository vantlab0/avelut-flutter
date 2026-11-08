import 'package:avelut_flutter/domain/entities/auth_entity.dart';

/// Abstract auth repository interface (domain layer).
abstract class IAuthRepository {
  Future<AuthUser> signInWithEmail({
    required String email,
    required String password,
  });

  Future<AuthUser> signUpWithEmail({
    required String email,
    required String password,
    required String fullName,
  });

  Future<void> signOut();
  Future<void> resetPassword(String email);
  Future<void> signInWithGoogle();
  Stream<AuthUser?> get authStateChanges;
  AuthUser? get currentUser;
}
