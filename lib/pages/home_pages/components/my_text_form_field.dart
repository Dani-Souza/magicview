import 'package:flutter/material.dart';

class MyTextFormField extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController textEditingController;
  final String labelText;
  final bool obscureText;
  final IconData icon;

  const MyTextFormField(
      {super.key,
      this.validator,
      required this.textEditingController,
      required this.labelText,
      this.obscureText = false,
      required this.icon});

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        validator: widget.validator,
        obscureText: widget.obscureText,
        controller: widget.textEditingController,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
            prefixIcon: Icon(
              widget.icon,
              color: Theme.of(context).colorScheme.primary,
            ),
            labelStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary)),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.onPrimary),
            ),
            labelText: widget.labelText,
            filled: true,
            fillColor: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
