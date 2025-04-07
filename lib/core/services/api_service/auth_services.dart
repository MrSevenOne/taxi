import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxi/core/config/app_constant.dart';
import 'package:taxi/data/model/user_model.dart';

class AuthService {
  Future<Map<String, dynamic>> registerUser(UserModel user) async {
    final url = Uri.parse("${baseUrl}registr_user.php");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {"error": true, "message": "Server xatosi: ${response.statusCode}"};
      }
    } catch (e) {
      return {"error": true, "message": "Exception: $e"};
    }
  }
}
