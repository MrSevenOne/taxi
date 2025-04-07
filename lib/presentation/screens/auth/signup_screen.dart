import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxi/core/config/app_constant.dart';
import 'package:taxi/data/model/user_model.dart';
import 'package:taxi/presentation/provider/auth_provider.dart';
import 'package:taxi/presentation/widgets/snackbar_widget.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _onesignalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Ro‘yxatdan o‘tish")),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  hintText: "Telefon raqami",
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _onesignalController,
                decoration: InputDecoration(
                  hintText: "OneSignal ID",
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    String phone = _phoneController.text.trim();
                    int onesignalId =
                        int.tryParse(_onesignalController.text) ?? 0;

                    if (phone.isNotEmpty && onesignalId > 0) {
                      UserModel _userModel = UserModel(
                        telefon_raqam: phone,
                        onesignal_id: onesignalId,
                      );
                      authViewModel.signUp(
                        userModel: _userModel,
                        context: context,
                      );
                    } else {
                      SnackBarWidget.showError(
                          'Xatolik', "Ma'lumot to'ldiring");
                    }
                  },
                  child: authViewModel.isLoading
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : Text("Ro'yxatdan o'tish"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
