import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class RandomNumberGeneratorScreen extends StatefulWidget {
  @override
  _RandomNumberGeneratorState createState() => _RandomNumberGeneratorState();
}

class _RandomNumberGeneratorState extends State<RandomNumberGeneratorScreen> {
  int _randomNumber = 0;
  String _inputValue = '';
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  late AndroidNotificationDetails androidPlatformChannelSpecifics;
  late NotificationDetails platformChannelSpecifics;

  Future<void> _showNotification(String title, String body) async {
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  void _generateRandomNumber() {
    final random = new Random();
    setState(() {
      _randomNumber = random.nextInt(100) + 1;
      if (_inputValue.isNotEmpty &&
          int.parse(_inputValue) < _randomNumber) {
        _showNotification('Notification', 'Random number is greater!');
      }
    });
  }

  void _handleInputChange(String value) {
    setState(() {
      _inputValue = value;
    });
  }

  Future<void> _initializeNotification() async {
    var initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        );
    androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'Channel_ID',
      'Channel_Name',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
    );
    platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        );
  }

  @override
  void initState() {
    super.initState();
    _initializeNotification();
    _generateRandomNumber();
    Timer.periodic(Duration(seconds: 10), (timer) {
      _generateRandomNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Number Generator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$_randomNumber',
            style: TextStyle(fontSize: 50),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              labelText: '数字を入力してください',
            ),
            onChanged: _handleInputChange,
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          Text(
            '入力された数字: $_inputValue',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
