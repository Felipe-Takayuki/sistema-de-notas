import 'dart:io';
import 'constantes/constantes.dart';
import 'model/aluno.dart';

void main() {
  List<Aluno> alunos = [];
  for (int posicAluno = 1; posicAluno <= CONSTANTES.QUANTIDADE_ALUNOS; posicAluno++) {
    List<double> notas = [];
    print('Informe o nome do Aluno nº ${posicAluno}');
    String? nome = stdin.readLineSync();
    for (int contNotas = 1; contNotas <= CONSTANTES.QUANTIDADE_NOTAS; contNotas++) {
      print('Informe a nota nº${contNotas} do aluno $nome');
      try {
        double nota = double.parse(stdin.readLineSync()!);
        notas.add(nota);
        print('Nota adicionada!');
      } catch (_) {
        print('Nota inválida!');
      }
    }
    double media = calcMedia(notas);
    alunos.add(Aluno(nome: nome!, notas: notas, media: media));
  }
  buscaAluno(alunos);
}

void buscaAluno(List<Aluno> alunosRegistrados) {
  bool foiEncontrado = false;
  print('Qual o nome do Aluno que você deseja saber se está aprovado?');
  String? nomeAluno = stdin.readLineSync();
  for (Aluno aluno in alunosRegistrados) {
    if (aluno.nome == nomeAluno) {
      print(aluno.toString());
      if (aluno.media > CONSTANTES.MEDIA_DE_APROVACAO) {
        print('Aluno Aprovado');
      } else {
        print('Aluno Reprovado');
      }
      foiEncontrado = true;
      break;
    }
  }
  if (foiEncontrado == false) {
    print('Aluno não encontrado');
  }

  print('Deseja saber o estado de aprovação de outro aluno? s/n');
  String? resposta = stdin.readLineSync()?.toLowerCase();
  if (resposta == 's') {
    buscaAluno(alunosRegistrados);
  } else {
    print("tchau!");
  }
}

double calcMedia(List<double> notas) {
  double media = 0.0;
  notas.forEach((nota) {
    media += nota;
  });
  return (media / 4);
}
