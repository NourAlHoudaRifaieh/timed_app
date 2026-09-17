import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  CustomElevatedButton({
      super.key,
      required this.text,
      required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.indigo,
            elevation: 5,
            shadowColor: Colors.indigo,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            )
        ),
        child: Text(text,
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)
        ),
    );
  }
}
