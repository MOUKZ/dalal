import 'package:dalalname/initial_widget.dart';
import 'package:dalalname/second_widget.dart';
import 'package:flutter/material.dart';
import 'package:zhi_starry_sky/starry_sky.dart';

class AnimView extends StatefulWidget {
  AnimView({Key? key}) : super(key: key);

  @override
  State<AnimView> createState() => _AnimViewState();
}

class _AnimViewState extends State<AnimView> {
  bool yesClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     EasyDynamicTheme.of(context).changeTheme();
      //   },
      //   child: Icon(Icons.brightness_6),
      // ),
      body: Stack(
        children: [
          const Expanded(child: StarrySkyView()),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: yesClicked
                ? const SecondWidget()
                : InitialWidget(
                    yesClicked: () {
                      setState(() {
                        yesClicked = true;
                      });
                    },
                  ),
          )
        ],
      ),
    );
  }
}
