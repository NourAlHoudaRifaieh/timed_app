import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

  File? selectedImage;

  Future<void> pickImageFromGallery() async{
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: pickImageFromGallery,
              child: Container(
                clipBehavior: Clip.none,
                width: 270,
                height:270,
                padding: selectedImage == null ? EdgeInsets.all(15): EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.white60,
                  border: Border.all(
                    color: Colors.indigo.shade500,
                    width:2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.indigo.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                  image: selectedImage != null
                      ? DecorationImage(
                    image: FileImage(selectedImage!),
                    fit: BoxFit.cover,
                  )
                      : null,
                ),
                child: selectedImage == null
                    ?  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_a_photo_outlined, color: Colors.indigo, size: 40),
                    SizedBox(height:20),
                    Text('No Image Selected', style: TextStyle(fontSize:22, fontWeight: FontWeight.bold, color: Colors.indigo)),
                    SizedBox(height:15),
                    Text('Tap below to choose a photo from your gallery', textAlign: TextAlign.center, style: TextStyle(fontSize:16, color: Colors.black)),
                  ],
                )
                    : null,
              ),
            ),
            SizedBox(height:20),
            CustomElevatedButton(
                text: 'Select Image',
                onPressed: pickImageFromGallery
            ),
          ],
        ),
    );
  }
  
}