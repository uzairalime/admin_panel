import 'package:admin_panal/view/home_screen.dart';
import 'package:admin_panal/view/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
final ScrollController scrollController = ScrollController();
void main() {
  getIt.registerSingleton<ScrollController>(scrollController);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: HomeScreen() ,
      home: TestScreen() ,
    );
  }
}


