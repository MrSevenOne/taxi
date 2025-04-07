import 'package:flutter/material.dart';
import 'package:taxi/core/config/routes.dart';
import 'package:taxi/core/services/api_service/auth_services.dart';
import 'package:taxi/data/model/user_model.dart';
import 'package:taxi/presentation/widgets/snackbar_widget.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  bool get isLoading => _isLoading; // Loading holatini olish uchun getter

  String _message = '';

  String get message => _message;

  // Ro‘yxatdan o‘tish funksiyasi
  Future<void> signUp(
      {required UserModel userModel, required BuildContext context}) async {
    _isLoading = true; // Loading holatini faollashtirish
    _message = "Iltimos kuting..."; // Userga xabar berish
    notifyListeners(); // UI yangilash

    try {
      final response = await _authService.registerUser(userModel);

      if (response['error'] == false) {
        _message =
            "Muvaffaqiyatli ro‘yxatdan o‘tildi. ID: ${response['data']['user_id']}";
        SnackBarWidget.showSuccess("Muvaffaqiyatlik", _message);
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.home,
        ); // Muvaffaqiyatli ro‘yxatdan o‘tishdan keyin HomePage'ga o‘tish
      } else {
        _message = "Xatolik: ${response['message']}";
        SnackBarWidget.showError('Xatolik', _message);
      }
    } catch (e) {
      _message = "Xatolik: ${e.toString()}";
      SnackBarWidget.showError('Xatolik', _message);
    } finally {
      _isLoading = false; // Loading holatini to‘xtatish
      notifyListeners(); // UI yangilash
    }
  }
}
