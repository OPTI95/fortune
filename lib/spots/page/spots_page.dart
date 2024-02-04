import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
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

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (contex, constraints) {
        List<Widget> items = [
          Text(
            "100",
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          Image.asset(
            "images/gift_1.png",
            height: constraints.maxHeight * 0.1,
            width: constraints.maxWidth * 0.2,
          ),
          Text(
            "50",
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          Image.asset(
            "images/gift_2.png",
            height: constraints.maxHeight * 0.1,
            width: constraints.maxWidth * 0.2,
          ),
          Text(
            "0",
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          Image.asset(
            "images/gift_3.png",
            height: constraints.maxHeight * 0.1,
            width: constraints.maxWidth * 0.2,
          ),
          Text(
            "20",
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          Image.asset(
            "images/gift_4.png",
            height: constraints.maxHeight * 0.1,
            width: constraints.maxWidth * 0.2,
          ),
          Text(
            "0",
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          Text(
            "10000",
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          Text(
            "20",
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          Image.asset(
            "images/gift_1.png",
            height: constraints.maxHeight * 0.1,
            width: constraints.maxWidth * 0.2,
          ),
          Text(
            "0",
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          Image.asset(
            "images/gift_2.png",
            height: constraints.maxHeight * 0.1,
            width: constraints.maxWidth * 0.2,
          ),
        ];
        return Stack(
          children: [
            ImageBackground(
              constraints: constraints,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 35),
              child: BackButton(
                constraints: constraints,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextSpotPokies(
                    constraints: constraints,
                  ),
                  Flexible(
                    flex: 3,
                    child: Row(
                      children: [
                        // Spacer(),
                        // PrevButton(constraints: constraints),
                        // SizedBox(
                        //   width: 50,
                        // ),
                        Flexible(
                            flex: 2,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Transform.rotate(
                                  angle: 90 *
                                      (pi / 180), // Convert degrees to radians
                            
                                  child: Flexible(
                                      child: FortuneBar(
                                    selected: selected.stream,
                                    visibleItemCount: 5,
                                    height: 200,
                                    items: [
                                      for (int index = 0; index < 5; index++)
                                        FortuneItem(
                                          child: items[index],
                                          style: FortuneItemStyle(
                                            color: itemSelected[index]
                                                ? Color.fromRGBO(
                                                    228, 232, 159, 1)
                                                : Color.fromRGBO(
                                                    210, 198, 153, 1),
                                          ),
                                        ),
                                    ],
                                  )),
                                ),
                                Transform.rotate(
                                  angle: 90 *
                                      (pi / 180), // Convert degrees to radians
                            
                                  child: Flexible(
                                      child: FortuneBar(
                                    selected: selected.stream,
                                    visibleItemCount: 5,
                                    height: 200,
                                    items: [
                                      for (int index = 0; index < 5; index++)
                                        FortuneItem(
                                          child: items[index],
                                          style: FortuneItemStyle(
                                            color: itemSelected[index]
                                                ? Color.fromRGBO(
                                                    228, 232, 159, 1)
                                                : Color.fromRGBO(
                                                    210, 198, 153, 1),
                                          ),
                                        ),
                                    ],
                                  )),
                                ),
                                // Flexible(
                                //     child: FortuneBar(
                                //   selected: selected2.stream,
                                //   visibleItemCount: 5,
                                //   height: 200,
                                //   items: [
                                //     for (int index = 4; index < 9; index++)
                                //       FortuneItem(
                                //         child: items[index],
                                //         style: FortuneItemStyle(
                                //           color: itemSelected[index]
                                //               ? Color.fromRGBO(228, 232, 159, 1)
                                //               : Color.fromRGBO(
                                //                   210, 198, 153, 1),
                                //         ),
                                //       ),
                                //   ],
                                // )),
                                // Flexible(
                                //     fit: FlexFit.tight,
                                //     child: FortuneBar(
                                //       selected: selected3.stream,
                                //       visibleItemCount: 5,
                                //       height: 200,
                                //       items: [
                                //         for (int index = 4; index < 9; index++)
                                //           FortuneItem(
                                //             child: items[index],
                                //             style: FortuneItemStyle(
                                //               color: itemSelected[index]
                                //                   ? Color.fromRGBO(
                                //                       228, 232, 159, 1)
                                //                   : Color.fromRGBO(
                                //                       210, 198, 153, 1),
                                //             ),
                                //           ),
                                //       ],
                                //     )),
                                // Spacer(),
                            
                                // Expanded(
                                //     child: FortuneBar(
                                //   selected: selected2.stream,
                                //   visibleItemCount: 3,
                                //   height: 250,
                                //   physics: DirectionalPanPhysics.horizontal(),
                                //   items: [
                                //     for (int index = 0;
                                //         index < items.length;
                                //         index++)
                                //       FortuneItem(
                                //         child: items[index],
                                //         style: FortuneItemStyle(
                                //           color: itemSelected[index]
                                //               ? Color.fromRGBO(228, 232, 159, 1)
                                //               : Color.fromRGBO(
                                //                   210, 198, 153, 1),
                                //         ),
                                //       ),
                                //   ],
                                // )),
                                // Expanded(
                                //     child: FortuneBar(
                                //   selected: selected3.stream,
                                //   visibleItemCount: 3,
                                //   height: 250,
                                //   physics: DirectionalPanPhysics.horizontal(),
                                //   items: [
                                //     for (int index = 0;
                                //         index < items.length;
                                //         index++)
                                //       FortuneItem(
                                //         child: items[index],
                                //         style: FortuneItemStyle(
                                //           color: itemSelected[index]
                                //               ? Color.fromRGBO(228, 232, 159, 1)
                                //               : Color.fromRGBO(
                                //                   210, 198, 153, 1),
                                //         ),
                                //       ),
                                //   ],
                                // )),
                              ],
                            )),
                        // child: RouletteWidget(
                        //     itemSelected: itemSelected,
                        //     constraints: constraints,
                        //     items: items,
                        //     selected: selected,
                        //     currentSelectedIndex: currentSelectedIndex)),
                        // SizedBox(
                        //   width: 50,
                        // ),
                        // NextButton(constraints: constraints),
                        // Spacer(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  ButtonPlay(
                    constraints: constraints,
                    itemSelected: itemSelected,
                    items: items,
                    selected: selected,
                    currentSelectedIndex: currentSelectedIndex,
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}

class RouletteWidget extends StatefulWidget {
  final List<bool> itemSelected;
  final BoxConstraints constraints;
  final List<Widget> items;
  final StreamController<int> selected;
  int currentSelectedIndex;
  RouletteWidget(
      {super.key,
      required this.itemSelected,
      required this.constraints,
      required this.items,
      required this.selected,
      required this.currentSelectedIndex});

  @override
  State<RouletteWidget> createState() => _RouletteWidgetState();
}

class _RouletteWidgetState extends State<RouletteWidget> {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 90 * (pi / 180), // Convert degrees to radians
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border:
                Border.all(width: 5, color: Color.fromRGBO(190, 23, 23, 1))),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border:
                Border.all(width: 15, color: Color.fromRGBO(238, 33, 33, 1)),
          ),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    width: 5, color: Color.fromRGBO(190, 23, 23, 1))),
            child: FortuneWheel(
              indicators: [
                FortuneIndicator(
                  child: Transform.rotate(
                    angle: 265 * (pi / 180),
                    child: Image.asset(
                      "images/center.png",
                      height: widget.constraints.maxHeight * 0.1,
                      width: widget.constraints.maxWidth * 0.1,
                      alignment: Alignment.center,
                    ),
                    alignment: Alignment.center,
                  ),
                )
              ],
              animateFirst: false,
              selected: widget.selected.stream,
              items: [
                for (int index = 0; index < widget.items.length; index++)
                  FortuneItem(
                    child: widget.items[index],
                    style: FortuneItemStyle(
                      color: widget.itemSelected[index]
                          ? Color.fromRGBO(228, 232, 159, 1)
                          : Color.fromRGBO(210, 198, 153, 1),
                    ),
                  ),
              ],
              onAnimationStart: () {
                Future.microtask(() {
                  setState(() {
                    widget.itemSelected[widget.currentSelectedIndex] = false;
                  });
                });
              },
              onFocusItemChanged: (index) {
                widget.currentSelectedIndex = index;
              },
              onAnimationEnd: () {
                Future.microtask(() {
                  setState(() {
                    widget.itemSelected[widget.currentSelectedIndex] = true;
                  });
                });
                print(
                    'Selected Item: ${widget.currentSelectedIndex.toString()}');
              },
            ),
          ),
        ),
      ),
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
      "images/slot.png",
    );
  }
}

class ImagePokies extends StatelessWidget {
  const ImagePokies({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "images/pokies.png",
    );
  }
}

class ImageRoulette extends StatelessWidget {
  const ImageRoulette({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "images/roulette.png",
    );
  }
}

class ButtonPlay extends StatefulWidget {
  final List<bool> itemSelected;
  final BoxConstraints constraints;
  final List<Widget> items;
  final StreamController<int> selected;
  final int currentSelectedIndex;

  const ButtonPlay({
    super.key,
    required this.constraints,
    required this.itemSelected,
    required this.items,
    required this.selected,
    required this.currentSelectedIndex,
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
                Future.microtask(() {
                  setState(() {
                    widget.itemSelected[widget.currentSelectedIndex] = false;
                  });
                });
                widget.selected.add(Fortune.randomInt(0, widget.items.length));
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
        child: IconButton(
            iconSize: constraints.maxWidth * 0.06,
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(
                    Color.fromRGBO(38, 121, 228, 1)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
                side: const MaterialStatePropertyAll(BorderSide(
                    width: 7, color: Color.fromRGBO(24, 64, 134, 1)))),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )));
  }
}

class PrevButton extends StatelessWidget {
  final BoxConstraints constraints;

  const PrevButton({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: constraints.maxWidth * 0.06,
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor:
                const MaterialStatePropertyAll(Color.fromRGBO(238, 33, 33, 1)),
            side: const MaterialStatePropertyAll(
              BorderSide(
                width: 7,
                color: Color.fromRGBO(190, 23, 23, 1),
              ),
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            )),
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ));
  }
}

class NextButton extends StatelessWidget {
  final BoxConstraints constraints;

  const NextButton({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: constraints.maxWidth * 0.06,
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor:
                const MaterialStatePropertyAll(Color.fromRGBO(238, 33, 33, 1)),
            side: const MaterialStatePropertyAll(
              BorderSide(
                width: 7,
                color: Color.fromRGBO(190, 23, 23, 1),
              ),
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            )),
        icon: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
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
