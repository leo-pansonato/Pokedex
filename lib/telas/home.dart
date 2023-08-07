import 'dart:convert';
import 'package:flutter/material.dart';
import '/dados/pokemons.dart';
import '/dados/api.dart';
import '../dados/gradient.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();

  backToTop() {
    _scrollController.jumpTo(_scrollController.position.minScrollExtent);
  }

  nomemaiusculo(String texto) {
    if (texto.isEmpty) {
      return texto;
    }
    return texto[0].toUpperCase() + texto.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    void abrirEstats(int id) {
      Navigator.pushNamed(context, "/stats", arguments: {"pokemonId": id});
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(43, 41, 44, 1),
      appBar: AppBar(
        title: const Text(
          "Pokedex",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red,
        toolbarHeight: 80,
      ),
      body: ListView.builder(
        itemCount: 1010,
        scrollDirection: Axis.vertical,
        controller: _scrollController,
        itemBuilder: (context, index) {
          int pokemonId = index + 1;
          return FutureBuilder(
            future: API.getPokemons(pokemonId),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return 
                 Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        height: 300,
                        width: 300,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }

              if (snapshot.hasData) {
                var jsonData = json.decode(snapshot.data.body);
                var pokemon = Pokemon.fromJson(jsonData);

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          abrirEstats(pokemonId);
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Ink(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: getGradientColors1(pokemon.tipo1),
                              tileMode: TileMode.mirror,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(blurRadius: 10),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Image.network(
                                pokemon.imageUrl,
                                fit: BoxFit.contain,
                              ),
                              Positioned(
                                top: 6,
                                right: 10,
                                child: Text(
                                  "#${pokemon.id.toString()}",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              Positioned(
                                bottom: 3,
                                left: 10,
                                child: Container(
                                  alignment: AlignmentDirectional.center,
                                  child: Text(
                                    nomemaiusculo(pokemon.nome),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.192),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(blurRadius: 10),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "Erro ao obter Pokemon.",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          backToTop();
        },
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.arrow_upward_rounded,
        ),
      ),
    );
  }
}
