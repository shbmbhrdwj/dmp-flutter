import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaddedTextField extends StatelessWidget {
  PaddedTextField(
      {@required this.labelText,
      @required this.padding,
      this.key,
      this.controller,
      this.initialValue,
      this.decoration: const InputDecoration(),
      this.keyboardType,
      this.textCapitalization: TextCapitalization.none,
      this.textInputAction,
      this.style,
      this.obscureText: false,
      this.autocorrect: true,
      this.autovalidate: false,
      this.maxLengthEnforced: true,
      this.maxLines: 1,
      this.maxLength,
      this.onEditingComplete,
      this.onSaved,
      this.validator,
      this.inputFormatters,
      this.enabled: true,
      this.scrollPadding: const EdgeInsets.all(20.0),
      this.enableInteractiveSelection: true});

  final String labelText;
  final EdgeInsets padding;
  final FormFieldValidator<String> validator;

  final Key key;
  final TextEditingController controller;
  final String initialValue;
  final InputDecoration decoration;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final TextStyle style;
  final bool obscureText;
  final bool autocorrect;
  final bool autovalidate;
  final bool maxLengthEnforced;
  final int maxLines;
  final int maxLength;
  final VoidCallback onEditingComplete;
  final FormFieldSetter<String> onSaved;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: this.key,
      padding: this.padding,
      child: TextFormField(
          decoration: InputDecoration(
            labelText: this.labelText,
          ),
          obscureText: this.obscureText,
          validator: this.validator,
          keyboardType: this.keyboardType,
          onSaved: this.onSaved,
          initialValue: this.initialValue,
          autovalidate: this.autovalidate),
    );
  }
}
