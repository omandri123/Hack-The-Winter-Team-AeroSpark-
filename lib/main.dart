import "package:block_chain_id/first_screen.dart";
import "package:flutter/material.dart";

final k_color_scheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 33, 1, 59),
);

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData().copyWith(colorScheme: k_color_scheme),
      home: PersonalDetailsForm(),
    );
  }
}
