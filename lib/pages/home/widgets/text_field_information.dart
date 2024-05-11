import 'package:flutter/material.dart';

class TextFieldInformation extends StatefulWidget {
  const TextFieldInformation({
    super.key,
    required this.size,
    required this.controller,
    required this.text,
    required this.isLoading,
  });

  final Size size;
  final TextEditingController controller;
  final String text;
  final bool isLoading;

  @override
  State<TextFieldInformation> createState() => _TextFieldInformationState();
}

class _TextFieldInformationState extends State<TextFieldInformation> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: widget.size.width * 0.3,
          height: widget.size.height * 0.1,
          child: TextField(
            enabled: widget.isLoading == false ? true : false,
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: widget.text,
            ),
          ),
        ),
      ],
    );
  }
}
