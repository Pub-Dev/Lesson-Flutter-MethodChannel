import 'package:flutter/material.dart';

import '../channels/battery_channel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BatteryChannel _channel = BatteryChannel();

  String batteryLevelLabel = 'Battery is not started';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(batteryLevelLabel),
            TextButton(
              onPressed: _getBatteryLevelString,
              child: const Text('Update Battery!!'),
            ),
          ],
        ),
      ),
    );
  }

  void _getBatteryLevelString() async {
    final batteryLevel = await _channel.getBatteryLevel();

    setState(() {
      batteryLevelLabel = 'Battery is $batteryLevel%';
    });
  }
}
