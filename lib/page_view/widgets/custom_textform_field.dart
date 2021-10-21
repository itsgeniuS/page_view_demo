import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.labelText,
    this.hintText,
    this.isPwdType = false,
    required this.controller,
    this.maxLines = 1,
    this.minLines = 1,
    this.isEnabled = true,
    this.borderHeight = 50,
    this.keyboardType = TextInputType.text,
    this.inputAction = TextInputAction.done,
    this.focusNode,
    this.onChange,
    this.onFieldSubmit,
  }) : super(key: key);

  final String labelText;
  final String? hintText;
  final bool isPwdType;
  final double borderHeight;
  final bool isEnabled;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final int maxLines;
  final int minLines;
  final TextInputAction inputAction;
  final FocusNode? focusNode;
  final void Function(String)? onChange;
  final void Function(String)? onFieldSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(labelText),
        const SizedBox(height: 4.0),
        SizedBox(
          height: borderHeight,
          child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: isPwdType,
              enabled: isEnabled,
              maxLines: maxLines,
              minLines: minLines,
              textInputAction: inputAction,
              focusNode: focusNode,
              onChanged: onChange,
              onFieldSubmitted: onFieldSubmit,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 16.0),
                hintText: hintText,
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black38),
                    borderRadius: BorderRadius.circular(6.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black38),
                    borderRadius: BorderRadius.circular(6.0)),
                disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black38),
                    borderRadius: BorderRadius.circular(6.0)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black38),
                    borderRadius: BorderRadius.circular(6.0)),
              )),
        ),
      ],
    );
  }
}
