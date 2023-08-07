class Pokemon {
  int id;
  String nome, imageUrl;
  String tipo1;

  //construtor
  Pokemon(
    this.id,
    this.nome,
    this.imageUrl,
    this.tipo1,
  );

  Pokemon.fromJson(Map json)
      : id = json['id'],
        nome = json['name'],
        imageUrl =
            json['sprites']['other']['official-artwork']['front_default'],
        tipo1 = json['types'][0]['type']['name'];

  Map toJson() {
    return {
      'id': id,
      'nome': nome,
      'imageUrl': imageUrl,
      'tipo1': tipo1,
    };
  }
}
