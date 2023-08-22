import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          const UserAccountsDrawerHeader(
              accountName: Text('Kidus Geremew'),
              accountEmail: Text('Kidusg98@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1484515991647-c5760fcecfc7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Z3V5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60"),
              )),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Kidus Geremw'),
            subtitle: Text('Develper'),
            trailing: Icon(Icons.edit),
            onTap: () {}, // like onPress event
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Kidusg98@gmail.com'),
            subtitle: Text('Develper'),
            trailing: Icon(Icons.edit),
            onTap: () {}, // like onPress event
          ),
        ],
      ),
    );
  }
}
