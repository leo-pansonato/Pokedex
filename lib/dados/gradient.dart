import 'package:flutter/material.dart';

List<Color> getGradientColors1(String tipo) {
  Color corStart = const Color.fromARGB(0, 255, 255, 255);
  Color corEnd = const Color.fromARGB(0, 255, 255, 255);

  if (tipo == "steel") {
    corStart = const Color.fromRGBO(80, 131, 158, 1);
    corEnd = const Color.fromRGBO(94, 169, 174, 1);
  } else if (tipo == "water") {
    corStart = const Color.fromRGBO(68, 132, 193, 1);
    corEnd = const Color.fromRGBO(112, 182, 216, 1);
  } else if (tipo == "dragon") {
    corStart = const Color.fromRGBO(20, 100, 173, 1);
    corEnd = const Color.fromRGBO(9, 129, 179, 1);
  } else if (tipo == "electric") {
    corStart = const Color.fromARGB(255, 255, 220, 42);
    corEnd = const Color.fromARGB(255, 243, 225, 122);
  } else if (tipo == "fairy") {
    corStart = const Color.fromRGBO(236, 138, 225, 1);
    corEnd = const Color.fromRGBO(236, 172, 232, 1);
  } else if (tipo == "ghost") {
    corStart = const Color.fromRGBO(80, 108, 171, 1);
    corEnd = const Color.fromRGBO(98, 115, 195, 1);
  } else if (tipo == "fire") {
    corStart = const Color.fromRGBO(230, 178, 102, 1);
    corEnd = const Color.fromRGBO(241, 150, 93, 1);
  } else if (tipo == "ice") {
    corStart = const Color.fromRGBO(113, 207, 189, 1);
    corEnd = const Color.fromRGBO(141, 207, 219, 1);
  } else if (tipo == "bug") {
    corStart = const Color.fromRGBO(130, 193, 60, 1);
    corEnd = const Color.fromRGBO(169, 195, 43, 1);
  } else if (tipo == "fighting") {
    corStart = const Color.fromRGBO(201, 65, 107, 1);
    corEnd = const Color.fromRGBO(234, 63, 83, 1);
  } else if (tipo == "normal") {
    corStart = const Color.fromRGBO(143, 152, 161, 1);
    corEnd = const Color.fromRGBO(160, 173, 173, 1);
  } else if (tipo == "rock") {
    corStart = const Color.fromRGBO(204, 181, 138, 1);
    corEnd = const Color.fromRGBO(216, 205, 152, 1);
  } else if (tipo == "grass") {
    corStart = const Color.fromRGBO(91, 185, 90, 1);
    corEnd = const Color.fromRGBO(91, 190, 117, 1);
  } else if (tipo == "psychic") {
    corStart = const Color.fromRGBO(244, 112, 120, 1);
    corEnd = const Color.fromRGBO(255, 166, 145, 1);
  } else if (tipo == "dark") {
    corStart = const Color.fromRGBO(90, 81, 101, 1);
    corEnd = const Color.fromRGBO(108, 118, 137, 1);
  } else if (tipo == "ground") {
    corStart = const Color.fromRGBO(220, 119, 65, 1);
    corEnd = const Color.fromRGBO(216, 153, 103, 1);
  } else if (tipo == "poison") {
    corStart = const Color.fromRGBO(162, 103, 197, 1);
    corEnd = const Color.fromRGBO(200, 95, 212, 1);
  } else if (tipo == "flying") {
    corStart = const Color.fromRGBO(146, 169, 223, 1);
    corEnd = const Color.fromRGBO(165, 195, 242, 1);
  }
  return [corStart, corEnd];
}
