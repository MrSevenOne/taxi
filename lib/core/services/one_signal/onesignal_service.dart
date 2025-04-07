import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalService {
  static final OneSignalService _instance = OneSignalService._internal();
  factory OneSignalService() => _instance;
  OneSignalService._internal();

  /// OneSignalni boshlash
  Future<void> initOneSignal() async {
    await OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

    OneSignal.initialize("890c58b1-94d3-4456-bda7-7f58a27bcb12"); // OneSignal App ID
    await OneSignal.Notifications.requestPermission(true);

    // Notifikatsiya bosilganda ishlaydi
    OneSignal.Notifications.addClickListener((event) {
      print("NOTIFICATION CLICKED: ${event.notification}");
    });

    // Subscription o'zgarishlarini kuzatish
    OneSignal.User.pushSubscription.addObserver((state) {
      print("Push Subscription Changed: ${state.current.id}");
    });
  }

  /// Foydalanuvchi uchun OneSignal Player ID ni olish
  Future<String?> getPlayerId() async {
    return OneSignal.User.pushSubscription.id;
  }
}
