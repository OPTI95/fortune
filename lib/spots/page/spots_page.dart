import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:fortune_app/cubit/fortune_cubit.dart';
import 'package:fortune_app/play/page/roulette_play_page.dart';
import 'package:google_fonts/google_fonts.dart';

class SpotsPage extends StatefulWidget {
  SpotsPage({super.key});

  @override
  State<SpotsPage> createState() => _SpotsPageState();
}

class _SpotsPageState extends State<SpotsPage> {
  StreamController<int> selected = StreamController<int>();
  StreamController<int> selected2 = StreamController<int>();
  StreamController<int> selected3 = StreamController<int>();
  StreamController<int> selected4 = StreamController<int>();

  int currentSelectedIndex = 0;
  List<bool> itemSelected = List.generate(14, (index) => false);
  int index = 0;

  @override
  void dispose() {
    selected.close();
    super.dispose();
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
            BackButton(
              constraints: constraints,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  index == 0
                      ? TextSpotRoulette(
                          constraints: constraints,
                        )
                      : (index == 1
                          ? TextSpotSlot(
                              constraints: constraints,
                            )
                          : TextSpotPokies(constraints: constraints)),
                  Flexible(
                    flex: 3,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Spacer(),
                        GestureDetector(
                            child: IconButton(
                                iconSize: constraints.maxWidth * 0.06,
                                onPressed: () {
                                  if (index != 0) {
                                    index -= 1;
                                  }
                                  setState(() {});
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Color.fromRGBO(238, 33, 33, 1)),
                                    side: const MaterialStatePropertyAll(
                                      BorderSide(
                                        width: 7,
                                        color: Color.fromRGBO(190, 23, 23, 1),
                                      ),
                                    ),
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    )),
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ))),
                        const SizedBox(
                          width: 50,
                        ),
                        Flexible(
                            flex: 2,
                            child: index == 0
                                ? ImageRoulette()
                                : (index == 1 ? ImageSlot() : ImagePokies())),
                        SizedBox(
                          width: 50,
                        ),
                        GestureDetector(
                            child: IconButton(
                                iconSize: constraints.maxWidth * 0.06,
                                onPressed: () {
                                  if (index != 3) {
                                    index += 1;
                                  }
                                  setState(() {});
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Color.fromRGBO(238, 33, 33, 1)),
                                    side: const MaterialStatePropertyAll(
                                      BorderSide(
                                        width: 7,
                                        color: Color.fromRGBO(190, 23, 23, 1),
                                      ),
                                    ),
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    )),
                                icon: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ))),
                        const Spacer(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  ButtonPlay(
                    constraints: constraints,
                    index: index,
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}

class ImageSlot extends StatelessWidget {
  const ImageSlot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "images/slot_full.png",
    );
  }
}

class ImagePokies extends StatelessWidget {
  const ImagePokies({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "images/Pokies (1).png",
    );
  }
}

class ImageRoulette extends StatelessWidget {
  const ImageRoulette({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "images/Roulette (1).png",
    );
  }
}

class ButtonPlay extends StatefulWidget {
  final int index;
  final BoxConstraints constraints;

  const ButtonPlay({
    super.key,
    required this.constraints,
    required this.index,
  });

  @override
  State<ButtonPlay> createState() => _ButtonPlayState();
}

class _ButtonPlayState extends State<ButtonPlay> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
          height: widget.constraints.maxHeight * 0.15,
          width: widget.constraints.maxWidth * 0.25,
          child: ElevatedButton(
              onPressed: () async {
                context.read<FortuneCubit>().win = 0;

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => RoulettePlayPage(index: widget.index)));
                // if(index == 1){
                //   Navigator.push(context, MaterialPageRoute(builder: (_)=>Container()));
                // }
                // Future.microtask(() {
                //   setState(() {
                //     widget.itemSelected[widget.currentSelectedIndex] = false;
                //   });
                // });
              },
              style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(
                      Color.fromRGBO(38, 121, 228, 1)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
                  side: const MaterialStatePropertyAll(BorderSide(
                      width: 7, color: Color.fromRGBO(24, 64, 134, 1)))),
              child: Text(
                "Play",
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: widget.constraints.maxHeight * 0.07),
              ))),
    );
  }
}

class BackButton extends StatelessWidget {
  final BoxConstraints constraints;

  const BackButton({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 35),
      child: IconButton(
          iconSize: constraints.maxWidth * 0.06,
          onPressed: () {
            Navigator.pop(context);
          },
          style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(
                  Color.fromRGBO(38, 121, 228, 1)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
              side: const MaterialStatePropertyAll(
                  BorderSide(width: 7, color: Color.fromRGBO(24, 64, 134, 1)))),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),
    ));
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
            fontSize: constraints.maxHeight * 0.09,
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
          fontSize: constraints.maxHeight * 0.09,
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
            fontSize: constraints.maxHeight * 0.09,
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
          fontSize: constraints.maxHeight * 0.09,
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
                  fontSize: constraints.maxHeight * 0.09,
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
                fontSize: constraints.maxHeight * 0.09,
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
                  fontSize: constraints.maxHeight * 0.09,
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
                fontSize: constraints.maxHeight * 0.09,
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

class ImageBackground extends StatelessWidget {
  final BoxConstraints constraints;

  const ImageBackground({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "images/background_spots.png",
      fit: BoxFit.cover,
      height: constraints.maxHeight,
      width: constraints.maxWidth,
    );
  }
}
