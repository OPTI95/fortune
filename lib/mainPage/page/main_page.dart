import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortune_app/cubit/fortune_cubit.dart';
import 'package:fortune_app/daily/page/daily_page.dart';
import 'package:fortune_app/settings/page/settings_page.dart';
import 'package:fortune_app/spots/page/spots_page.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isOpen = false;
  @override
  void initState() {
    final time = context.read<FortuneCubit>().expiryTime;
    if (time != null && time.isAfter(DateTime.now())) {
      isOpen = true;
    } else {
      isOpen = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (contex, constraints) {
        return Stack(
          children: [
            ImageBackground(
              constraints: constraints,
            ),
            ImageTiger(
              constraints: constraints,
            ),
            ButtonsVolumeAndSetting(
              constraints: constraints,
            ),
            TextAndButtonExitAndSpots(
              constraints: constraints,
            ),
            DailyRewardWidgets(
              isOpen: isOpen,
              constraints: constraints,
            )
          ],
        );
      }),
    );
  }
}

class DailyRewardWidgets extends StatelessWidget {
  final bool isOpen;
  final BoxConstraints constraints;

  const DailyRewardWidgets({
    super.key,
    required this.constraints,
    required this.isOpen,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            isOpen
                ? ImageOpenDaily(
                    constraints: constraints,
                  )
                : ImageCloseDaily(
                    constraints: constraints,
                  ),
            TextDailyReward(
              constraints: constraints,
            ),
            //TextDailyRewardOpened(constraints: constraints),
            TextDailyRewardIsReady(
              constraints: constraints,
            ),
            const SizedBox(
              height: 24,
            ),
            ButtonOpenReward(
              constraints: constraints,
            )
          ],
        ));
  }
}

class TextAndButtonExitAndSpots extends StatelessWidget {
  final BoxConstraints constraints;

  const TextAndButtonExitAndSpots({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        TigerFortuneText(
          constraints: constraints,
        ),
        const Spacer(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SpotsButton(
                constraints: constraints,
              ),
              const SizedBox(
                height: 8,
              ),
              ExitButton(constraints: constraints)
            ],
          ),
        ),
      ],
    );
  }
}

class ButtonsVolumeAndSetting extends StatelessWidget {
  final BoxConstraints constraints;

  const ButtonsVolumeAndSetting({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, bottom: 20),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Row(
          children: [
            VolumeButton(
              constraints: constraints,
            ),
            const SizedBox(
              width: 8,
            ),
            SettingButton(
              constraints: constraints,
            ),
          ],
        ),
      ),
    );
  }
}

class ImageTiger extends StatelessWidget {
  final BoxConstraints constraints;

  const ImageTiger({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Image.asset(
        "images/tiger.png",
        width: constraints.maxWidth * 0.5,
        height: constraints.maxHeight * 0.7,
      ),
    );
  }
}

class ImageBackground extends StatelessWidget {
  final BoxConstraints constraints;

  const ImageBackground({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "images/background.png",
      fit: BoxFit.cover,
      height: constraints.maxHeight,
      width: constraints.maxWidth,
    );
  }
}

class TextDailyRewardOpened extends StatelessWidget {
  final BoxConstraints constraints;

