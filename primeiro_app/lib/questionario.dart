import 'package:flutter/material.dart';
import 'package:primeiro_app/questao.dart';
import 'package:primeiro_app/resposta.dart';


class Questionario extends StatelessWidget {

  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  Questionario(
    {
     required this.perguntas,
     required this.perguntaSelecionada,
     required this.quandoResponder,
    }
  );

  bool get temPerguntaSelecionada{
    return perguntaSelecionada< perguntas.length;
  }

  @override
  Widget build(BuildContext context) {

    List<Map<String,Object>> respostas = temPerguntaSelecionada ?
    perguntas[perguntaSelecionada].cast()['respostas'] : []; //NullSafety


    return Column(
      children: [
        Column(
          children: [
            Questao(perguntas[perguntaSelecionada]['texto'].toString()),
            ...respostas.map((resp) => Resposta(resp['texto'] as String, ()=>quandoResponder(int.parse(resp['pontuacao'].toString()))))
                .toList(),
          ],
        )
      ],
    );
  }
}
