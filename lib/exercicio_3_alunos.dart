import 'package:flutter/material.dart';

void main() => runApp(const AlunosApp());

class Aluno {
  const Aluno({required this.nome, required this.nota});

  final String nome;
  final double nota;
}

class AlunosApp extends StatelessWidget {
  const AlunosApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: false),
    home: const TelaAlunos(),
  );
}

class TelaAlunos extends StatelessWidget {
  const TelaAlunos({super.key});

  static const List<Aluno> alunos = [
    Aluno(nome: 'Ana', nota: 9.5),
    Aluno(nome: 'Bruno', nota: 8.0),
    Aluno(nome: 'Carla', nota: 7.5),
    Aluno(nome: 'Diego', nota: 9.0),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Lista de alunos')),
    body: ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: alunos.length,
      itemBuilder: (context, index) {
        final aluno = alunos[index];
        return Card(
          child: ListTile(
            leading: const Icon(Icons.person),
            title: Text(aluno.nome),
            subtitle: Text('Nota: ${aluno.nota.toStringAsFixed(1)}'),
          ),
        );
      },
    ),
  );
}
