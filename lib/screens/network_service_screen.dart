import 'package:flutter/material.dart';

class NetworkServiceScreen extends StatefulWidget{
  NetworkServiceScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NetworkServiceScreenState();
  }
  
}
class NetworkServiceScreenState extends State<NetworkServiceScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Text('Welcome to Network Service Screen'),
      ],
    );
  }
  
}