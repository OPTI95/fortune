import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortune_app/cubit/fortune_cubit.dart';
import 'package:fortune_app/mainPage/page/main_page.dart';
import 'package:google_fonts/google_fonts.dart';

class PassedPage extends StatelessWidget {
  final int index;
  const PassedPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (contex, constraints) {
          return Stack(children: [
            index == 0
                ? ImageRouletteBackground(constraints: constraints)
                : (index == 1
                    ? ImageSlotBackground(
                        constraints: constraints,
                      )
                    : ImagePokiesBackground(constraints: constraints)),
            Padding(
              padding: const EdgeInsets.only(left: 50, bottom: 50),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(
                        flex: 2,
                      ),
                      index == 0
                          ? TextSpotRoulette(
                              constraints: constraints,
                            )
                          : (index == 1
                              ? TextSpotSlot(
                                  constraints: constraints,
                                )
                              : TextSpotPokies(constraints: constraints)),
                      SizedBox(
                        height: 32,
                      ),
                      Expanded(
                        flex: 5,
                          child: index == 0
                              ? ImageRoulette(
                                  constraints: constraints,
                                )
                              : (index == 1
                                  ? ImageSlot(
                                      constraints: constraints,
                                    )
                                  : ImagePokies(
                                      constraints: constraints,
                                    ))),
                      SizedBox(
                        height: 10,
                      ),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentGeometry.lerp(
                  Alignment.bottomCenter, Alignment.bottomRight, 0.75)!,
              child: Flexible(
                child: Image.asset(
                  "images/tigerV2.png",
                  width: constraints.maxWidth * 0.5,
                  height: constraints.maxHeight * 0.5,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    TextYouWin(
                      constraints: constraints,
                    ),
                    Text(
                      context.read<FortuneCubit>().win.toString(),
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700,
                          fontSize: constraints.maxHeight * 0.11,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    ButtonPlayAgain(
                      constraints: constraints,
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    ButtonMainMenu(
                      constraints: constraints,
                    ),
                    SizedBox(
                      height: 38,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Flexible(
                child: Image.asset(
                  "images/Win (2).png",
                  width: constraints.maxWidth * 0.2,
                  height: constraints.maxHeight * 0.6,
                ),
              ),
            )
          ]);
        },
      ),
    );
  }
}

class ButtonPlayAgain extends StatelessWidget {
  final BoxConstraints constraints;

  const ButtonPlayAgain({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constraints.maxHeight * 0.12,
      width: constraints.maxWidth * 0.25,
      child: ElevatedButton(
        onPressed: () {
          context.read<FortuneCubit>().win = 0;

          Navigator.pop(context);
        },
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
          "Play again",
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: constraints.maxHeight * 0.05,
          ),
        ),
      ),
    );
  }
}

class ImageSlot extends StatelessWidget {
  final BoxConstraints constraints;

  const ImageSlot({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "images/slot_full.png",
      width: constraints.maxWidth * 0.3,
    );
  }
}

class ImagePokies extends StatelessWidget {
  final BoxConstraints constraints;

  const ImagePokies({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "images/Pokies (1).png",
      width: constraints.maxWidth * 0.3,
    );
  }
}

class ImageRoulette extends StatelessWidget {
  final BoxConstraints constraints;
  const ImageRoulette({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "images/Roulette (1).png",
      width: constraints.maxWidth * 0.3,
    );
  }
}

class ButtonMainMenu extends StatelessWidget {
  final BoxConstraints constraints;

  const ButtonMainMenu({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constraints.maxHeight * 0.12,
      width: constraints.maxWidth * 0.25,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => MainPage()));
        },
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
          "Main menu",
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: constraints.maxHeight * 0.05,
          ),
        ),
      ),
    );
  }
}

class TextSpotSlot extends StatelessWidget {
  final BoxConstraints constraints;

  const TextSpotSlot({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Text(
        'SPOT SLOT',
        style: GoogleFonts.roboto(
            fontSize: constraints.maxHeight * 0.08,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 10
              ..color = const Color.fromRGBO(196, 199, 134, 1)),
      ),
      Text(
        'SPOT SLOT',
        style: GoogleFonts.roboto(
          fontSize: constraints.maxHeight * 0.08,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          color: const Color.fromRGBO(202, 34, 44, 1),
        ),
      ),
    ]);
  }
}

class TextYouWin extends StatelessWidget {
  final BoxConstraints constraints;

  const TextYouWin({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Text(
        'YOU WIN',
        style: GoogleFonts.roboto(
            fontSize: constraints.maxHeight * 0.08,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 10
              ..color = const Color.fromRGBO(196, 199, 134, 1)),
      ),
      Text(
        'YOU WIN',
        style: GoogleFonts.roboto(
          fontSize: constraints.maxHeight * 0.08,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          color: const Color.fromRGBO(202, 34, 44, 1),
        ),
      ),
    ]);
  }
}

class TextSpotPokies extends StatelessWidget {
  final BoxConstraints constraints;

  const TextSpotPokies({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Text(
        'SPOT POKIES',
        style: GoogleFonts.roboto(
            fontSize: constraints.maxHeight * 0.1,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 10
              ..color = const Color.fromRGBO(196, 199, 134, 1)),
      ),
      Text(
        'SPOT POKIES',
        style: GoogleFonts.roboto(
          fontSize: constraints.maxHeight * 0.1,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          color: const Color.fromRGBO(202, 34, 44, 1),
        ),
      ),
    ]);
  }
}

class TextSpotRoulette extends StatelessWidget {
  final BoxConstraints constraints;

  const TextSpotRoulette({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Stack(children: [
            Text(
              'SPOT',
              style: GoogleFonts.roboto(
                  fontSize: constraints.maxHeight * 0.1,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 10
                    ..color = const Color.fromRGBO(196, 199, 134, 1)),
            ),
            Text(
              'SPOT',
              style: GoogleFonts.roboto(
                fontSize: constraints.maxHeight * 0.1,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(202, 34, 44, 1),
              ),
            ),
          ]),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Stack(children: [
            Text(
              'ROULETTE',
              style: GoogleFonts.roboto(
                  fontSize: constraints.maxHeight * 0.1,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 10
                    ..color = const Color.fromRGBO(196, 199, 134, 1)),
            ),
            Text(
              'ROULETTE',
              style: GoogleFonts.roboto(
                fontSize: constraints.maxHeight * 0.1,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(202, 34, 44, 1),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}

class ImageSlotBackground extends StatelessWidget {
  final BoxConstraints constraints;

  const ImageSlotBackground({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "images/background_3.png",
      fit: BoxFit.cover,
      height: constraints.maxHeight,
      width: constraints.maxWidth,
    );
  }
}

class ImageRouletteBackground extends StatelessWidget {
  final BoxConstraints constraints;

  const ImageRouletteBackground({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "images/background_4.png",
      fit: BoxFit.cover,
      height: constraints.maxHeight,
      width: constraints.maxWidth,
    );
  }
}

class ImagePokiesBackground extends StatelessWidget {
  final BoxConstraints constraints;

  const ImagePokiesBackground({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "images/background_5.png",
      fit: BoxFit.cover,
      height: constraints.maxHeight,
      width: constraints.maxWidth,
    );
  }
}
