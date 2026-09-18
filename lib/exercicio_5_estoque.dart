import 'package:flutter/material.dart';

void main() => runApp(const EstoqueApp());

class Produto {
  const Produto({
    required this.nome,
    required this.preco,
    required this.quantidade,
  });

  final String nome;
  final double preco;
  final int quantidade;
}

class EstoqueApp extends StatelessWidget {
  const EstoqueApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: false),
    home: const TelaEstoque(),
  );
}

class TelaEstoque extends StatefulWidget {
  const TelaEstoque({super.key});

  @override
  State<TelaEstoque> createState() => _TelaEstoqueState();
}

class _TelaEstoqueState extends State<TelaEstoque> {
  final nomeController = TextEditingController();
  final precoController = TextEditingController();
  final quantidadeController = TextEditingController();
  final List<Produto> produtos = [];

  void adicionarProduto() {
    final nome = nomeController.text.trim();
    final preco = double.tryParse(
      precoController.text.trim().replaceAll(',', '.'),
    );
    final quantidade = int.tryParse(quantidadeController.text.trim());

    if (nome.isEmpty ||
        preco == null ||
        !preco.isFinite ||
        preco <= 0 ||
        quantidade == null ||
        quantidade <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Informe nome, preço e quantidade válidos.'),
        ),
      );
      return;
    }

    setState(() {
      produtos.add(Produto(nome: nome, preco: preco, quantidade: quantidade));
    });
    nomeController.clear();
    precoController.clear();
    quantidadeController.clear();
  }

  @override
  void dispose() {
    nomeController.dispose();
    precoController.dispose();
    quantidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Estoque simples')),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: nomeController,
            decoration: const InputDecoration(
              labelText: 'Nome do produto',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: precoController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Preço',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: quantidadeController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Quantidade',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: adicionarProduto,
            child: const Text('Cadastrar produto'),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: produtos.isEmpty
                ? const Center(child: Text('Nenhum produto cadastrado.'))
                : ListView.builder(
                    itemCount: produtos.length,
                    itemBuilder: (context, index) {
                      final produto = produtos[index];
                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.inventory_2),
                          title: Text(produto.nome),
                          subtitle: Text(
                            'R\$ ${produto.preco.toStringAsFixed(2)} · '
                            'Quantidade: ${produto.quantidade}',
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    ),
  );
}
