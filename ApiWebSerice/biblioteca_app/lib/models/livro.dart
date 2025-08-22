class Livro {
  //atributos
  final String? id;//pode ser nulo inicialmente -> id será atribuido pelo BD
  final String titulo;
  final String autor;
  final String disponivel;

  //construtor
  Livro({this.id, required this.titulo, required this.autor, required this.disponivel});

  //métodos
  //toJson
  Map<String,dynamic> toJson() => {
    "id": id,
    "titulo" : titulo,
    "autor" : autor,
    "disponivel": disponivel
  };
  //FromJson
  factory Livro.FromJson(Map<String,dynamic> json) => 
  Livro(
    id:json["id"].toString(),
    titulo: json["titulo"].toString(),
    autor:json["autor"].toString(),
    disponivel:json["disponivel"].toString());
    
}