import 'package:flutter/material.dart';
import 'package:http/http.dart'; as; http;
import 'dart:async';
import 'dart:convert'

void main() => runApp(RecuperacionValentina());

class RecuperacionValentina extends StatelessWidget {
  const RecuperacionValentina({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Solution",
      home: Recuperacion(),
    );
  }
}

class Recuperacion extends StatefulWidget {
  Recuperacion({Key key}) : super(key: key);

  @override
  RecuperacionState createState() => RecuperacionState();
}

class RecuperacionState extends State<Recuperacion> {
  List data;
  Future <String> ObtenerFrase()async{
    var response=await http.get(Uri.encodeFull("https://allugofrases.herokuapp.com/frases/random"),
       headers:{
       "Accept: application/json"
       }
    );
    data = json.decode(response.body);
    print(data["id"]);
    idController.text = data["id"];
    fraseController.text = data["frase"];
    autorController.text = data["autor"];
    libroController.text = data["libro"];
    return "Success";
  }
  final TextEditingController idController = new TextEditingController();
  final TextEditingController fraseController = new TextEditingController();
  final TextEditingController autorController = new TextEditingController();
  final TextEditingController libroController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RECUPERACION-VALENTINA"),
      ),
      backgroundColor: Colors.brown,
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Image.network(
                "https://p16-va-default.akamaized.net/img/musically-maliva-obj/0dfb10168d09aaf0f7ce3a48d4f7d9e3~c5_720x720.jpeg"),
          )
            new RaisedButton(
            child: new Text("Frase Celebre"),
            onPressed: ObtenerFrase,
          )
          TextFormField(
            controller: idController,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
                icon: Icon(Icons.icecream, color: Colors.white70),
                hintText: "ID",
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70)),
                hintStyle: TextStyle(color: Colors.white70)),
          ),
          TextFormField(
            controller: idController,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
                icon: Icon(Icons.icecream, color: Colors.white70),
                hintText: "Frase",
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70)),
                hintStyle: TextStyle(color: Colors.white70)),
          ),
          TextFormField(
            controller: idController,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
                icon: Icon(Icons.icecream, color: Colors.white70),
                hintText: "Autor",
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70)),
                hintStyle: TextStyle(color: Colors.white70)),
          ),
          TextFormField(
            controller: idController,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
                icon: Icon(Icons.icecream, color: Colors.white70),
                hintText: "Libro",
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70)),
                hintStyle: TextStyle(color: Colors.white70)),
          ),

        ],
      ),
    );
  }
}
