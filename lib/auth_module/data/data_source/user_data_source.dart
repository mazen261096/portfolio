import '../../../core/services/supabase_auth_service.dart';
import '../../../core/utils/error_manager.dart';
import '../models/user_model.dart';


abstract class BaseUserDataSource {
  Future<AppUserModel> registerByEmail({required String email, required String password, required String name});
  Future<AppUserModel> loginByEmail({required String email, required String password});
  Future<void> logOut();
}


class UserDataSource implements BaseUserDataSource {
  final SupabaseAuthService authService;

  UserDataSource(this.authService);

  /// ✅ **Register a new user and return `AppUserModel`**
  @override
  Future<AppUserModel> registerByEmail({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final userData = await authService.registerUser(email: email, password: password, userName: name);
      return AppUserModel.fromJson(userData);
    } catch (error) {
      throw ErrorManager("Registration Error: $error");
    }
  }

  /// ✅ **Log in a user and return `AppUserModel`**
  @override
  Future<AppUserModel> loginByEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userData = await authService.loginUser(email: email, password: password);
      return AppUserModel.fromJson(userData);
    } catch (error) {
      throw ErrorManager("Login Error: $error");
    }
  }

  /// ✅ **Log out user from Supabase**
  @override
  Future<void> logOut() async {
    try {
      await authService.supabase.auth.signOut();
    } catch (error) {
      throw ErrorManager("Logout Error: $error");
    }
  }
}
