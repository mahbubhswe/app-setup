import 'package:get/get.dart';
import 'package:setupapp/modules/auth/screens/auth_screen.dart';
import 'package:setupapp/modules/home/screens/home_screen.dart';
import 'package:setupapp/services/firebase_exports.dart';
import '../services/auth_service.dart';

class AuthController extends GetxController {
  final _authService = AuthService();

  final Rxn<User> user = Rxn<User>();
  final RxBool isLoading = false.obs;
  final RxBool isNewUser = false.obs;
  final RxString error = ''.obs;
  final RxString email = ''.obs;
  final RxString password = ''.obs;

  @override
  void onInit() {
    user.bindStream(_authService.authState());
    super.onInit();
  }

  bool get isLoggedIn => user.value != null;

  // 🔐 Email/Password login
  Future<void> login({required String email, required String password}) async {
    _setLoading(true);
    try {
      await _authService.login(email, password);
      Get.offAll(() => HomeScreen());
    } catch (e) {
      _showError(e);
    } finally {
      _setLoading(false);
    }
  }

  // 🔐 Google Sign-In
  Future<void> signInWithGoogle() async {
    _setLoading(true);
    try {
      final userCredential = await _authService.signInWithGoogle();
      if (userCredential != null) {
        user.value = userCredential.user;
        isNewUser.value = userCredential.additionalUserInfo?.isNewUser ?? false;
      } else {
        _showError("Google Sign-In canceled or failed");
      }
    } catch (e) {
      _showError(e);
    } finally {
      _setLoading(false);
    }
  }

  // 🚪 Logout
  Future<void> logout() async {
    await _authService.logout();
    Get.offAll(() => AuthScreen());
  }

  // ⚠️ Error handler
  void _showError(Object e) {
    error.value = e.toString();
    Get.snackbar(
      "Error",
      error.value,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
    );
  }

  // ⏳ Loading helper
  void _setLoading(bool value) => isLoading.value = value;
}
