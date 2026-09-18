import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_listas_listview_cards/exercicio_1_linguagens.dart';
import 'package:flutter_listas_listview_cards/exercicio_2_livros.dart';
import 'package:flutter_listas_listview_cards/exercicio_3_alunos.dart';
import 'package:flutter_listas_listview_cards/exercicio_4_tarefas.dart';
import 'package:flutter_listas_listview_cards/exercicio_5_estoque.dart';

void main() {
  testWidgets('linguagens usam lista dinâmica de strings', (tester) async {
    await tester.pumpWidget(const LinguagensApp());
    expect(TelaLinguagens.linguagens, hasLength(8));
    expect(find.byType(ListView), findsOneWidget);
    expect(find.text('Dart'), findsOneWidget);
  });

  testWidgets('livros exibem título e autor em Cards', (tester) async {
    await tester.pumpWidget(const LivrosApp());
    expect(find.byType(Card), findsWidgets);
    expect(find.text('Dom Casmurro'), findsOneWidget);
    expect(find.text('Machado de Assis'), findsOneWidget);
  });

  testWidgets('alunos exibem nome e nota', (tester) async {
    await tester.pumpWidget(const AlunosApp());
    expect(find.text('Ana'), findsOneWidget);
    expect(find.text('Nota: 9.5'), findsOneWidget);
  });

  testWidgets('tarefas são adicionadas e removidas', (tester) async {
    await tester.pumpWidget(const TarefasApp());
    expect(find.text('Nenhuma tarefa cadastrada.'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Estudar Flutter');
    await tester.tap(find.text('Adicionar tarefa'));
    await tester.pump();
    expect(find.text('Estudar Flutter'), findsOneWidget);

    await tester.tap(find.byTooltip('Remover tarefa'));
    await tester.pump();
    expect(find.text('Nenhuma tarefa cadastrada.'), findsOneWidget);
  });

  testWidgets('estoque valida entrada e mostra produto cadastrado', (
    tester,
  ) async {
    await tester.pumpWidget(const EstoqueApp());
    expect(find.text('Nenhum produto cadastrado.'), findsOneWidget);

    await tester.tap(find.text('Cadastrar produto'));
    await tester.pump();
    expect(find.text('Nenhum produto cadastrado.'), findsOneWidget);

    await tester.enterText(find.byType(TextField).at(0), 'Teclado');
    await tester.enterText(find.byType(TextField).at(1), '120,50');
    await tester.enterText(find.byType(TextField).at(2), '3');
    await tester.tap(find.text('Cadastrar produto'));
    await tester.pump();
    expect(find.text('Teclado'), findsOneWidget);
    expect(find.text('R\$ 120.50 · Quantidade: 3'), findsOneWidget);
  });
}
