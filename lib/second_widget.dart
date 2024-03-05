import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showcaseview/showcaseview.dart';

class SecondWidget extends StatefulWidget {
  const SecondWidget({super.key});

  @override
  State<SecondWidget> createState() => _SecondWidgetState();
}

class _SecondWidgetState extends State<SecondWidget> {
  final TextEditingController controller = TextEditingController();
  bool textFinished = false;
  bool finalTextFinished = false;
  String? selectedRadio;
  bool nameSubmitted = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: Builder(builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                if (!nameSubmitted)
                  AnimatedTextKit(
                    onFinished: () {
                      setState(() {
                        textFinished = true;
                      });
                    },
                    animatedTexts: [
                      TypewriterAnimatedText('Great you are not a buzz kill',
                          textStyle: GoogleFonts.lilitaOne().copyWith(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                          speed: const Duration(milliseconds: 100),
                          textAlign: TextAlign.center),
                      TypewriterAnimatedText('who are you: ',
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
                AnimatedSwitcher(
                  // If the widget is visible, animate to 0.0 (invisible).
                  duration: const Duration(milliseconds: 500),
                  // The green box must be a child of the AnimatedOpacity widget.
                  child: !nameSubmitted && textFinished
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RadioListTile<String?>(
                              value: 'raza',
                              groupValue: selectedRadio,
                              onChanged: (value) {
                                setState(() {
                                  selectedRadio = value;
                                });
                              },
                              title: Text(
                                'Raza',
                                style: GoogleFonts.lilitaOne().copyWith(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            RadioListTile<String?>(
                              value: 'natalie',
                              groupValue: selectedRadio,
                              onChanged: (value) {
                                setState(() {
                                  selectedRadio = 'natalie';
                                });
                              },
                              title: Text(
                                'Natalie',
                                style: GoogleFonts.lilitaOne().copyWith(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: !nameSubmitted && selectedRadio != null
                      ? Column(
                          children: [
                            TextField(
                              controller: controller,
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                  hintText: 'Name me here..',
                                  hintStyle: GoogleFonts.lilitaOne().copyWith(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.0),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(color: Colors.grey),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (controller.text.isNotEmpty) {
                                  final postData = {
                                    'name': controller.text,
                                    'selector': selectedRadio
                                  };

                                  // Get a key for a new Post.
                                  final newPostKey = FirebaseDatabase.instance
                                      .ref()
                                      .child('dalal')
                                      .push()
                                      .key;

                                  // Write the new post's data simultaneously in the posts list and the
                                  // user's post list.
                                  final Map<String, Map> updates = {};
                                  updates['/dalalName/$newPostKey'] = postData;

                                  postData;

                                  FirebaseDatabase.instance
                                      .ref()
                                      .update(updates);
                                  controller.text = '';
                                  setState(() {
                                    nameSubmitted = true;
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white38),
                              child: Text(
                                'Submit',
                                style: GoogleFonts.lilitaOne().copyWith(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        )
                      : Container(),
                ),
                if (nameSubmitted)
                  AnimatedTextKit(
                    onFinished: () {
                      setState(() {
                        finalTextFinished = true;
                      });
                    },
                    animatedTexts: [
                      TypewriterAnimatedText(
                          'Great Now That is her new name please have some cake',
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
                  )
                else
                  Container(),
                SizedBox(
                  height: 20,
                ),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 20),
                  child: finalTextFinished
                      ? Image.asset('assets/cake.png')
                      : Container(),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
