# Flutter: Listas, ListView e Cards

Soluções dos cinco exercícios de fixação da página 14 do material **Flutter — Material 2: Listas, ListView e Cards**. Cada exercício é um aplicativo independente no mesmo projeto, sem navegação entre telas. Os dados dos cadastros ficam apenas em memória.

## Requisitos

- Flutter SDK 3.47 ou mais recente
- Um emulador/dispositivo Android ou navegador compatível com Flutter Web

## Executar

Na raiz do projeto, execute `flutter pub get` e escolha um exercício com `-t`:

| Exercício | O que demonstra | Comando |
| --- | --- | --- |
| 1. Linguagens | `List<String>`, `ListView.builder` e `ListTile` | `flutter run -t lib/exercicio_1_linguagens.dart` |
| 2. Livros | `Livro`, `List<Livro>` e `Card` | `flutter run -t lib/exercicio_2_livros.dart` |
| 3. Alunos | `Aluno`, nome no `title` e nota no `subtitle` | `flutter run -t lib/exercicio_3_alunos.dart` |
| 4. Tarefas | Cadastro e remoção com `setState()` e `IconButton` | `flutter run -t lib/exercicio_4_tarefas.dart` |
| 5. Estoque | Cadastro de `Produto` e estado vazio | `flutter run -t lib/exercicio_5_estoque.dart` |

`flutter run` executa o exercício 5 por padrão. Para escolher o navegador, acrescente `-d chrome` ao comando, se o Chrome estiver disponível.

## Validação

```sh
flutter analyze
flutter test
flutter build web
```

O exercício 5 aceita ponto ou vírgula como separador decimal para o preço. Nome, preço positivo e quantidade inteira positiva são obrigatórios.
