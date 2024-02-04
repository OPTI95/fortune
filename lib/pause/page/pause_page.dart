import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fortune_app/mainPage/page/main_page.dart';
import 'package:google_fonts/google_fonts.dart';

class PausePage extends StatefulWidget {
  const PausePage({super.key});

  @override
  State<PausePage> createState() => _PausePageState();
}

class _PausePageState extends State<PausePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(83, 31, 31, 1),
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            ButtonsVolumeAndSetting(
              constraints: constraints,
            ),
           
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: TextSpotPokies(
                        constraints: constraints,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Spacer(),
                    ButtonContinue(constraints: constraints,),
                    const SizedBox(height: 12),
                    ButtonToMain(constraints: constraints,),
                    const SizedBox(height: 12),
                    ButtonExit(constraints: constraints,),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class ButtonExit extends StatelessWidget {
  final BoxConstraints constraints;

  const ButtonExit({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constraints.maxHeight * 0.12,
      width: constraints.maxWidth * 0.25,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color.fromRGBO(238, 33, 33, 1),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          side: MaterialStateProperty.all(
            const BorderSide(
              width: 5,
              color: Color.fromRGBO(190, 23, 23, 1),
            ),
          ),
        ),
        child: Text(
          "Exit",
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: constraints.maxHeight * 0.07,
          ),
        ),
      ),
    );
  }
}

class ButtonToMain extends StatelessWidget {
  final BoxConstraints constraints;

  const ButtonToMain({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constraints.maxHeight * 0.12,
      width: constraints.maxWidth * 0.25,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color.fromRGBO(238, 33, 33, 1),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          side: MaterialStateProperty.all(
            const BorderSide(
              width: 5,
              color: Color.fromRGBO(190, 23, 23, 1),
            ),
          ),
        ),
        child: Text(
          "To main",
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: constraints.maxHeight * 0.07,
          ),
        ),
      ),
    );
  }
}

class ButtonContinue extends StatelessWidget {
  final BoxConstraints constraints;

  const ButtonContinue({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constraints.maxHeight * 0.12,
      width: constraints.maxWidth * 0.25,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color.fromRGBO(238, 33, 33, 1),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          side: MaterialStateProperty.all(
            const BorderSide(
              width: 5,
              color: Color.fromRGBO(190, 23, 23, 1),
            ),
          ),
        ),
        child: Text(
          "Continue",
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: constraints.maxHeight * 0.07,
          ),
        ),
      ),
    );
  }
}

class TextSpotPokies extends StatelessWidget {
  final BoxConstraints constraints;

  const TextSpotPokies({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Text(
        'PAUSE',
        style: GoogleFonts.roboto(
            fontSize: constraints.maxHeight * 0.09,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 10
              ..color = const Color.fromRGBO(196, 199, 134, 1)),
      ),
      Text(
        'PAUSE',
        style: GoogleFonts.roboto(
          fontSize: constraints.maxHeight * 0.09,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          color: const Color.fromRGBO(202, 34, 44, 1),
        ),
      ),
    ]);
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
    return Flexible(
      child: IconButton(
          iconSize: constraints.maxWidth * 0.05,
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(
                  Color.fromRGBO(238, 33, 33, 1)),
              side: const MaterialStatePropertyAll(
                BorderSide(
                  width: 7,
                  color: Color.fromRGBO(190, 23, 23, 1),
                ),
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              )),
          icon: const Padding(
            padding: EdgeInsets.all(8.0),
            child: ImageIcon(
              AssetImage("images/volume.png"),
              color: Colors.white,
            ),
          )),
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
    return Flexible(
      child: IconButton(
          iconSize: constraints.maxWidth * 0.05,
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(
                  Color.fromRGBO(238, 33, 33, 1)),
              side: const MaterialStatePropertyAll(
                BorderSide(
                  width: 7,
                  color: Color.fromRGBO(190, 23, 23, 1),
                ),
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              )),
          icon: const Padding(
            padding: EdgeInsets.all(8.0),
            child: ImageIcon(
              AssetImage("images/setting.png"),
              color: Colors.white,
            ),
          )),
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
