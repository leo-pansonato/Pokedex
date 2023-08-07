import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "pokeapi.co"; // pokeapi.co

class API {
  static Future getPokemons(int id) {
    var url = Uri(
      scheme: 'https',
      host: baseUrl,
      path: '/api/v2/pokemon/$id', // api/v2/pokemon/
    );
    return http.get(url);
  }
}
