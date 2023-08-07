import 'package:flutter_pokedex2/dados/pokemonStats.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../dados/gradient.dart';
import '../dados/api.dart';

class Stats extends StatefulWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    double maxContainerWidth = MediaQuery.of(context).size.width;
    double marginText = 19;
    double marginBox = 17;

    _setVisibility(String tipo) {
      if (tipo != "") {
        return true;
      } else {
        return false;
      }
    }

    primeiraLetraMaiuscula(String texto) {
      if (texto.isEmpty) {
        return texto;
      }
      return texto[0].toUpperCase() + texto.substring(1);
    }

    var data = ModalRoute.of(context)!.settings.arguments as Map;
    int pokemonId = data['pokemonId'];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(43, 41, 44, 1),
      body: FutureBuilder(
          future: API.getPokemons(pokemonId),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasData) {
              var jsonData = json.decode(snapshot.data.body);
              var pokemon = PokemonStats.fromJson(jsonData);

              int hpStats = pokemon.hp;
              double hpStatsBar = (hpStats * (1000 / 200)) / 1000;
              if(hpStatsBar > 1){
                hpStatsBar = 1;
              }

              int atkStats = pokemon.atk;
              double atkStatsBar = (atkStats * (1000 / 200)) / 1000;
              if(atkStatsBar > 1){
                atkStatsBar = 1;
              }

              int defStats = pokemon.def;
              double defStatsBar = (defStats * (1000 / 200)) / 1000;
              if(defStatsBar > 1){
                defStatsBar = 1;
              }

              int spAtkstats = pokemon.spAtk;
              double spAtkstatsbar = (spAtkstats * (1000 / 200)) / 1000;
              if(spAtkstatsbar > 1){
                spAtkstatsbar = 1;
              }

              int spDefstats = pokemon.spDef;
              double spDefstatsbar = (spDefstats * (1000 / 200)) / 1000;
              if(spDefstatsbar > 1){
                spDefstatsbar = 1;
              }

              int spdStats = pokemon.speed;
              double spdStatsBar = (spdStats * (1000 / 200)) / 1000;
              if(spdStatsBar > 1){
                spdStatsBar = 1;
              }

              int total = (hpStats + atkStats + defStats + spAtkstats + spDefstats + spdStats);

              return Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 300,
                        width: maxContainerWidth,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: getGradientColors1(pokemon.tipo1),
                            tileMode: TileMode.mirror,
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(35),
                            bottomRight: Radius.circular(35),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Image.network(
                            pokemon.imageUrl,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        primeiraLetraMaiuscula(pokemon.nome),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 35),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 120,
                              height: 25,
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: getGradientColors1(pokemon.tipo1),
                                    tileMode: TileMode.mirror,
                                  ),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 0),
                                child: Text(
                                  primeiraLetraMaiuscula(pokemon.tipo1),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: _setVisibility(pokemon.tipo2),
                              child: Row(
                                children: [
                                  const SizedBox(width: 30),
                                  Container(
                                    width: 120,
                                    height: 25,
                                    alignment: AlignmentDirectional.center,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors:
                                              getGradientColors1(pokemon.tipo2),
                                          tileMode: TileMode.mirror,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 0),
                                      child: Text(
                                        primeiraLetraMaiuscula(pokemon.tipo2),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 120,
                            height: 100,
                            alignment: AlignmentDirectional.center,
                            child: Column(
                              children: [
                                Text(
                                  "${(pokemon.peso)} KG",
                                  style: const TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                                const Text(
                                  "Weight",
                                  style: TextStyle(
                                      color: Color.fromARGB(80, 255, 255, 255),
                                      fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 80),
                          Container(
                            width: 100,
                            height: 100,
                            alignment: AlignmentDirectional.center,
                            child: Column(
                              children: [
                                Text(
                                  "${pokemon.altura} M",
                                  style: const TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                                const Text(
                                  "Height",
                                  style: TextStyle(
                                      color: Color.fromARGB(80, 255, 255, 255),
                                      fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "Stats",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "HP",
                                style: TextStyle(
                                    color: Color.fromARGB(143, 255, 255, 255)),
                              ),
                              SizedBox(height: marginText),
                              const Text(
                                "ATK",
                                style: TextStyle(
                                    color: Color.fromARGB(143, 255, 255, 255)),
                              ),
                              SizedBox(height: marginText),
                              const Text(
                                "DEF",
                                style: TextStyle(
                                    color: Color.fromARGB(143, 255, 255, 255)),
                              ),
                              SizedBox(height: marginText),
                              const Text(
                                "SP.ATK",
                                style: TextStyle(
                                    color: Color.fromARGB(143, 255, 255, 255)),
                              ),
                              SizedBox(height: marginText),
                              const Text(
                                "SP.DEF",
                                style: TextStyle(
                                    color: Color.fromARGB(143, 255, 255, 255)),
                              ),
                              SizedBox(height: marginText),
                              const Text(
                                "SPD",
                                style: TextStyle(
                                    color: Color.fromARGB(143, 255, 255, 255)),
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          Column(
                            children: [
                              LinearPercentIndicator(
                                width: 320,
                                lineHeight: 20,
                                percent: hpStatsBar,
                                progressColor:
                                    const Color.fromRGBO(214, 57, 68, 1),
                                backgroundColor: Colors.white,
                                barRadius: const Radius.circular(10),
                                animation: true,
                                animationDuration: 500,
                                center: LayoutBuilder(
                                  builder: (BuildContext context,
                                      BoxConstraints constraints) {
                                    double textLeft = 0;
                                        Color textColor = Colors.white; 
                                        if(hpStatsBar < 0.2){
                                            double progressWidth = constraints.maxWidth * hpStatsBar;
                                          textLeft = progressWidth - 5;
                                            textColor = Colors.black;
                                        }
                                        else if(spdStatsBar >= 0.2){
                                          double progressWidth = constraints.maxWidth * hpStatsBar;
                                          textLeft = progressWidth - 60;
                                        }
                                    return Stack(
                                      children: [
                                        Positioned(
                                          left: textLeft,
                                          child: Container(
                                            width: 60,
                                            height: 20,
                                            alignment: Alignment.center,
                                            child: Text(
                                              hpStats.toString() + "/200",
                                              style: TextStyle(
                                                  color: textColor,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: marginBox),
                              LinearPercentIndicator(
                                width: 320,
                                lineHeight: 20,
                                percent: atkStatsBar,
                                progressColor: Color.fromRGBO(253, 167, 39, 1),
                                backgroundColor: Colors.white,
                                barRadius: const Radius.circular(10),
                                animation: true,
                                animationDuration: 500,
                                center: LayoutBuilder(
                                  builder: (BuildContext context,
                                      BoxConstraints constraints) {
                                    double textLeft = 0;
                                        Color textColor = Colors.white; 
                                        if(atkStatsBar < 0.2){
                                            double progressWidth = constraints.maxWidth * atkStatsBar;
                                          textLeft = progressWidth - 5;
                                            textColor = Colors.black;
                                        }
                                        else if(spdStatsBar >= 0.2){
                                          double progressWidth = constraints.maxWidth * atkStatsBar;
                                          textLeft = progressWidth - 60;
                                        }
                                    return Stack(
                                      children: [
                                        Positioned(
                                          left: textLeft,
                                          child: Container(
                                            width: 60,
                                            height: 20,
                                            alignment: Alignment.center,
                                            child: Text(
                                              atkStats.toString() + "/200",
                                              style: TextStyle(
                                                  color: textColor,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: marginBox),
                              LinearPercentIndicator(
                                width: 320,
                                lineHeight: 20,
                                percent: defStatsBar,
                                progressColor: Color.fromRGBO(5, 142, 232, 1),
                                backgroundColor: Colors.white,
                                barRadius: const Radius.circular(10),
                                animation: true,
                                animationDuration: 500,
                                center: LayoutBuilder(
                                  builder: (BuildContext context,
                                      BoxConstraints constraints) {
                                    double textLeft = 0;
                                        Color textColor = Colors.white; 
                                        if(defStatsBar < 0.2){
                                            double progressWidth = constraints.maxWidth * defStatsBar;
                                          textLeft = progressWidth - 5;
                                            textColor = Colors.black;
                                        }
                                        else if(spdStatsBar >= 0.2){
                                          double progressWidth = constraints.maxWidth * defStatsBar;
                                          textLeft = progressWidth - 60;
                                        }
                                    return Stack(
                                      children: [
                                        Positioned(
                                          left: textLeft,
                                          child: Container(
                                            width: 60,
                                            height: 20,
                                            alignment: Alignment.center,
                                            child: Text(
                                              defStats.toString() + "/200",
                                              style: TextStyle(
                                                  color: textColor,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: marginBox),
                              LinearPercentIndicator(
                                width: 320,
                                lineHeight: 20,
                                percent: spAtkstatsbar,
                                progressColor:
                                    const Color.fromRGBO(211, 139, 32, 1),
                                backgroundColor: Colors.white,
                                barRadius: const Radius.circular(10),
                                animation: true,
                                animationDuration: 500,
                                center: LayoutBuilder(
                                  builder: (BuildContext context,
                                      BoxConstraints constraints) {
                                    double textLeft = 0;
                                        Color textColor = Colors.white; 
                                        if(spAtkstatsbar < 0.2){
                                            double progressWidth = constraints.maxWidth * spAtkstatsbar;
                                          textLeft = progressWidth - 5;
                                            textColor = Colors.black;
                                        }
                                        else if(spdStatsBar >= 0.2){
                                          double progressWidth = constraints.maxWidth * spAtkstatsbar;
                                          textLeft = progressWidth - 60;
                                        }
                                    return Stack(
                                      children: [
                                        Positioned(
                                          left: textLeft,
                                          child: Container(
                                            width: 60,
                                            height: 20,
                                            alignment: Alignment.center,
                                            child: Text(
                                              spAtkstats.toString() + "/200",
                                              style: TextStyle(
                                                  color: textColor,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: marginBox),
                              LinearPercentIndicator(
                                width: 320,
                                lineHeight: 20,
                                percent: spDefstatsbar,
                                progressColor:
                                    const Color.fromRGBO(5, 103, 168, 1),
                                backgroundColor: Colors.white,
                                barRadius: const Radius.circular(10),
                                animation: true,
                                animationDuration: 500,
                                center: LayoutBuilder(
                                  builder: (BuildContext context,
                                      BoxConstraints constraints) {
                                    double textLeft = 0;
                                        Color textColor = Colors.white; 
                                        if(spDefstatsbar < 0.2){
                                            double progressWidth = constraints.maxWidth * spDefstatsbar;
                                          textLeft = progressWidth - 5;
                                            textColor = Colors.black;
                                        }
                                        else if(spdStatsBar >= 0.2){
                                          double progressWidth = constraints.maxWidth * spDefstatsbar;
                                          textLeft = progressWidth - 60;
                                        }
                                    return Stack(
                                      children: [
                                        Positioned(
                                          left: textLeft,
                                          child: Container(
                                            width: 60,
                                            height: 20,
                                            alignment: Alignment.center,
                                            child: Text(
                                              spDefstats.toString() + "/200",
                                              style: TextStyle(
                                                  color: textColor,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: marginBox),
                              LinearPercentIndicator(
                                width: 320,
                                lineHeight: 20,
                                percent: spdStatsBar,
                                progressColor:
                                    const Color.fromRGBO(143, 175, 197, 1),
                                backgroundColor: Colors.white,
                                barRadius: const Radius.circular(10),
                                animation: true,
                                animationDuration: 500,
                                center: LayoutBuilder(
                                  builder: (BuildContext context,
                                      BoxConstraints constraints) {
                                        double textLeft = 0;
                                        Color textColor = Colors.white; 
                                        if(spdStatsBar < 0.2){
                                            double progressWidth = constraints.maxWidth * spdStatsBar;
                                          textLeft = progressWidth - 5;
                                            textColor = Colors.black;
                                        }
                                        else if(spdStatsBar >= 0.2){
                                          double progressWidth = constraints.maxWidth * spdStatsBar;
                                          textLeft = progressWidth - 60;
                                        }
                                    return Stack(
                                      children: [
                                        Positioned(
                                          left: textLeft,
                                          child: Container(
                                            width: 60,
                                            height: 20,
                                            alignment: Alignment.center,
                                            child: Text(
                                              spdStats.toString() + "/200",
                                              style: TextStyle(
                                                  color: textColor,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("TOTAL  ", style: TextStyle(color:Colors.white),),
                          Text(total.toString(),style: TextStyle(color:Colors.white),),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              borderRadius: const BorderRadius.all(
                                Radius.elliptical(25, 25),
                              ),
                              child: Ink(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.elliptical(25, 25),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.arrow_back_rounded,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(
                                'Pokedex',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Text(
                                "#${pokemon.id}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return const SizedBox();
            }
          }),
    );
  }
}
