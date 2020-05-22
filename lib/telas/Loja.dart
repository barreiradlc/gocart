import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './Lojas.dart';

class Loja extends StatefulWidget {
  @override
  LojaState createState() => LojaState();
}

class LojaState extends State<Loja> {
  @override
  Widget build(BuildContext context) {

    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    final items = List<String>.generate(40, (i) => "Item $i");
    // final title = ags.title;

    final white = Colors.white;
    final black = Colors.blue;


    print(args);

    modalItem(item) {
      print(item);

      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: Text('$item'),
                content: Text('Deseja reservar $item?'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () =>  Navigator.pop(context),
                    child: Text('Não'),
                  ),
                  FlatButton(
                    onPressed: () =>  Navigator.pop(context),
                    child: Text('Sim'),
                  ),
                ]);
          });

      //   CupertinoAlertDialog(
      //   title: Text('$item'),
      //   content: Text('Deseja reservar $item?'),
      //   actions: <Widget>[
      //     CupertinoDialogAction( child: Text("Sim")),
      //     CupertinoDialogAction(child: Text("Não")),
      //   ],
      // );
    }

    var drawer = Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('Olá *usuário*'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () =>  Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('Itens reservados'),
            onTap: () => Navigator.pushReplacementNamed(context, '/reservas'),
          ),
          ListTile(
            leading: Icon(Icons.store),
            title: Text('Lojas próximas'),
            onTap: () => Navigator.pushReplacementNamed(context, '/lojas'),
            
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Avaliar'),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white70,
      // drawer: drawer,
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(

              constraints: BoxConstraints(),
              margin: EdgeInsets.only(top: 15, left: 10, right: 10),
              color: white,
              child: ListTile(
                  leading: Icon(
                    Icons.confirmation_number,
                    color: black,
                    size: 34,
                  ),
                  onTap: () => modalItem(items[index]),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  title: Text(
                    '${items[index]}',
                    style: TextStyle(fontSize: 20, color: black),
                  ),
                  subtitle: Text(
                    'Algo mais sobre o item ${items[index]}',
                    style: TextStyle(color: black),
                  )));
        },
      ),
    );
  }
}


