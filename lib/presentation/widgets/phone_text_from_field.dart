import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';

class PhoneTextFromField extends StatefulWidget {
  final String initialValue;
  final String label;
  final int? maxLength;
  final void Function(String)? onChanged;
  const PhoneTextFromField({
    super.key,
    required this.initialValue,
    required this.label,
    this.maxLength,
    this.onChanged,
  });

  @override
  State<PhoneTextFromField> createState() => _PhoneTextFromFieldState();
}

class _PhoneTextFromFieldState extends State<PhoneTextFromField> {
  final _controller = TextEditingController();
  final _focus = FocusNode();

  @override
  void initState() {
    _focus.addListener(() {
      if (_focus.hasFocus && _controller.text.length < 3) {
        formatWith7();
      }
    });
    super.initState();
  }

  void formatWith7() {
    _controller.value = _controller.value.copyWith(text: '+7');
    _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      maxLength: widget.maxLength,
      decoration: const InputDecoration(counterText: '', hintText: 'Введите новый номер'),
      focusNode: _focus,
      controller: _controller,
      autofillHints: const [AutofillHints.telephoneNumber],
      inputFormatters: [PhoneInputFormatter()],
      keyboardType: TextInputType.phone,
      onTap: () {
        if (_controller.text.isEmpty) {
          formatWith7();
        }
      },
      onChanged: (val) {
        if (_controller.text.length < 3) {
          formatWith7();
        }
        widget.onChanged!(val);
      },
    );
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }
}
