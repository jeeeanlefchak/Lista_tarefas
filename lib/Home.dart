import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List _listaTarefas = [];

    _salvarArquivo() async {
      final diretorio = await getApplicationDocumentsDirectory();
      var arquivo = File("${diretorio.path}/dados.json");

      Map<String, dynamic> tarefa = Map();
      tarefa["titulo"] = "ir ao mercado";
      tarefa["Realizada"] = false;
      _listaTarefas.add(tarefa);

      String dados = json.encode(_listaTarefas);
      arquivo.writeAsString(dados);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tarefas"),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.purple,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Adicionar"),
                    content: TextField(
                      decoration:
                          InputDecoration(labelText: "Digite sua tarefa"),
                      onChanged: (text) => {},
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("Cancelar"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      FlatButton(
                        child: Text("Salvar"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  );
                });
          }),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
            itemCount: _listaTarefas.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_listaTarefas[index]),
              );
            },
          ))
        ],
      ),
    );
  }
}
