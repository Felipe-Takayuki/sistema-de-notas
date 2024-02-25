// ignore_for_file: public_member_api_docs, sort_constructors_first
class Aluno {
  Aluno({
    required this.nome,
    required this.notas,
    required this.media
  });

  final String nome;
  final List<double> notas;
  final double media; 
  
  
  @override
  String toString() => 'nome do aluno: $nome, notas: $notas, media: $media';
}
