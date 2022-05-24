class User {
  late String titulo;
  late String link;
  late String descricao;

User(String titulo, String descricao, String link) {
    this.titulo;
    this.link;
    this.descricao;

  }
User.fromJson(Map json)
      : titulo = json['titulo'],
      link = json['url_youtube'],
      descricao = json['descricao'];

  get url => null;

  Map toJson() {
    return {'titulo': titulo, 'url': url , 'descricao': descricao,  };
  }
  
}
