import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sadhusearch/frontend/pages/homepage.dart';
import 'package:sadhusearch/frontend/pages/webpage.dart';
import 'frontend/pages/error404.dart';
import 'frontend/pages/images.dart';


void main() {
  runApp(const MyApp());
 ErrorWidget.builder = (FlutterErrorDetails details) => Error404(details: details);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Omega Search',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const HomePage(),

      builder: EasyLoading.init(),
    );
  }
}