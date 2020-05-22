Widget drawer(String type) => new Drawer(
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