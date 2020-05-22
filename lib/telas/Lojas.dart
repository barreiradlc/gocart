import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import '../widgets/Drawer.dart';

class Lojas extends StatefulWidget {
  @override
  LojasState createState() => LojasState();
}

class LojasState extends State<Lojas> {
  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(40, (i) => "Item $i");

    final title = 'Lojas próximas';

    final white = Colors.white;
    final black = Colors.blue;

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
            onTap: () =>  Navigator.pop(context),
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
      backgroundColor: Colors.white,
      drawer: drawer,
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: CustomScrollView(
  primary: false,
  slivers: <Widget>[
    SliverPadding(

      padding: const EdgeInsets.all(20),
      sliver: SliverGrid.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          GestureDetector(
            onTap: () => 
              Navigator.pushNamed(
              context,
              '/loja',
              arguments: 
                ScreenArguments(
                  'Vtex store',
                  'This message is extracted in the build method.',
                ),
              ),
            child: Container(
              padding: const EdgeInsets.all(8),
              child:
              const Text('Vtex store'),
              color: Colors.green[100],
            ),
                      ),
                      GestureDetector(
            onTap: () => 
              Navigator.pushNamed(
              context,
              '/loja',
              arguments: 
                ScreenArguments(
                  'Shopping popular',
                  'This message is extracted in the build method.',
                ),
              ),
            child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text('Shoping popular'),
                        color: Colors.green[200],
                      ),
                      ),
                      GestureDetector(
            onTap: () => 
              Navigator.pushNamed(
              context,
              '/loja',
              arguments: 
                ScreenArguments(
                  'Mercado da esquina',
                  'This message is extracted in the build method.',
                ),
              ),
            child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text('Mercado da esquina'),
                        color: Colors.green[300],
                      ),
                      ),
                      GestureDetector(
            onTap: () => 
              Navigator.pushNamed(
              context,
              '/loja',
              arguments: 
                ScreenArguments(
                  'Feirinha',
                  'This message is extracted in the build method.',
                ),
              ),
            child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text('Feirinha'),
                        color: Colors.green[400],
                      ),
                      ),
                      GestureDetector(
            onTap: () => 
              Navigator.pushNamed(
              context,
              '/loja',
              arguments: 
                ScreenArguments(
                  'Padaria do Juca',
                  'This message is extracted in the build method.',
                ),
              ),
            child:  Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text('Padaria do Juca'),
                        color: Colors.green[500],
                      ),
                      ),
                      GestureDetector(
            onTap: () => 
              Navigator.pushNamed(
              context,
              '/loja',
              arguments: 
                ScreenArguments(
                  'Vtex varejo',
                  'This message is extracted in the build method.',
                ),
              ),
            child:  Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text('Vetx varejo'),
                        color: Colors.green[600],
                      ),
                      ),
                    ],
                  ),
                ),
              ],
            )
                  )
                  // body: ListView.builder(
                  //   itemCount: items.length,
                  //   itemBuilder: (context, index) {
                  //     return Container(
            
                  //         constraints: BoxConstraints(),
                  //         margin: EdgeInsets.only(top: 15, left: 10, right: 10),
                  //         color: white,
                  //         child: ListTile(
                  //             leading: Icon(
                  //               Icons.confirmation_number,
                  //               color: black,
                  //               size: 34,
                  //             ),
                  //             onTap: () => modalItem(items[index]),
                  //             contentPadding:
                  //                 EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  //             title: Text(
                  //               '${items[index]}',
                  //               style: TextStyle(fontSize: 20, color: black),
                  //             ),
                  //             subtitle: Text(
                  //               'Algo mais sobre o item ${items[index]}',
                  //               style: TextStyle(color: black),
                  //             )));
                  //   },
                  // ),
                );
              }
            }
            
            class ScreenArguments {
              final String title;
              final String message;

              ScreenArguments(this.title, this.message);
            }
