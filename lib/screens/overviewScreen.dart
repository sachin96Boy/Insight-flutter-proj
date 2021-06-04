import 'package:flutter/material.dart';


import '../widgets/appDrawer.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({ Key? key }) : super(key: key);

  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Installer'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Body of the application'),
      ),
    );
  }
}