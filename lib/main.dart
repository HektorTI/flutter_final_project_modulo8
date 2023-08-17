// ignore: unused_import
import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Movies'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var items = [
    'Air: A História Por Trás do Logo, Ben Affleck',
    'Babilônia, Damien Chazelle',
    'Close, Lukas Dhont',
    'Império da Luz, Sam Mendes',
    'John Wick 4: Baba Yaga, Chad Stahelski',
    'Os Fabelmans, Steven Spielberg',
    'Showing Up, Kelly Reichardt',
    'Tár, Todd Field',
    'Beau tem Medo, Ari Aster',
    'Indiana Jones',
  ];

  FixedExtentScrollController controller = FixedExtentScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.black, // Adicionando um fundo preto
        child: Column(
          children: [
            Image.asset(
              'assets/images/Tubi-best-movie-apps-for-Android.png', // Substitua pelo caminho da sua imagem
              fit: BoxFit.cover,
            ),
            Expanded(
              child: ListWheelScrollView(
                itemExtent: 80,
                diameterRatio: 3,
                controller: controller,
                physics: const FixedExtentScrollPhysics(),
                children: items.map((item) {
                  return Card(
                    child: Center(
                      child: Text(
                        item,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                        textAlign:
                            TextAlign.center, // Alinhando os nomes no centro
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
