import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {

  final TextEditingController controller;
  final String hint;
  final Icon prefixIcon;
  final Color fillColor;
  final bool obscureText;
  final String? Function(String?)? validator;
  final String label;

  CustomFormField({
    super.key,
    required this.validator,
    required this.prefixIcon,
    required this.controller,
    required this.hint,
    this.obscureText = false,
    required this.fillColor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height:4),
        TextFormField(
          controller: controller,
          obscureText : obscureText,
          decoration: InputDecoration(
              hintText: hint,
              prefixIcon: prefixIcon,
              fillColor: Colors.grey.shade300,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      color: Colors.grey.shade500,
                      width:1.5
                  )
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      color: Colors.indigo.shade500,
                      width:1.5
                  )
              )
          ),
          style:TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
          validator: validator,
        ),
      ],
    );
  }
}