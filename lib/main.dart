import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:fortune_app/mainPage/page/main_page.dart';
import 'package:fortune_app/passed/passed_page.dart';
import 'package:fortune_app/pause/page/pause_page.dart';
import 'package:fortune_app/spots/page/spots_page.dart';

void main() => runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => MainApp(),
      ),
    );

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SpotsPage()
    );
  }
}
