import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _itens = [];

  void _carregarItens(){

    _itens = [];

    for(int i = 0; i <= 10; i++){
      Map<String, dynamic> item = Map();
      item["titulo"] = "Titulo ${i} Lorem ipstun dolor sit amet.";
      item["descricao"] = "Descricao ${i} ipsun dolor sit amet.";
      _itens.add(item);
    }
  }
  @override
  Widget build(BuildContext context) {

    _carregarItens();

    return Scaffold(
      appBar: AppBar(
          title: Text("Visualização de listas")
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        //child: Text("Romildo Alves de Lima Junior"),
        child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context, indice){

              //Map<String, dynamic> item = _itens[indice];
              //print("item ${_itens[indice]["titulo"] }");

              return ListTile(
                onTap: (){
                  //print("clique com onTap ${indice}");
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text( _itens[indice]["titulo"]),
                          titlePadding: EdgeInsets.all(20),
                          titleTextStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.orange,
                          ),
                          content: Text(_itens[indice]["descricao"]),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: (){
                                  print("Selecionado sim");
                                  Navigator.pop(context);
                                },
                                child: Text("Sim"),
                            ),
                            FlatButton(
                              onPressed: (){
                                print("Selecionado não");
                                Navigator.pop(context);
                              },
                              child: Text("Não"),
                            ),

                          ],
                          backgroundColor: Colors.white,
                          contentTextStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.deepOrange,
                          ),

                        );
                      }
                  );
                },
               /* onLongPress: (){
                  print("clique com onLongPress");
                },*/
                title: Text(_itens[indice]["titulo"]),
                subtitle: Text(_itens[indice]["descricao"]),
              );
            },
        ),
        ),
    );

  }
}
