
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp>{
  var _perguntaSelecionada =0;

  void _responder(){
    setState(() {
    _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  ///String e objeto porque a resposta vai ser uma lista de respostas
  //final List <Map<String,Object>>perguntas=[
    final perguntas =[ //Usando inferencia - Os dois métodos funcionam
    {
      'texto':'Qual é o sua cor favorita?',
      'respostas':['Preto','vermelho','Verde','Branco'],
    },
    {
      'texto':'Qual é o seu animal favorito?',
      'respostas':['Coelho','Cobra','Elefante','Leão'],
    },
    {
      'texto':'Qual é o seu instrutor favorito??',
      'respostas':['Maria','João','Léo','Pedro'],
    }
  ];

  Widget build(BuildContext context){

    List<String> respostas = perguntas[_perguntaSelecionada].cast()['respostas'];

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
        body: Column(
          children: [
            Column(
              children: [
               Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
                ...respostas.map((t) => Resposta(t, _responder)).toList(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget{

  _PerguntaAppState createState(){
    return _PerguntaAppState();
  }

}