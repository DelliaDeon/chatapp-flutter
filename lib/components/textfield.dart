import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String text;
  final bool obscure;
  final TextEditingController controller;

  const MyTextField({
    super.key,
    required this.text,
    required this.obscure,
    required this.controller,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscure,
        decoration: InputDecoration(
          hintText: widget.text,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
          ),
          fillColor: Theme.of(context).colorScheme.primary,
          filled: true,
        ),
      ),
    );
  }
}
