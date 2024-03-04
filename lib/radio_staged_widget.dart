import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RadioStagedWidget extends StatefulWidget {
  const RadioStagedWidget({super.key});

  @override
  State<RadioStagedWidget> createState() => _RadioStagedWidgetState();
}

class _RadioStagedWidgetState extends State<RadioStagedWidget> {
  final myImage = AssetImage(
    'assets/raza.jpg',
  );
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(myImage, context);
  }

  bool textFinished = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedTextKit(
          onFinished: () {
            setState(() {
              textFinished = true;
            });
          },
          animatedTexts: [
            TypewriterAnimatedText(
                'Natalie you are not the one\nwho vandalized Dalal\nso we dont care\nabout your opinion',
                textStyle: GoogleFonts.lilitaOne().copyWith(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                speed: const Duration(milliseconds: 100),
                textAlign: TextAlign.start),
          ],
          totalRepeatCount: 1,
          // pause: const Duration(milliseconds: 10),
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        ),
        SizedBox(
          height: 12,
        ),
        AnimatedOpacity(
          opacity: textFinished ? 1 : 1,
          duration: const Duration(milliseconds: 50),
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(image: myImage, fit: BoxFit.cover),
            ),
          ),
        )
      ],
    );
  }
}
