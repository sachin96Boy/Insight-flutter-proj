import 'package:flutter/material.dart';
import 'package:myinstallerapp/screens/addActivityScreen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('INSIGHT'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            // onTap: ,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.local_activity),
            title: const Text('Add Activity'),
            onTap:()=> Navigator.of(context).pushReplacementNamed(AddActivityScreen.routeName),
          )
        ],
      ),
    );
  }
}