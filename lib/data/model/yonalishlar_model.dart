class YonalishModel {
  final int id;
  final int viloyatId1;
  final String viloyat1Nomi;
  final int viloyatId2;
  final String viloyat2Nomi;

  YonalishModel({
    required this.id,
    required this.viloyatId1,
    required this.viloyat1Nomi,
    required this.viloyatId2,
    required this.viloyat2Nomi,
  });

  // JSON dan modelga aylantirish
  factory YonalishModel.fromJson(Map<String, dynamic> json) {
    return YonalishModel(
      id: json['id'],
      viloyatId1: json['viloyat_id1'],
      viloyat1Nomi: json['viloyat1_nomi'],
      viloyatId2: json['viloyat_id2'],
      viloyat2Nomi: json['viloyat2_nomi'],
    );
  }

  // Modeldan JSON ga aylantirish
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'viloyat_id1': viloyatId1,
      'viloyat1_nomi': viloyat1Nomi,
      'viloyat_id2': viloyatId2,
      'viloyat2_nomi': viloyat2Nomi,
    };
  }
}
