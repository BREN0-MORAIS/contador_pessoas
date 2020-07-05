import 'package:flutter/material.dart'; //importando componentes do Material Designer

void main() {
  //chamando o componente do Material designer
  runApp(MaterialApp(
      //runApp chama as paginas
      title: "Contador de Pessoas",
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 1;
  String entrar = "Pode Entrar";
  void _changePeople(int delta) {
    setState(() {
      //fala para o layout que vai ser atulizado o contador
      _people += delta;
      if (_people == 0) {
        entrar = "Pode Entrar";
      } else if (_people < 0) {
        entrar = "Opa :(";
      } else if (_people > 10) {
        entrar = "Lotado";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //este Widget fica em baixo, por ser a imagen
        Image.asset(
          "images/restaurant.png",
          fit: BoxFit.cover, //cobre todo o fundo da tela
          height: 1000.0,
        ),
        Column(
            mainAxisAlignment:
                MainAxisAlignment.center, //centra liza o widget no meio
            children: <Widget>[
              //permite passar uma lista de Widget , componentes
              Text("Pessoas $_people",
                  style: TextStyle(
                      color: Colors.yellow, fontWeight: FontWeight.normal)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: FlatButton(
                        //FlatButton é um botão sem cor de fundo transparente
                        child: Text("-1",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40)), //definindo o estilo do botão
                        onPressed: () {
                          _changePeople(-1);
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.all(10), //definindo o padding do botão
                      child: FlatButton(
                        //FlatButton é um botão sem cor de fundo transparente
                        child: Text("+1",
                            style:
                                TextStyle(color: Colors.white, fontSize: 40)),
                        onPressed: () {
                          _changePeople(1);
                        },
                      ),
                    ),
                  ]),
              Text("$entrar", //widget de texto
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 30.0)),
            ])
      ],
    );
  }
}
