
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(new PerguntaApp());

class PerguntaAppState extends State<PerguntaApp>{
  var perguntaSelecionada =0;

  void responder(){
    setState(() {
    perguntaSelecionada++;
    });
    print(perguntaSelecionada);
  }

  final perguntas=[
    'Qual é o sua cor favorita?',
    'Qual é o seu animal favorito?'
  ];
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: Column(
          children: [
            Column(
              children: [
                Text(perguntas.elementAt(perguntaSelecionada)),
                TextButton(
                    onPressed: responder,
                    child: Text('Resposta 1')
                ),
                TextButton(
                    onPressed: responder,
                    child: Text('Resposta 2')
                ),
                TextButton(
                    onPressed: responder,
                    child: Text('Resposta 3')
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget{

  PerguntaAppState createState(){
    return PerguntaAppState();
  }

}