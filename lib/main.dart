import 'package:flutter/material.dart';
import 'package:memo_game/components/filp_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memo Game Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    late List<String> simbols = [
      "!",
      "!",
      "@",
      "@",
      "#",
      "#",
      "\$",
      "\$",
      "%",
      "%",
      "^",
      "^",
    ];
    simbols.shuffle();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Card'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 20,
        ),
        itemCount: 12,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1,
        ),
        itemBuilder: (context, index) {
          return FilpCard(
            simbol: simbols[index],
          );
        },
      ),
    );
  }
}
