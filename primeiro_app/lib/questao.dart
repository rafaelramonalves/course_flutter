import 'package:flutter/material.dart';

class Questao extends StatelessWidget {

  final String texto;

  Questao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, //valor máximo da tela
      margin: EdgeInsets.all(10),
      child: Text(
          texto,
          style: TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
      ),
    );
  }
}
