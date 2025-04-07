import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:taxi/core/services/one_signal/onesignal_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _playerId;

  @override
  void initState() {
    super.initState();
    _fetchPlayerId();
  }

  /// OneSignal'dan Player ID ni olish
  Future<void> _fetchPlayerId() async {
    String? playerId = await OneSignalService().getPlayerId();
    setState(() {
      _playerId = playerId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      body: Center(
        child: _playerId == null
            ? const CircularProgressIndicator() // Ma'lumot yuklanayotganini bildiradi
            : Text("Player ID: $_playerId", style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
