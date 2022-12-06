
import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {

  final String texto;
  final void Function() onPressed;

  Resposta(this.texto, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: Text(
              texto,
            style: TextStyle(
              color: Colors.white
            ),
          ),
          onPressed: onPressed,
      ),
    );
  }
}
