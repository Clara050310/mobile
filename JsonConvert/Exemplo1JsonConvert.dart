import 'dart:convert';

void main() {
  String jsonString = '''{
                          "usuario":"João",
                          "login":"joao_user",
                          "senha":1234,
                          "ativo":true
                          }''';

  Map<String, dynamic> usuario = json.decode(jsonString);

  print(usuario["ativo"]);
}
