//classe de controller para Usuariosd
import 'package:biblioteca_app/models/usuario.dart';
import 'package:biblioteca_app/services/api_service.dart';

class UsuarioController {
  //metodos
  //GET do usuario
  Future<List<Usuario>> fetchAll() async {
    //pega a lista de ususario no formato List<dynamic
    final list =  await ApiService.getList("usuarios?_sort=name");
    //retornar a lista de usuarios convertidos
    return list.map((item)=>Usuario.FromJson(item)).toList();

  }
  //GET de um unico usuario
  Future<Usuario> fetchOne(String id) async {
    final Usuario = await ApiService.getOne("usuario", id);
    return Usuario.FromJson(Usuario);
  }
}