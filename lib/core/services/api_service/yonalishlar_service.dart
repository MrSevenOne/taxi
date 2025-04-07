import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxi/core/config/app_constant.dart';
import 'package:taxi/data/model/yonalishlar_model.dart';

class YonalishService {
  Future<List<YonalishModel>> fetchYonalishlar() async {
    final url = Uri.parse("${baseUrl}yonalishlar.php");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        // Error maydonini tekshirish
        if (data['error'] == false) {
          // Yonalishlar ro'yxatini olish
          List<dynamic> yonalishlarData = data['data'];
          print(yonalishlarData);
          return yonalishlarData.map((e) => YonalishModel.fromJson(e)).toList();
        } else {
          throw Exception(
              data['message']); // Agar error true bo'lsa, message chiqarish
        }
      } else {
        throw Exception('Server xatosi: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Exception: $e');
    }
  }
}
