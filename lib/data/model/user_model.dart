class UserModel {
  final String telefon_raqam;
  final int onesignal_id;

  UserModel({required this.telefon_raqam, required this.onesignal_id});

  // JSON ga o‘girish
  Map<String, dynamic> toJson() {
    return {
      'telefon_raqam': telefon_raqam,
      'onesignal_id': onesignal_id,
    };
  }

  // JSON dan obyektga o‘girish
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      telefon_raqam: json['telefon_raqam'],
      onesignal_id: json['onesignal_id'],
    );
  }
}
