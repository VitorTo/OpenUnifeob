import 'package:openeducacao/models/usuario_model.dart';
import 'package:openeducacao/repository/user_repository.dart';
class UsuarioController {
  List<UsuarioModel> usuarios = [];
  final repositor = UsuarioRepositor();

  Future start() async {
    usuarios = await repositor.fetchUsuario();
  }
}