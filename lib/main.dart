import 'package:flip_card/flip_card.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card'),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          itemCount: 9,
          itemBuilder: (BuildContext context, int index) {
            return FlipCard(
              fill: Fill.fillBack,
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                color: Colors.blue,
                child: const Center(child: Text('Front')),
              ),
              back: Container(
                color: Colors.red,
                child: Center(child: Text('${index + 1}')),
              ),
            );
          }),
    );
  }
}
