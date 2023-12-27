// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../controller/view_controller.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.label,
      required this.viewController,
      required this.textController,
      this.onButtonTapped})
      : super(key: key);
  final String label;
  final ViewController viewController;
  final TextEditingController textController;
  final Function? onButtonTapped;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () async {
                onButtonTapped != null ? onButtonTapped!() : null;
              },
              icon: Icon(Icons.search)),
          label: Text(label),
          labelStyle: TextStyle(color: Colors.blue),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 3),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(10))),
    );
  }
}
