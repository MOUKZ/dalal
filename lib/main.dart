import 'package:dalalname/anim_view.dart';
import 'package:dalalname/firebase_options.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(EasyDynamicThemeWidget(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Starry Sky',
      darkTheme: ThemeData.dark(),
      themeMode: EasyDynamicTheme.of(context).themeMode,
      home: AnimView(),
    );
  }
}
