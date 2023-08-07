class PokemonStats {
  int id;
  String nome, imageUrl;
  String tipo1;
  String tipo2;
  double altura, peso;
  int hp, atk, def, spAtk, spDef, speed;

  //construtor
  PokemonStats(
      this.id,
      this.nome,
      this.imageUrl,
      this.altura,
      this.peso,
      this.tipo1,
      this.tipo2,
      this.hp,
      this.atk,
      this.def,
      this.spAtk,
      this.spDef,
      this.speed);

  PokemonStats.fromJson(Map json)
      : id = json['id'],
        nome = json['name'],
        imageUrl =
            json['sprites']['other']['official-artwork']['front_default'],
        altura = json['height'] / 10,
        peso = json['weight'] / 10,
        tipo1 = json['types'][0]['type']['name'],
        tipo2 =
            json['types'].length > 1 ? json['types'][1]['type']['name'] : '',
        hp = json['stats'][0]['base_stat'],
        atk = json['stats'][1]['base_stat'],
        def = json['stats'][2]['base_stat'],
        spAtk = json['stats'][3]['base_stat'],
        spDef = json['stats'][4]['base_stat'],
        speed = json['stats'][5]['base_stat'];

  Map toJson() {
    return {
      'id': id,
      'nome': nome,
      'imageUrl': imageUrl,
      'altura': altura,
      'peso': peso,
      'tipo1': tipo1,
      'tipo2': tipo2,
      'hp': hp,
      'atk': atk,
      'def': def,
      'sp_atk': spAtk,
      'sp_def': spDef,
      'speed': speed,
    };
  }
}
