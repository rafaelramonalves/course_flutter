import 'package:flutter/material.dart';
import 'package:primeiro_app/main.dart';

class Resultado extends StatelessWidget {

  final int pontuacao;
  final void Function () quandoReiniciarQuestionario;

  String get fraseResultado{
    if(pontuacao<8){
      return 'Parabéns';
    }else if (pontuacao<12){
      return 'Você é bom';
    }else if (pontuacao<16){
      return 'Impressionante';
    }else{
      return "Nivel Jedi";
    }
  }

  Resultado(this.pontuacao,this.quandoReiniciarQuestionario);


  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(
                fontSize: 28
            ),
          ),
        ),
        TextButton(
            onPressed: quandoReiniciarQuestionario,
            child: Text("Reiniciar?")
        )
      ],
    );
  }
}
