import 'package:flutter/material.dart';

void main() {
  runApp(const LinguagensApp());
}

class LinguagensApp extends StatelessWidget {
  const LinguagensApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: const TelaLinguagens(),
    );
  }
}

class TelaLinguagens extends StatelessWidget {
  const TelaLinguagens({super.key});

  static const List<String> linguagens = [
    'Dart',
    'Python',
    'Java',
    'JavaScript',
    'C',
    'C++',
    'C#',
    'Kotlin',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Linguagens de programação')),
      body: ListView.builder(
        itemCount: linguagens.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.code),
            title: Text(linguagens[index]),
          );
        },
      ),
    );
  }
}
