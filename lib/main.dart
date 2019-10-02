import 'package:contador_fodinha/jogo.dart';
import 'package:contador_fodinha/models/participante.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: "Contador de Fodinha",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nomeUsuario = TextEditingController();
  List<Participante> participantes= [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              if(participantes != []){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> JogoPage(participantes: participantes)));
              }
              
            },
            child: Icon(Icons.play_circle_outline, color: Colors.white,),
          )
        ],
        title: Text("Contador Fodinha"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.amber,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                controller: _nomeUsuario,
                decoration: InputDecoration(
                    hintText: "Nome do novo Participante",
                    hintStyle: TextStyle(color: Colors.white),
                    icon: Icon(Icons.new_releases)),
              ),
            ),
            FlatButton(
              color: Colors.amberAccent,
              onPressed: () {
                print(_nomeUsuario.text);
                if(_nomeUsuario.text != ''){
                  setState(() {
                  participantes.add(Participante(nome: _nomeUsuario.text));
                  _nomeUsuario.text = '';
                });
                }
                
              },
              child: Text("Adicionar Participante"),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: participantes != null
                    ? ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return CardParticipante(
                            participante: participantes[index],
                          );
                        },
                        itemCount: participantes.length,
                      )
                    : Center(
                        child: Text("Nenhum Participante cadastrado"),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardParticipante extends StatefulWidget {
  final Participante participante;
  CardParticipante({this.participante});

  @override
  _CardParticipanteState createState() => _CardParticipanteState();
}

class _CardParticipanteState extends State<CardParticipante> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Text(widget.participante.nome),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.black
        ),
      ),
    );
  }
}
