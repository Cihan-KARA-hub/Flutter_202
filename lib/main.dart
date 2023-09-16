import 'package:films_rates/flim_rates_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // Başlangıç teması (açık tema)
      darkTheme: ThemeData.light(),
      debugShowCheckedModeBanner: false, // Karanlık tema,
      home: Derecelendirmeview(),
    );
  }
}
