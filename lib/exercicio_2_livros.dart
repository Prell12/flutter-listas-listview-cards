import 'package:flutter/material.dart';

void main() => runApp(const LivrosApp());

class Livro {
  const Livro({required this.titulo, required this.autor});

  final String titulo;
  final String autor;
}

class LivrosApp extends StatelessWidget {
  const LivrosApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: false),
    home: const TelaLivros(),
  );
}

class TelaLivros extends StatelessWidget {
  const TelaLivros({super.key});

  static const List<Livro> livros = [
    Livro(titulo: 'Dom Casmurro', autor: 'Machado de Assis'),
    Livro(titulo: 'O Cortiço', autor: 'Aluísio Azevedo'),
    Livro(titulo: 'Vidas Secas', autor: 'Graciliano Ramos'),
    Livro(titulo: 'A Hora da Estrela', autor: 'Clarice Lispector'),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Catálogo de livros')),
    body: ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: livros.length,
      itemBuilder: (context, index) {
        final livro = livros[index];
        return Card(
          child: ListTile(
            leading: const Icon(Icons.menu_book),
            title: Text(livro.titulo),
            subtitle: Text(livro.autor),
          ),
        );
      },
    ),
  );
}
