import 'package:flutter/services.dart';

class BatteryChannel {
  final MethodChannel _channel = const MethodChannel('my_app/method/battery');

  Future<int?> getBatteryLevel() async {
    return await _channel.invokeMethod<int>('getNativeBatteryLevel');
  }
}
