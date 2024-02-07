import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortune_app/cubit/fortune_cubit.dart';
import 'package:fortune_app/daily/page/daily_page.dart';
import 'package:fortune_app/mainPage/page/main_page.dart';
import 'package:fortune_app/passed/passed_page.dart';
import 'package:fortune_app/pause/page/pause_page.dart';
import 'package:fortune_app/play/page/roulette_play_page.dart';
import 'package:fortune_app/settings/page/settings_page.dart';
import 'package:fortune_app/spots/page/spots_page.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();

  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.landscapeLeft,
  //   DeviceOrientation.landscapeRight,
  // ]);
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => BlocProvider(
        create: (context) => FortuneCubit(),
        child: MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FortuneCubit>().loadBalanceFromPrefs();
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainPage());
  }
}
