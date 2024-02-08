import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:fortune_app/cubit/fortune_cubit.dart';
import 'package:fortune_app/passed/passed_page.dart';
import 'package:fortune_app/pause/page/pause_page.dart';
import 'package:google_fonts/google_fonts.dart';

class RoulettePlayPage extends StatefulWidget {
  final int index;
  const RoulettePlayPage({super.key, required this.index});

  @override
  State<RoulettePlayPage> createState() => _RoulettePlayPageState();
}

class _RoulettePlayPageState extends State<RoulettePlayPage> {
  Map<int, Image> images = {
    1: Image.asset('images/gift_1.png'),
    2: Image.asset('images/gift_2.png'),
    3: Image.asset('images/gift_3.png'),
    4: Image.asset('images/gift_4.png'),
  };
  List<List<int>> shuffledImagesList = [];
  List<List<int>> shuffledImagesList2 = [];

  @override
  void initState() {
    super.initState();
    shuffledImagesList = List.generate(4, (index) => [1, 2, 3, 4]);
    shuffledImagesList2 = List.generate(3, (index) => [1, 2, 3, 4]);

    context.read<FortuneCubit>().win = 0;
  }

  void shuffleImages() {
    setState(() {
      shuffledImagesList.forEach((list) => list.shuffle());
    });
  }

  void shuffleImages2() {
    setState(() {
      shuffledImagesList2.forEach((list) => list.shuffle());
    });
  }

