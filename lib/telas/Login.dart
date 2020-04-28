import 'package:flutter/material.dart';

// Define a custom Form widget.
class Login extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<Login> {

  final myController = TextEditingController(text: 'test4567@example.com');
  final myController2 = TextEditingController(text: 'password');

  getReq(){
    print('linda função');
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
              // padding: new EdgeInsets.all(2.0),
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: 
                Center( child: Icon(Icons.add_shopping_cart, size: 54, color: Colors.lightGreen)
                ),
                ),
              ),
            ),
          
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
                      color: Colors.green,
                      
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
                // Navigator.pushNamed(context, '/cadastro');
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

