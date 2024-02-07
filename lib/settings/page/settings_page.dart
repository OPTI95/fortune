import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Color.fromRGBO(83, 31, 31, 1)),
        child: LayoutBuilder(
          builder: (contex, constraints) {
            return Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: BackButton(
                    constraints: constraints,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextSettings(
                          constraints: constraints,
                        ),
                        Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(children: [
                              ButtonShareWithFriends(
                                constraints: constraints,
                              ),
                              const SizedBox(height: 12),
                              ButtonPrivacyPolicy(
                                constraints: constraints,
                              ),
                              const SizedBox(height: 12),
                              ButtonTermsOfUse(
                                constraints: constraints,
                              ),
                            ]),
                            SizedBox(
                              width: 32,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Vibro",
                                      style: GoogleFonts.roboto(
                                          fontSize: constraints.maxWidth * 0.04,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Switch(
                                        value: value,
                                        onChanged: (val) {
                                          value = val;
                                          setState(() {});
                                        },
                                        activeColor: Colors.white,
                                        activeTrackColor: Colors.red)
                                  ],
                                ),
                                Text(
                                  "App icon",
                                  style: GoogleFonts.roboto(
                                      fontSize: constraints.maxWidth * 0.04,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: (){
                                              _changeAppIcon("icon1");
                                          },
                                          child: Container(
                                            height: constraints.maxWidth * 0.07,
                                            width: constraints.maxWidth * 0.07,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "images/Icon_1.png"))),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            _changeAppIcon("icon2.png");
                                          },
                                          child: Container(
                                            height: constraints.maxWidth * 0.07,
                                            width: constraints.maxWidth * 0.07,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "images/Icon_2.png"))),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            _changeAppIcon("icon3");
                                          },
                                          child: Container(
                                            height: constraints.maxWidth * 0.07,
                                            width: constraints.maxWidth * 0.07,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "images/Icon_3.png"))),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            _changeAppIcon("icon4");
                                          },
                                          child: Container(
                                            height: constraints.maxWidth * 0.07,
                                            width: constraints.maxWidth * 0.07,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "images/Icon_4.png"))),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            _changeAppIcon("icon5");
                                          },
                                          child: Container(
                                            height: constraints.maxWidth * 0.07,
                                            width: constraints.maxWidth * 0.07,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "images/Icon_5.png"))),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Spacer(),
              ],
            );
          },
        ),
      ),
    );
  }

  void _changeAppIcon(String icon)async {
    try {
    await FlutterDynamicIcon.setAlternateIconName(icon);
  } on PlatformException {
    print('Failed to change app icon');
  }
  }
}

class ButtonTermsOfUse extends StatelessWidget {
  final BoxConstraints constraints;

  const ButtonTermsOfUse({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constraints.maxHeight * 0.15,
      width: constraints.maxWidth * 0.33,
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
          "Terms of use",
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: constraints.maxHeight * 0.06,
          ),
        ),
      ),
    );
  }
}

class ButtonPrivacyPolicy extends StatelessWidget {
  final BoxConstraints constraints;

  const ButtonPrivacyPolicy({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constraints.maxHeight * 0.15,
      width: constraints.maxWidth * 0.33,
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
          "Privacy Policy",
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: constraints.maxHeight * 0.06,
          ),
        ),
      ),
    );
  }
}

class ButtonShareWithFriends extends StatelessWidget {
  final BoxConstraints constraints;

  const ButtonShareWithFriends({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constraints.maxHeight * 0.15,
      width: constraints.maxWidth * 0.33,
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
          "Share with friends",
          textAlign: TextAlign.center,
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

class TextSettings extends StatelessWidget {
  final BoxConstraints constraints;
  const TextSettings({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Text(
        'SETTING',
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
        'SETTING',
        style: GoogleFonts.roboto(
          fontSize: constraints.maxHeight * 0.11,
          fontStyle: FontStyle.italic,
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
          color: const Color.fromRGBO(202, 34, 44, 1),
        ),
      ),
    ]);
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
