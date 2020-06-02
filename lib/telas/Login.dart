import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:go_cart/recursos/Api.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Define a custom Form widget.
class Login extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<Login> {
  var sucesso;
  var erro ;

  final myController = TextEditingController(text: 'test4567@example.com');
  final myController2 = TextEditingController(text: 'password');

  final user = TextEditingController(text: 'testeUser2');
  final login = TextEditingController(text: 'test45678@example.com');
  final senha = TextEditingController(text: 'password123');



  getReq() async {
    setState(() {
      erro = null;
    });
    SharedPreferences jwt = await SharedPreferences.getInstance();

    loadingWidget();
    print('url');
    print('${host}signin');

    Map jsao = {'email': login.text,  'password': senha.text};

    var data = jsonEncode(jsao);

    print('data');
    print(data);

    var post = http.post(
      Uri.encodeFull("${host}signin"),
      headers: {"Content-Type": "application/json"},
      body: data,
    );

    var response = await post;

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var res = await jsonDecode(response.body);

    if(res['token'] == null){
      if (res['error'] is String){
        var r = [''];
        r[0] = res['error'];
        setState(() {
          erro = r;
        });
      } else {
        print('lista');
        res['error'][0].forEach(( e ) {
          var r = erro != null ? erro : [''];

          r.add(e['msg']);

          print(e['msg']);
          setState(() {
            erro = r;
          });
          print(erro);
        });
      }
    } else {      
      print('sucesso');
      await jwt.setString('jwt', res['token']);
    }

    if(res['token'] != null){
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/home');
    }
  }
  
  loadingWidget() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: 250,
              color: Colors.white10,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                        child: Text('Aguarde...',
                            style: TextStyle(fontSize: 23),
                            textAlign: TextAlign.center)),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.yellow,
                        strokeWidth: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Padding(
          //   padding: const EdgeInsets.all(32.0),
          //   child: Text(
          //     "E-PROJ",
          //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 42),
          //   ),
          // ),
          Transform.scale(
            scale: 1,
            child: Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 31),
              // padding: new EdgeInsets.all(2.0),
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: 
                Center( child: 
                  // Icon(Icons.add_shopping_cart, size: 54, color: Colors.lightGreen)
                  Image.network('https://dynamic.brandcrowd.com/asset/logo/3cfe80ae-f9a9-4bfd-ad83-3fb9950b560d/logo?v=4&text=go+cart')
                ),
                ),
              ),
            ),
          
erro != null ?
              Container(
                color: Colors.red,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15, top:5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Erro!', style: TextStyle(color: Colors.white, fontSize: 23)),
                          IconButton(
                            icon: Icon(Icons.close, color: Colors.white,),
                            onPressed: () {
                              setState(() {
                                erro = null;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: 
                      Wrap(
                        children: erro.map((element) =>
                            new Container(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(element, style: TextStyle(color: Colors.white))
                            ) 
                        ).toList()
                      ),
                    )
                  ],
                ),
              )
              :
              Container(),

          //
          // Form
          //
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: myController,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(50.0),
                          ),
                        ),
                        labelText: 'E-mail',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: myController2,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(50.0),
                          ),
                        ),
                        labelText: 'Senha',
                      ),
                    ),
                  ),
                  

                    RaisedButton(
                      
                      onPressed: getReq,
                      color: Colors.blue,
                      
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 25),
                        child: Text('Login',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      
                    ),

                ]),
          ),

          //
          // Form
          //

          Padding(
            // margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            padding: const EdgeInsets.only(bottom: 30.0),
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cadastro');
              },
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                    'Ainda não tem uma conta? Clique aqui para registrar-se',
                    style: TextStyle(fontSize: 10)),
              ),
            ),
          ),

          // ÍCONES SOCIAIS

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //     IconButton(
          //         // Use the FontAwesomeIcons class for the IconData
          //         icon: new Icon(FontAwesomeIcons.googlePlus),
          //         onPressed: () {
          //           print("Pressed");
          //           return showDialog(
          //             context: context,
          //             builder: (context) {
          //               return AlertDialog(
          //                 // Retrieve the text the that user has entered by using the
          //                 // TextEditingController.
          //                 content: Text("Funcionalidade em Desenvolvimento"),
          //               );
          //             },
          //           );
          //         }),
          //     IconButton(
          //         // Use the FontAwesomeIcons class for the IconData
          //         icon: new Icon(FontAwesomeIcons.facebook),
          //         onPressed: () {
          //           return showDialog(
          //             context: context,
          //             builder: (context) {
          //               return AlertDialog(
          //                 // Retrieve the text the that user has entered by using the
          //                 // TextEditingController.
          //                 content: Text("Funcionalidade em Desenvolvimento"),
          //               );
          //             },
          //           );
          //         })
          //   ],
          // )

          // ÍCONES SOCIAIS
        ],
      ),
      
    );

}
}

