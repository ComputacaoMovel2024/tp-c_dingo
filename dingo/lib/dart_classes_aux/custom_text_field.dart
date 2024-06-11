import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String placeholderText;
  final bool isObscure;
  final Icon customPrefixIcon;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.placeholderText,
    required this.isObscure,
    required this.customPrefixIcon,
    required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        controller: _controller,
        autocorrect: false,
        obscureText: widget.isObscure,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: widget.customPrefixIcon,
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
              _controller.clear();
            },
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          labelText: widget.placeholderText,
          hintText: widget.placeholderText,
        ),
      ),
    );
  }
}