class Emprestimo {
  //atributos
  final String? id;//pode ser nulo inicialmente -> id será atribuido pelo BD
  final String Usuario;
  final String Livro;
  final String data_emprestimo;
  final String data_Devolucao;
  final bool devolvido;

  //construtor
  Emprestimo({this.id, required this.Usuario, required this.Livro, required this.data_emprestimo, required this.data_Devolucao, required this.devolvido});

  //métodos
  //toJson
  Map<String,dynamic> toJson() => {
    "id": id,
    "titulo" : Usuario,
    "livro" : Livro,
    "disponivel": data_emprestimo,
    "data_Devolução": data_Devolucao,
    "devolvido": devolvido
  };
  //FromJson
  factory Emprestimo.FromJson(Map<String,dynamic> json) => 
  Emprestimo(
    id:json["id"].toString(),
    Usuario: json["usuario"].toString(),
    Livro:json["livro"].toString(),
    data_emprestimo:json["data Emprestimo"].toString(),
    data_Devolucao:json["data Devolução"].toString(),
    devolvido:json["devolvido"].toString().toLowerCase() == 'true' ? true :false);
    
}