  StreamController<int> selected = StreamController<int>();
  List<List<int>> imageIndexes = [
    [1, 2, 3, 4],
    [1, 2, 3, 4],
    [1, 1, 3, 4],
    [1, 2, 3, 4],
  ];
  List<List<int>> imageIndexes2 = [
    [4, 2, 3],
    [1, 2, 3],
    [3, 4, 1],
  ];
  int currentSelectedIndex = 0;
  List<bool> itemSelected = List.generate(14, (index) => false);

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  int summa = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (contex, constraints) {
      List<Widget> items = [
        Text(
          "100",
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700,
              fontSize: constraints.maxHeight * 0.04),
        ),
        Image.asset(
          "images/gift_1.png",
          height: constraints.maxHeight * 0.1,
          width: constraints.maxWidth * 0.2,
        ),
        Text(
          "50",
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700,
              fontSize: constraints.maxHeight * 0.04),
        ),
        Image.asset(
          "images/gift_2.png",
          height: constraints.maxHeight * 0.1,
          width: constraints.maxWidth * 0.2,
        ),
        Text(
          "0",
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700,
              fontSize: constraints.maxHeight * 0.04),
        ),
        Image.asset(
          "images/gift_3.png",
          height: constraints.maxHeight * 0.1,
          width: constraints.maxWidth * 0.2,
        ),
        Text(
          "20",
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700,
              fontSize: constraints.maxHeight * 0.04),
        ),
        Image.asset(
          "images/gift_4.png",
          height: constraints.maxHeight * 0.1,
          width: constraints.maxWidth * 0.2,
        ),
        Text(
          "0",
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700,
              fontSize: constraints.maxHeight * 0.04),
        ),
        Text(
          "10000",
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700,
              fontSize: constraints.maxHeight * 0.04),
        ),
        Text(
          "20",
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700,
              fontSize: constraints.maxHeight * 0.04),
        ),
        Image.asset(
          "images/gift_1.png",
          height: constraints.maxHeight * 0.1,
          width: constraints.maxWidth * 0.2,
        ),
        Text(
          "0",
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700,
              fontSize: constraints.maxHeight * 0.04),
        ),
        Image.asset(
          "images/gift_2.png",
          height: constraints.maxHeight * 0.1,
          width: constraints.maxWidth * 0.2,
        ),
      ];
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.index == 0
                    ? "images/background_4.png"
                    : (widget.index == 1
                        ? "images/background_3.png"
                        : "images/background_5.png")),
                fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Flexible(
                  flex: 1,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Image.asset("images/win_1.png"),
                      Padding(
                        padding:
                            EdgeInsets.only(top: constraints.maxWidth * 0.095),
                        child: Text(
                          context.read<FortuneCubit>().win.toString(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: constraints.maxWidth * 0.03,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  )),
              Flexible(
                  flex: 2,
                  child: widget.index == 0
                      ? RouletteWidget(
                          constraints: constraints,
                          itemSelected: itemSelected,
                          selected: selected,
                          items: items,
                          currentSelectedIndex: currentSelectedIndex)
                      : (widget.index == 1
                          ? PokiesWidget(
                              shuffledImagesList: shuffledImagesList,
                              images: images,
                              constraints: constraints,
                            )
                          // ImageGrid(
                          //     constraints: constraints,
                          //     imageIndexes: imageIndexes,
                          //   )
                          : SpotWidget(
                              shuffledImagesList: shuffledImagesList2,
                              images: images,
                              constraints: constraints,
                            ))),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Flexible(
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => PausePage()));
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          Color.fromRGBO(38, 121, 228, 1)),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16))),
                                  side: const MaterialStatePropertyAll(
                                      BorderSide(
                                          width: 7,
                                          color:
                                              Color.fromRGBO(24, 64, 134, 1)))),
                              icon: Icon(Icons.dehaze,
                                  size: constraints.maxHeight * 0.05,
                                  color: Colors.white))),
                    ),
                    Spacer(),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.asset("images/balance.png"),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: BlocConsumer<FortuneCubit, FortuneState>(
                            listener: (context, state) {
                              if (state is FortuneLoaded) {
                                setState(() {});
                              }
                            },
                            builder: (context, state) {
                              return Text(
                                context.read<FortuneCubit>().balance.toString(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: constraints.maxWidth * 0.03,
                                    fontWeight: FontWeight.w400),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: SizedBox(
                              child: ElevatedButton(
                                  onPressed: () async {
                                    if (summa != 10) {
                                      summa -= 10;
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              content: Text(
                                                "Ваша ставка: ${summa}",
                                                style: TextStyle(fontSize: 32),
                                              )));
                                    }
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              Color.fromRGBO(238, 33, 33, 1)),
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16))),
                                      side: const MaterialStatePropertyAll(
                                          BorderSide(
                                              width: 7,
                                              color: Color.fromRGBO(
                                                  190, 23, 23, 1)))),
                                  child: Text(
                                    "-",
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: constraints.maxHeight * 0.07),
                                  ))),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Flexible(
                          child: SizedBox(
                            child: ElevatedButton(
                              onPressed: () async {
                                int bal = context.read<FortuneCubit>().balance;
                                if (bal > summa) {
                                  summa += 10;
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          duration: Duration(milliseconds: 500),
                                          content: Text(
                                            "Ваша ставка: ${summa}",
                                            style: TextStyle(fontSize: 32),
                                          )));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          duration: Duration(milliseconds: 500),
                                          content: Text(
                                            "Это ваша максимальная ставка!",
                                            style: TextStyle(fontSize: 32),
                                          )));
                                }
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          Color.fromRGBO(238, 33, 33, 1)),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16))),
                                  side: const MaterialStatePropertyAll(
                                      BorderSide(
                                          width: 7,
                                          color:
                                              Color.fromRGBO(190, 23, 23, 1)))),
                              child: Text(
                                "+",
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: constraints.maxHeight * 0.065),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    SizedBox(
                        height: constraints.maxHeight * 0.15,
                        width: constraints.maxWidth * 0.25,
                        child: ElevatedButton(
                            onPressed: () async {
                              context.read<FortuneCubit>().removeBalance(summa);
                              if (widget.index == 0) {
                                selected
                                    .add(Fortune.randomInt(0, items.length));
                              } else if (widget.index == 1) {
                                setState(() {
                                  shuffleImages();
                                  shuffledImagesList.forEach((row) {
                                    context
                                        .read<FortuneCubit>()
                                        .spotePlay(row[2]);
                                  });
                                });
                                await Future.delayed(
                                    Duration(milliseconds: 1500));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => PassedPage(index: 1)));
                              } else if (widget.index == 2) {
                                setState(() {
                                  shuffleImages2();
                                  shuffledImagesList2.forEach((row) {
                                    context
                                        .read<FortuneCubit>()
                                        .spotePlay(row[1]);
                                  });
                                });
                                await Future.delayed(
                                    Duration(milliseconds: 1500));

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => PassedPage(index: 2)));
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor: const MaterialStatePropertyAll(
                                    Color.fromRGBO(38, 121, 228, 1)),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16))),
                                side: const MaterialStatePropertyAll(BorderSide(
                                    width: 7,
                                    color: Color.fromRGBO(24, 64, 134, 1)))),
                            child: Text(
                              "Spin",
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: constraints.maxHeight * 0.07),
                            ))),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }));
  }
}

