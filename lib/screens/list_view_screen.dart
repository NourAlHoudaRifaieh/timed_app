import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget{
  ListViewScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListViewScreenState();
  }
  
}
class ListViewScreenState extends State<ListViewScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Text('Welcome to List view Screen'),
      ],
    );
  }
  
}