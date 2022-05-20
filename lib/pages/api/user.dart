class User {
  late String titulo;
  late String link;
  late String descricao;
  // late String conteudos;
  // late String disponivel;

User(String titulo, String descricao, String link) {
    this.titulo;
    this.link;
    this.descricao;
    // this.conteudos;
    // this.disponivel;
  }
User.fromJson(Map json)
      : titulo = json['titulo'],
      link = json['url'],
      descricao = json['descricao'];
      // conteudos = json['conteudos'];

  get url => null;
      // disponivel = json['disponivel'];
  Map toJson() {
    return {'titulo': titulo, 'url': url , 'descricao': descricao,  };
  }
  
}
