import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // importa todos os widgets do material design

void main() {
  runApp(MaterialApp(
      title: "Contador de Pessoas", // titulo do app
      debugShowCheckedModeBanner: false,
      home: Home()));
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _texto = "Pode Entrar!";
  int _people = 0;


  void _mudarNumPessoas(int delta){
    setState(() {
      _people = _people +delta;

      if(_people == 15){
        _texto = "Lotado!";
      }else{
        _texto = "Pode Entrar!";
      }


    });//executa o código e muda o estado atualizando a tela

  }


  @override
  Widget build(BuildContext context) {
    return Material( child: Stack( // o primeiro wid fica no fundo e os dps fica por cima
      children: <Widget>[
        Image.asset("images/festinha.jpg",
            fit: BoxFit.cover, height: 1000.0),
        //boxfit."cover" ocupa a tela com toda a imagem
        Column(
          // alinha toda a coluna ao centro
          mainAxisAlignment: MainAxisAlignment.center,
          //widget para colocar elementos um em cima da outro
          children: <Widget>[

            Padding(
            padding: EdgeInsets.all(30.0),
              child: Text(
                "Festa 2020",
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 40.0),
              ),
            ),

            Text(
              "Pessoas: $_people",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 40.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  //dar espaçamento ao redor do botão
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(
                          fontSize: 40.0,
                          color: Colors
                              .white), //coloca o filho do flatButton que no caso so pode ser um
                    ),
                    onPressed: () {
                      if (_people == 15) {
                        _mudarNumPessoas(0);
                      } else {
                        _mudarNumPessoas(1);
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(
                          fontSize: 40.0,
                          color: Colors
                              .white), //coloca o filho do flatButton que no caso so pode ser um
                    ),
                    onPressed: () {
                      if (_people > 0) {
                        _mudarNumPessoas(-1);
                      } else {
                        _mudarNumPessoas(0);
                      }
                    },
                  ),
                ),
              ],
            ),
            Text(
              _texto,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    ),
    );
  }
}
