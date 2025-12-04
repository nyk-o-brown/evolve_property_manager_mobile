import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final String? label;
  final String? hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final String? Function(String?)? validator;
  final bool obscureText;
  final int? maxLines;
  final int? minLines;

  const CustomFormField({
    Key? key,
    this.label,
    this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.validator,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
  }) : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      maxLines: _obscureText ? 1 : widget.maxLines,
      minLines: widget.minLines,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hintText,
        border: const OutlineInputBorder(),
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        suffixIcon: widget.suffixIcon != null
            ? IconButton(
                icon: Icon(widget.suffixIcon),
                onPressed: widget.onSuffixIconPressed ?? () {
                  if (widget.obscureText) {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  }
                },
              )
            : null,
      ),
    );
  }
}
