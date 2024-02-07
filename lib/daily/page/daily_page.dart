import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortune_app/cubit/fortune_cubit.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({super.key});

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  bool isOpen = false;
  @override
  void initState() {
    final time = context.read<FortuneCubit>().expiryTime;
    if (time != null && time.isAfter(DateTime.now())) {
      isOpen = true;
    }else{
      isOpen = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/daily_back.png"), fit: BoxFit.cover),
      ),
      child: LayoutBuilder(
        builder: (contex, constraints) {
          return Row(
            children: [
              Flexible(
                flex: 2,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: BackButton(
                    constraints: constraints,
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Flexible(
                  flex: 2,
                  child: isOpen
                      ? ImageOpenDaily(constraints: constraints)
                      : ImageCloseDaily(constraints: constraints)),
              Spacer(
                flex: 1,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
                child: SizedBox(
                  width: constraints.maxHeight * 0.55,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextDailyReward(
                        constraints: constraints,
                      ),
                      isOpen
                          ? Column(
                              children: [
                                Text(
                                  "We give you 200 coins for daily login to the application. We are waiting for you.",
                                  style: GoogleFonts.ubuntu(
                                    fontSize: constraints.maxHeight * 0.04,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextDailyRewardOpened(constraints: constraints),
                              ],
                            )
                          : TextDailyRewardIsReady(
                              constraints: constraints,
                            ),
                      Spacer(),
                      SizedBox(
                        height: constraints.maxHeight * 0.13,
                        width: constraints.maxWidth * 0.22,
                        child: ElevatedButton(
                          onPressed: isOpen
                              ? null
                              : () async {
                                  setState(() {
                                    isOpen = true;
                                  });
                                  context.read<FortuneCubit>().addBalance(200);
                                  await context.read<FortuneCubit>().saveDate();
                                },
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(isOpen
                                  ? Color.fromRGBO(181, 181, 181, 1)
                                  : Color.fromRGBO(38, 121, 228, 1)),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16))),
                              side: MaterialStatePropertyAll(BorderSide(
                                  width: 5,
                                  color: isOpen
                                      ? Color.fromRGBO(128, 128, 128, 1)
                                      : Color.fromRGBO(24, 64, 134, 1)))),
                          child: Text(
                            "Open",
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: constraints.maxHeight * 0.055),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    ));
  }
}

class TextDailyRewardOpened extends StatefulWidget {
  final BoxConstraints constraints;

  const TextDailyRewardOpened({
    super.key,
    required this.constraints,
  });

  @override
  State<TextDailyRewardOpened> createState() => _TextDailyRewardOpenedState();
}

class _TextDailyRewardOpenedState extends State<TextDailyRewardOpened> {
  late Timer _timer;
  late Duration _duration;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    DateTime now = DateTime.now();
    DateTime? endOfDay = context.read<FortuneCubit>().expiryTime;
    _duration = endOfDay!.difference(now);

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_duration.inSeconds > 0) {
          _duration = _duration - Duration(seconds: 1);
        } else {
          _timer.cancel();
          _startTimer();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String hours = _duration.inHours.remainder(24).toString().padLeft(2, '0');
    String minutes =
        _duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds =
        _duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your can open daily',
          style: GoogleFonts.ubuntu(
            fontSize: widget.constraints.maxHeight * 0.04,
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
                fontSize: widget.constraints.maxHeight * 0.04,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Text(
              '$hours:$minutes:$seconds',
              style: GoogleFonts.ubuntu(
                fontSize: widget.constraints.maxHeight * 0.04,
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

class TextDailyReward extends StatelessWidget {
  final BoxConstraints constraints;
  const TextDailyReward({
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
            'DAILY',
            style: GoogleFonts.roboto(
                fontSize: constraints.maxHeight * 0.11,
                fontStyle: FontStyle.italic,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 10
                  ..color = const Color.fromRGBO(196, 199, 134, 1)),
          ),
          Text(
            'DAILY',
            style: GoogleFonts.roboto(
              fontSize: constraints.maxHeight * 0.11,
              fontStyle: FontStyle.italic,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              color: const Color.fromRGBO(202, 34, 44, 1),
            ),
          ),
        ]),
        Stack(children: [
          Text(
            'REWARD',
            style: GoogleFonts.roboto(
                fontSize: constraints.maxHeight * 0.11,
                fontStyle: FontStyle.italic,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 10
                  ..color = const Color.fromRGBO(196, 199, 134, 1)),
          ),
          Text(
            'REWARD',
            style: GoogleFonts.roboto(
              fontSize: constraints.maxHeight * 0.11,
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
        RichText(
          text: TextSpan(
            text: 'Every ',
            style: GoogleFonts.ubuntu(
              fontSize: constraints.maxHeight * 0.04,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: '24 hours',
                  style: GoogleFonts.ubuntu(
                    fontSize: constraints.maxHeight * 0.04,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue,
                  )),
              TextSpan(
                text: ' you can get your daily reward.',
                style: GoogleFonts.ubuntu(
                  fontSize: constraints.maxHeight * 0.04,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
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
      "images/image 64.png",
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
      "images/image 63.png",
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