class ImageGrid extends StatefulWidget {
  final BoxConstraints constraints;
  final List<List<int>> imageIndexes;
  ImageGrid({
    super.key,
    required this.constraints,
    required this.imageIndexes,
  });
  @override
  _ImageGridState createState() => _ImageGridState();
}

class _ImageGridState extends State<ImageGrid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: widget.constraints.maxWidth * 0.35,
          height: widget.constraints.maxHeight * 0.48,
          padding: EdgeInsets.only(
              top: widget.constraints.maxHeight * 0.1,
              left: 25,
              bottom: 10,
              right: 25),
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("images/slot.png"))),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: widget.constraints.maxWidth * 0.045,
              crossAxisCount: 4,
            ),
            itemBuilder: (context, index) {
              int rowIndex = index ~/ 4;
              int colIndex = index % 4;
              return ImageWidget(
                imageIndex: widget.imageIndexes[rowIndex][colIndex],
                constraints: widget.constraints,
              );
            },
            itemCount: 16,
          ),
        ),
      ],
    );
  }
}

class ImageWidget extends StatelessWidget {
  final BoxConstraints constraints;

  final int imageIndex;

  ImageWidget({required this.imageIndex, required this.constraints});

  @override
  Widget build(BuildContext context) {
    String imagePath = 'images/gift_$imageIndex.png';

    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
    );
  }
}

class ImageSpotGrid extends StatefulWidget {
  final BoxConstraints constraints;
  final List<List<int>> imageIndexes;

  ImageSpotGrid({
    super.key,
    required this.constraints,
    required this.imageIndexes,
  });
  @override
  _ImageSpotGridState createState() => _ImageSpotGridState();
}

class _ImageSpotGridState extends State<ImageSpotGrid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: widget.constraints.maxWidth * 0.5,
          height: widget.constraints.maxHeight * 0.5,
          padding: EdgeInsets.only(
              top: widget.constraints.maxHeight * 0.13,
              left: 40,
              bottom: 0,
              right: 60),
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("images/pokies.png"))),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.3,
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              int rowIndex = index ~/ 3;
              int colIndex = index % 3;
              return ImageWidget(
                imageIndex: widget.imageIndexes[rowIndex][colIndex],
                constraints: widget.constraints,
              );
            },
            itemCount: 9,
          ),
        ),
        // Flexible(
        //   child: SizedBox(
        //       height: widget.constraints.maxHeight * 0.15,
        //       width: widget.constraints.maxWidth * 0.25,
        //       child: ElevatedButton(
        //           onPressed: () async {
        //             imageIndexes.forEach((row) {
        //               row.shuffle();
        //             });
        //             setState(() {});
        //           },
        //           style: ButtonStyle(
        //               backgroundColor: const MaterialStatePropertyAll(
        //                   Color.fromRGBO(38, 121, 228, 1)),
        //               shape: MaterialStatePropertyAll(RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(16))),
        //               side: const MaterialStatePropertyAll(BorderSide(
        //                   width: 7, color: Color.fromRGBO(24, 64, 134, 1)))),
        //           child: Text(
        //             "Play",
        //             style: GoogleFonts.roboto(
        //                 color: Colors.white,
        //                 fontWeight: FontWeight.w700,
        //                 fontSize: widget.constraints.maxHeight * 0.07),
        //           ))),
        // ),
      ],
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
            border: Border.all(
                width: 5, color: const Color.fromRGBO(190, 23, 23, 1))),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                width: 15, color: const Color.fromRGBO(238, 33, 33, 1)),
          ),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    width: 5, color: const Color.fromRGBO(190, 23, 23, 1))),
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
                          ? const Color.fromRGBO(228, 232, 159, 1)
                          : const Color.fromRGBO(210, 198, 153, 1),
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
              onAnimationEnd: () async {
                Future.microtask(() {
                  setState(() {
                    widget.itemSelected[widget.currentSelectedIndex] = true;
                    context
                        .read<FortuneCubit>()
                        .roulettePlay(widget.currentSelectedIndex);
                  });
                });
                await Future.delayed(Duration(milliseconds: 500));
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => PassedPage(index: 0)));
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

