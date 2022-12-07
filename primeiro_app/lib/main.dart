
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primeiro_app/questionario.dart';
import 'package:primeiro_app/resultado.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(new PerguntaApp());


class _PerguntaAppState extends State<PerguntaApp>{


  var _pontuacaoTotal=0;
  var _perguntaSelecionada =0;

  bool get temPerguntaSelecionada{
    return _perguntaSelecionada< _perguntas.length;
  }

  void _responder(int pontuacao){
    if(temPerguntaSelecionada){
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal+=pontuacao;
      });
    }
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada =0;
      _pontuacaoTotal =0;
    });
}

  ///String e objeto porque a resposta vai ser uma lista de respostas
  //final List <Map<String,Object>>perguntas=[
    final _perguntas = const [ //Usando inferencia - Os dois métodos funcionam
    {
      'texto':'Qual é o sua cor favorita?',
      'respostas':[
        {'texto':'Preto','pontuacao':10 },
        {'texto':'vermelho','pontuacao':5},
        {'texto':'Verde','pontuacao':3},
        {'texto':'Branco','pontuacao':1}
      ],
    },
    {
      'texto':'Qual é o seu animal favorito?',
      'respostas':[
        {'texto':'Coelho','pontuacao':10 },
        {'texto':'Cobra','pontuacao':5},
        {'texto':'Elefante','pontuacao':3},
        {'texto':'Leão','pontuacao':1}
        ],
    },
    {
      'texto':'Qual é o seu instrutor favorito??',
      'respostas':[
        {'texto':'Leo','pontuacao':10 },
        {'texto':'Maria','pontuacao':5},
        {'texto':'João','pontuacao':3},
        {'texto':'Pedro','pontuacao':1}
        ],
    }
  ];



  Widget build(BuildContext context){

    //Código Imperativo
      /*
      for(var textoResp in perguntas[_perguntaSelecionada].cast()['respostas']){
        respostas.add(Resposta(textoResp, _responder));
      }*/

    //Código declarativo
      ///Pode usar o maps para transformar uma lista de um tipo
      /// em uma lista de outro tipo
      // List<Widget> widgets =respostas.map((t) => Resposta(t, _responder)).toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              quandoResponder: _responder)
            : Resultado(_pontuacaoTotal,_reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget{

  _PerguntaAppState createState(){
    return _PerguntaAppState();
  }

}