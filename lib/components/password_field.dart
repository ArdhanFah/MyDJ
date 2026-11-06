import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String labelText;

  const PasswordField({
    super.key,
    this.onChanged = _emptyFunction,
    this.labelText = 'Password',
  });

  static void _emptyFunction(String value) {}

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscure,
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
          onPressed: () => setState(() => _obscure = !_obscure),
        ),
      ),
      onChanged: widget.onChanged,
    );
  }
}