  const TextDailyRewardOpened({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your can open daily',
          style: GoogleFonts.ubuntu(
            fontSize: constraints.maxHeight * 0.04,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'reward in ',
              style: GoogleFonts.ubuntu(
                fontSize: constraints.maxHeight * 0.04,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Text(
              '23:59:59',
              style: GoogleFonts.ubuntu(
                fontSize: constraints.maxHeight * 0.04,
                fontWeight: FontWeight.w800,
                color: const Color.fromRGBO(38, 121, 228, 1),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ImageOpenDaily extends StatelessWidget {
  final BoxConstraints constraints;

  const ImageOpenDaily({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "images/daily_open.png",
      width: constraints.maxWidth * 0.3,
      height: constraints.maxHeight * 0.45,
    );
  }
}

class ButtonOpenReward extends StatelessWidget {
  final BoxConstraints constraints;

  const ButtonOpenReward({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: constraints.maxHeight * 0.13,
        width: constraints.maxWidth * 0.22,
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => DailyPage()));
            },
            style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(
                    Color.fromRGBO(38, 121, 228, 1)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
                side: const MaterialStatePropertyAll(BorderSide(
                    width: 5, color: Color.fromRGBO(24, 64, 134, 1)))),
            child: Text(
              "Open reward",
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: constraints.maxHeight * 0.045),
            )));
  }
}

class TextDailyRewardIsReady extends StatelessWidget {
  final BoxConstraints constraints;

  const TextDailyRewardIsReady({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your daily reward is',
          style: GoogleFonts.ubuntu(
            fontSize: constraints.maxHeight * 0.04,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        Text(
          'ready.',
          style: GoogleFonts.ubuntu(
            fontSize: constraints.maxHeight * 0.04,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class TextDailyReward extends StatelessWidget {
  final BoxConstraints constraints;

  const TextDailyReward({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Stack(children: [
        Text(
          'DAILY REWARD',
          style: GoogleFonts.roboto(
              fontSize: constraints.maxHeight * 0.05,
              fontStyle: FontStyle.italic,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 10
                ..color = const Color.fromRGBO(196, 199, 134, 1)),
        ),
        Text(
          'DAILY REWARD',
          style: GoogleFonts.roboto(
            fontSize: constraints.maxHeight * 0.05,
            fontStyle: FontStyle.italic,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
            color: const Color.fromRGBO(202, 34, 44, 1),
          ),
        ),
      ]),
    );
  }
}

class ImageCloseDaily extends StatelessWidget {
  final BoxConstraints constraints;

  const ImageCloseDaily({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "images/daily.png",
      width: constraints.maxWidth * 0.3,
      height: constraints.maxHeight * 0.45,
    );
  }
}

class TigerFortuneText extends StatelessWidget {
  final BoxConstraints constraints;
  const TigerFortuneText({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(children: [
          Text(
            'TIGER',
            style: GoogleFonts.roboto(
                fontSize: constraints.maxHeight * 0.12,
                fontStyle: FontStyle.italic,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 10
                  ..color = const Color.fromRGBO(196, 199, 134, 1)),
          ),
          Text(
            'TIGER',
            style: GoogleFonts.roboto(
              fontSize: constraints.maxHeight * 0.12,
              fontStyle: FontStyle.italic,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              color: const Color.fromRGBO(202, 34, 44, 1),
            ),
          ),
        ]),
        Stack(children: [
          Text(
            'FORTUNE',
            style: GoogleFonts.roboto(
                fontSize: constraints.maxHeight * 0.12,
                fontStyle: FontStyle.italic,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 10
                  ..color = const Color.fromRGBO(196, 199, 134, 1)),
          ),
          Text(
            'FORTUNE',
            style: GoogleFonts.roboto(
              fontSize: constraints.maxHeight * 0.12,
              fontStyle: FontStyle.italic,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              color: const Color.fromRGBO(202, 34, 44, 1),
            ),
          ),
        ]),
      ],
    );
  }
}

class ExitButton extends StatelessWidget {
  final BoxConstraints constraints;
  const ExitButton({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: constraints.maxHeight * 0.15,
        width: constraints.maxWidth * 0.25,
        child: ElevatedButton(
            onPressed: () {
              exit(0);
            },
            style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(
                    Color.fromRGBO(238, 33, 33, 1)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
                side: const MaterialStatePropertyAll(BorderSide(
                    width: 5, color: Color.fromRGBO(190, 23, 23, 1)))),
            child: Text(
              "Exit",
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: constraints.maxHeight * 0.07),
            )));
  }
}

class SpotsButton extends StatelessWidget {
  final BoxConstraints constraints;

  const SpotsButton({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: constraints.maxHeight * 0.15,
        width: constraints.maxWidth * 0.25,
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SpotsPage()));
            },
            style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(
                    Color.fromRGBO(238, 33, 33, 1)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
                side: const MaterialStatePropertyAll(BorderSide(
                    width: 5, color: Color.fromRGBO(190, 23, 23, 1)))),
            child: Text(
              "Spots",
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: constraints.maxHeight * 0.07),
            )));
  }
}

class VolumeButton extends StatelessWidget {
  final BoxConstraints constraints;

  const VolumeButton({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: constraints.maxHeight * 0.12,
        width: constraints.maxWidth * 0.1,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(238, 33, 33, 1),
            border: Border.all(
              width: 5,
              color: const Color.fromRGBO(190, 23, 23, 1),
            ),
            borderRadius: BorderRadius.circular(20)),
        child: const Padding(
          padding: EdgeInsets.all(7.0),
          child: ImageIcon(
            AssetImage("images/volume.png"),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class SettingButton extends StatelessWidget {
  final BoxConstraints constraints;

  const SettingButton({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => SettingsPage()));
      },
      child: Container(
        height: constraints.maxHeight * 0.12,
        width: constraints.maxWidth * 0.1,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(238, 33, 33, 1),
            border: Border.all(
              width: 5,
              color: const Color.fromRGBO(190, 23, 23, 1),
            ),
            borderRadius: BorderRadius.circular(20)),
        child: const Padding(
          padding: EdgeInsets.all(7.0),
          child: ImageIcon(
            AssetImage("images/setting.png"),
            size: 100,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
