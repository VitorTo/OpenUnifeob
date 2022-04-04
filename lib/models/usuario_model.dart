class UsuarioModel {
  int? id;
  String? nome;
  String? email;

  UsuarioModel({this.id, this.nome, this.email});

  UsuarioModel.fromJson(Map<String, dynamic> json, data, db) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    return data;
  }

  static void add(UsuarioModel obj) {}
}