class SpotWidget extends StatelessWidget {
  final BoxConstraints constraints;
  const SpotWidget({
    super.key,
    required this.shuffledImagesList,
    required this.images,
    required this.constraints,
  });

  final List<List<int>> shuffledImagesList;
  final Map<int, Image> images;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("images/Group 79.png"),
        Padding(
          padding: EdgeInsets.only(left: constraints.maxWidth * 0.05),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var shuffledImages in shuffledImagesList)
                Flexible(
                  child: Container(
                    height: constraints.maxWidth * 0.26,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(196, 199, 134, 1),
                      border: Border(
                        right: BorderSide(
                          width: constraints.maxWidth * 0.005,
                          color: Color.fromRGBO(190, 23, 23, 1),
                        ),
                        left: BorderSide(
                          width: constraints.maxWidth * 0.005,
                          color: Color.fromRGBO(190, 23, 23, 1),
                        ),
                        bottom: BorderSide(
                          width: constraints.maxWidth * 0.01,
                          color: Color.fromRGBO(190, 23, 23, 1),
                        ),
                        top: BorderSide(
                          width: constraints.maxWidth * 0.01,
                          color: Color.fromRGBO(190, 23, 23, 1),
                        ),
                      ),
                    ),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(
                          scale: animation,
                          child: child,
                        );
                      },
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        key: UniqueKey(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisExtent: constraints.maxWidth * 0.08,
                        ),
                        itemCount: shuffledImages.length,
                        itemBuilder: (context, index) {
                          if (index == 3) {
                            return Container();
                          } else {
                            final int imageId = shuffledImages[index];
                            return Container(
                              color: index == 1
                                  ? Color.fromRGBO(228, 232, 159, 1)
                                  : Colors.transparent,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: images[imageId]!,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              Image.asset(
                "images/Group 76.png",
                width: constraints.maxWidth * 0.05,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PokiesWidget extends StatelessWidget {
  final BoxConstraints constraints;
  const PokiesWidget({
    super.key,
    required this.shuffledImagesList,
    required this.images,
    required this.constraints,
  });

  final List<List<int>> shuffledImagesList;
  final Map<int, Image> images;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("images/Group 79.png"),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var shuffledImages in shuffledImagesList)
                Flexible(
                  child: Container(
                    height: constraints.maxWidth * 0.35,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(196, 199, 134, 1),
                      border: Border(
                        right: BorderSide(
                          width: constraints.maxWidth * 0.005,
                          color: Color.fromRGBO(190, 23, 23, 1),
                        ),
                        left: BorderSide(
                          width: constraints.maxWidth * 0.005,
                          color: Color.fromRGBO(190, 23, 23, 1),
                        ),
                        bottom: BorderSide(
                          width: constraints.maxWidth * 0.01,
                          color: Color.fromRGBO(190, 23, 23, 1),
                        ),
                        top: BorderSide(
                          width: constraints.maxWidth * 0.01,
                          color: Color.fromRGBO(190, 23, 23, 1),
                        ),
                      ),
                    ),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(
                          scale: animation,
                          child: child,
                        );
                      },
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        key: UniqueKey(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisExtent: constraints.maxWidth * 0.08,
                        ),
                        itemCount: shuffledImages.length,
                        itemBuilder: (context, index) {
                          final int imageId = shuffledImages[index];
                          return Container(
                            color: index == 2
                                ? Color.fromRGBO(228, 232, 159, 1)
                                : Colors.transparent,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: images[imageId]!,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
