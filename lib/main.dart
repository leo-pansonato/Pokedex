import 'package:flutter/material.dart';
import '/telas/estatisticas.dart';
import 'telas/home.dart';

void main() {
  runApp(Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      routes: {
        "/home": (context) => const Home(),
        "/stats": (context) => const Stats(),
      },
    );
  }
}
