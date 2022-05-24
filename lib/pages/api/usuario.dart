class Usuario {
  late String id_usuario;
  late String nome;
  late String email;

Usuario(String id_usuario, String nome, String email) {
    this.id_usuario;
    this.nome;
    this.email;

  }
Usuario.fromJson(Map json)
      : id_usuario = json['id_usuario'],
      nome = json['nome'],
      email = json['email'];

  get url => null;

  Map toJson() {
    return {'id_usuario': id_usuario, 'nome': nome , 'email': email,  };
  }
  
}
