import 'package:flutter/material.dart';

class SlotPokies extends StatefulWidget {
  @override
  _SlotPokiesState createState() => _SlotPokiesState();
}

class _SlotPokiesState extends State<SlotPokies> {
  Map<int, Image> images = {
    1: Image.asset('images/gift_1.png'),
    2: Image.asset('images/gift_2.png'),
    3: Image.asset('images/gift_3.png'),
    4: Image.asset('images/gift_4.png'),
  };

  List<List<int>> shuffledImagesList = [];

  @override
  void initState() {
    super.initState();
    shuffledImagesList = List.generate(4, (index) => [1, 2, 3, 4]);
  }

  void shuffleImages() {
    setState(() {
      shuffledImagesList.forEach((list) => list.shuffle());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spot Pokies'),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Center(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(200.0),
                child: Column(
                  children: [
                    Image.asset("images/Group 79.png"),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: constraints.maxWidth * 0.05),
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
                                  transitionBuilder: (Widget child,
                                      Animation<double> animation) {
                                    return ScaleTransition(
                                      scale: animation,
                                      child: child,
                                    );
                                  },
                                  child: GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    key: UniqueKey(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      mainAxisExtent:
                                          constraints.maxWidth * 0.08,
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
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  shuffleImages();
                },
                child: const Text('Играть'),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class SpotPokies extends StatefulWidget {
  @override
  _SpotPokiesState createState() => _SpotPokiesState();
}

class _SpotPokiesState extends State<SpotPokies> {
  Map<int, Image> images = {
    1: Image.asset('images/gift_1.png'),
    2: Image.asset('images/gift_2.png'),
    3: Image.asset('images/gift_3.png'),
    4: Image.asset('images/gift_4.png'),
  };

  List<List<int>> shuffledImagesList = [];

  @override
  void initState() {
    super.initState();
    shuffledImagesList = List.generate(3, (index) => [1, 2, 3, 4]);
  }

  void shuffleImages() {
    setState(() {
      shuffledImagesList.forEach((list) => list.shuffle());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spot Pokies'),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Center(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(200.0),
                child: SpotWidget(shuffledImagesList: shuffledImagesList, images: images, constraints: constraints,),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  shuffleImages();
                },
                child: const Text('Играть'),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class SpotWidget extends StatelessWidget {
  final BoxConstraints constraints;
  const SpotWidget({
    super.key,
    required this.shuffledImagesList,
    required this.images, required this.constraints,
  });

  final List<List<int>> shuffledImagesList;
  final Map<int, Image> images;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("images/Group 79.png"),
        Padding(
          padding: EdgeInsets.only(
              left: constraints.maxWidth * 0.05),
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
                      transitionBuilder: (Widget child,
                          Animation<double> animation) {
                        return ScaleTransition(
                          scale: animation,
                          child: child,
                        );
                      },
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        key: UniqueKey(),
                        shrinkWrap: true,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisExtent:
                              constraints.maxWidth * 0.08,
                        ),
                        itemCount: shuffledImages.length,
                        itemBuilder: (context, index) {
                          if (index == 3) {
                            return Container();
                          } else {
                            final int imageId =
                                shuffledImages[index];
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
              Image.asset("images/Group 76.png", width: constraints.maxWidth * 0.05,),
            ],
          ),
        ),
      ],
    );
  }
}
