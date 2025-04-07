import 'package:flutter/material.dart';
import 'package:taxi/core/services/api_service/yonalishlar_service.dart';
import 'package:taxi/data/model/yonalishlar_model.dart';

class YonalishViewModel with ChangeNotifier {
  final YonalishService _yonalishService = YonalishService();
  List<YonalishModel> _yonalishlar = [];
  bool _isLoading = false;
  String _errorMessage = '';

  // DropDown uchun tanlangan qiymatlar
  int? _selectedViloyat1Id;
  int? _selectedViloyat2Id;

  List<YonalishModel> get yonalishlar => _yonalishlar;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  int? get selectedViloyat1Id => _selectedViloyat1Id;
  int? get selectedViloyat2Id => _selectedViloyat2Id;

  Future<void> fetchYonalishlar() async {
    _isLoading = true;
    notifyListeners();

    try {
      _yonalishlar = await _yonalishService.fetchYonalishlar();
      _errorMessage = ''; 
    } catch (e) {
      _errorMessage = e.toString();
      _yonalishlar = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Birinchi DropDown uchun - faqat `viloyat1_nomi` larni olish
  List<String> get uniqueViloyat1Names {
    return _yonalishlar
        .map((e) => e.viloyat1Nomi)
        .toSet()
        .toList();
  }

  // `viloyat1_nomi` tanlanganda, unga tegishli `viloyat_id1` ni saqlash
  void setSelectedViloyat1(String viloyat1Nomi) {
    final found = _yonalishlar.firstWhere(
      (e) => e.viloyat1Nomi == viloyat1Nomi,
      orElse: () => YonalishModel(id: 0, viloyatId1: 0, viloyat1Nomi: '', viloyatId2: 0, viloyat2Nomi: ''),
    );
    _selectedViloyat1Id = found.viloyatId1;
    _selectedViloyat2Id = null; // Reset second dropdown
    notifyListeners();
  }

  // Ikkinchi DropDown uchun - `viloyat_id1` ga mos kelgan `viloyat2_nomi` larni olish
  List<String> get relatedViloyat2Names {
    if (_selectedViloyat1Id == null) return [];
    return _yonalishlar
        .where((e) => e.viloyatId1 == _selectedViloyat1Id)
        .map((e) => e.viloyat2Nomi)
        .toSet()
        .toList();
  }

  // `viloyat2_nomi` tanlanganda, unga tegishli `viloyat_id2` ni saqlash
  void setSelectedViloyat2(String viloyat2Nomi) {
    final found = _yonalishlar.firstWhere(
      (e) => e.viloyat2Nomi == viloyat2Nomi,
      orElse: () => YonalishModel(id: 0, viloyatId1: 0, viloyat1Nomi: '', viloyatId2: 0, viloyat2Nomi: ''),
    );
    _selectedViloyat2Id = found.viloyatId2;
    notifyListeners();
  }
}
