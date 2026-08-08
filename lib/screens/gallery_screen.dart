import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget{
  GalleryScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GalleryScreenState();
  }
  
}
class GalleryScreenState extends State<GalleryScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Text('Welcome to gallery screen'),
      ],
    );
  }
  
}