import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showcaseview/showcaseview.dart';

class InitialWidget extends StatefulWidget {
  final Function() yesClicked;
  const InitialWidget({super.key, required this.yesClicked});

  @override
  State<InitialWidget> createState() => _InitialWidgetState();
}

class _InitialWidgetState extends State<InitialWidget> {
  bool textFinished = false;
  GlobalKey _one = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedTextKit(
                onFinished: () {
                  setState(() {
                    textFinished = true;
                  });
                },
                animatedTexts: [
                  TypewriterAnimatedText(
                      'Neither me nor Dalal like unfinished business',
                      textStyle: GoogleFonts.lilitaOne().copyWith(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 100),
                      textAlign: TextAlign.center),
                  TypewriterAnimatedText(
                      'Are you willing to save the one you mocked, and give her closure?',
                      textStyle: GoogleFonts.lilitaOne().copyWith(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 100),
                      textAlign: TextAlign.center),
                ],
                totalRepeatCount: 1,
                // pause: const Duration(milliseconds: 10),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
              if (textFinished)
                const SizedBox(
                  height: 20,
                ),
              AnimatedOpacity(
                // If the widget is visible, animate to 0.0 (invisible).
                // If the widget is hidden, animate to 1.0 (fully visible).
                opacity: textFinished ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                // The green box must be a child of the AnimatedOpacity widget.
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Showcase.withWidget(
                      key: _one,
                      height: 200,
                      width: 200,
                      onTargetClick: () {
                        widget.yesClicked();
                      },
                      container: Center(
                        child: Text(
                          'Come on dont be a buzz kill',
                          style: GoogleFonts.lilitaOne().copyWith(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          widget.yesClicked();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white38),
                        child: Text(
                          'Yes',
                          style: GoogleFonts.lilitaOne().copyWith(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          ShowCaseWidget.of(context).startShowCase([
                            _one,
                          ]);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white38),
                        child: Text(
                          'No',
                          style: GoogleFonts.lilitaOne().copyWith(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
