import 'package:contador_fodinha/models/participante.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class JogoPage extends StatefulWidget {
  final List<Participante> participantes;

  JogoPage({this.participantes});
  @override
  _JogoPageState createState() => _JogoPageState();
}

class _JogoPageState extends State<JogoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Jogo"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.amber,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    print(index);
                    return CardJogador(
                        participante: widget.participantes[index]);
                  },
                  itemCount: widget.participantes.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardJogador extends StatefulWidget {
  Participante participante;
  CardJogador({this.participante});

  @override
  _CardJogadorState createState() => _CardJogadorState();
}

class _CardJogadorState extends State<CardJogador> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                if (widget.participante.pontos > 0) {
                  print(widget.participante.pontos);
                  setState(() {
                    widget.participante.pontos = widget.participante.pontos - 1;
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
                  width: 40,
                  height: 40,
                  child: Text('-',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                ),
              ),
            ),
            Container(
              width: 80,
              child: AutoSizeText(
                '${widget.participante.nome}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                maxLines: 2,
                maxFontSize: 15,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (widget.participante.pontos < 5) {
                  setState(() {
                    widget.participante.pontos = widget.participante.pontos + 1;
                  });
                }
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  width: 40,
                  height: 40,
                  child: Text('+',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 30),
                child: widget.participante.pontos == 5
                    ? Text(
                        'Eliminado',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )
                    : Text(
                        '${widget.participante.pontos}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
              ),
            )
          ],
        ),
        height: 70,
      ),
    );
  }
}
