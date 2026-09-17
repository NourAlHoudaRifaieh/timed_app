import 'package:flutter/material.dart';
import 'package:timed_app/widgets/custom_elevated_button.dart';

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
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 350,
              height:350,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white60,
                border: Border.all(
                  color: Colors.indigo.shade500,
                  width:1,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_a_photo_outlined, color: Colors.indigo, size: 40),
                  SizedBox(height:20),
                  Text('No Image Selected', style: TextStyle(fontSize:22, fontWeight: FontWeight.bold, color: Colors.indigo)),
                  SizedBox(height:15),
                  Text('Tap below to choose a photo from your gallery', textAlign: TextAlign.center, style: TextStyle(fontSize:16, color: Colors.black)),
                ],
              ),
            ),
            SizedBox(height:20),
            CustomElevatedButton(
                text: 'Select Image',
                onPressed: (){}
            ),
          ],
        ),
    );
  }
  
}