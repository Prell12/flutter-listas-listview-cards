import 'package:flutter/material.dart';

void main() {
  runApp(const TarefasApp());
}

class TarefasApp extends StatelessWidget {
  const TarefasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: const TelaTarefas(),
    );
  }
}

class TelaTarefas extends StatefulWidget {
  const TelaTarefas({super.key});

  @override
  State<TelaTarefas> createState() => _TelaTarefasState();
}

class _TelaTarefasState extends State<TelaTarefas> {
  final TextEditingController tarefaController = TextEditingController();
  final List<String> tarefas = [];

  void adicionarTarefa() {
    final tarefa = tarefaController.text.trim();
    if (tarefa.isEmpty) {
      return;
    }

    setState(() {
      tarefas.add(tarefa);
    });
    tarefaController.clear();
  }

  void removerTarefa(int index) {
    setState(() {
      tarefas.removeAt(index);
    });
  }

  @override
  void dispose() {
    tarefaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de tarefas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: tarefaController,
              decoration: const InputDecoration(
                labelText: 'Nova tarefa',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => adicionarTarefa(),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: adicionarTarefa,
              child: const Text('Adicionar tarefa'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: tarefas.isEmpty
                  ? const Center(child: Text('Nenhuma tarefa cadastrada.'))
                  : ListView.builder(
                      itemCount: tarefas.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(tarefas[index]),
                        trailing: IconButton(
                          tooltip: 'Remover tarefa',
                          icon: const Icon(Icons.delete),
                          onPressed: () => removerTarefa(index),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
