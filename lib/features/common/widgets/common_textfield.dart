import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:panda_test/utils/color.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({
    super.key,
    this.hint,
    this.errorText,
    this.mask,
    this.initialValue,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.obscureText = false,
    this.moneyInput = false,
    this.upperCaseInput = false,
    this.autofocus = false,
    this.enabled,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.background,
    this.hintColor,
    this.inputColor,
    this.suffix,
    this.prefixIcon,
    this.padding,
    this.controller,
    this.onTap,
    this.onChanged,
    this.suffixPressed,
    this.keyboardType,
    this.inputFormatter,
    this.textInputAction,
    this.focusNode,
    this.focusedBorder = const BorderRadius.all(Radius.circular(16.0)),
    this.enabledBorder = const BorderRadius.all(Radius.circular(16.0)),
  });

  final String? hint;
  final String? errorText;
  final String? mask;
  final String? initialValue;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool obscureText;
  final bool? enabled;
  final bool moneyInput;
  final bool upperCaseInput;
  final bool autofocus;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? background;
  final Color? hintColor;
  final Color? inputColor;
  final Widget? prefixIcon;
  final Widget? suffix;
  final EdgeInsets? padding;
  final BorderRadius focusedBorder;
  final BorderRadius enabledBorder;
  final TextEditingController? controller;
  final GestureTapCallback? onTap;
  final VoidCallback? suffixPressed;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputAction? textInputAction;
  final Function(bool value)? focusNode;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool passwordVisible = true;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    passwordVisible = widget.obscureText;
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    widget.controller?.clear();
    _focusNode.removeListener(_onFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      if (widget.focusNode != null) {
        widget.focusNode!(true);
      }
    } else {
      if (widget.focusNode != null) {
        widget.focusNode!(false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        focusNode: _focusNode,
        initialValue: widget.initialValue,
        autofocus: widget.autofocus,
        enabled: widget.enabled,
        controller: widget.controller,
        onTap: widget.onTap,
        keyboardType: widget.keyboardType,
        obscureText: passwordVisible,
        cursorColor: black,
        onChanged:
            widget.onChanged == null
                ? null
                : (phone) {
                  widget.onChanged!(phone);
                },
        textInputAction: widget.textInputAction,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.background ?? solitude,
          hintText: widget.hint,
          errorText: widget.errorText,
          contentPadding:
              widget.padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          prefixIcon:
              widget.prefixIcon == null
                  ? null
                  : Align(
                    widthFactor: 1,
                    alignment: Alignment.center,
                    child: widget.prefixIcon,
                  ),
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: widget.hintColor ?? grey,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: widget.focusedBorder,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: widget.focusedBorder,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: widget.focusedBorder,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: widget.focusedBorder,
          ),
          suffixIcon:
              widget.obscureText
                  ? IconButton(
                    icon: Icon(
                      passwordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: () {
                      setState(() => passwordVisible = !passwordVisible);
                    },
                  )
                  : widget.suffix != null
                  ? IconButton(icon: widget.suffix!, onPressed: widget.suffixPressed)
                  : null,
        ),
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: widget.inputColor ?? black,
        ),
      ),
    );
  }
}

class PriceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text;

    newText = newText.replaceAll(RegExp(r'\D'), '');

    String formattedText = '';
    int len = newText.length;
    for (int i = len - 1; i >= 0; i--) {
      formattedText = newText[i] + formattedText;
      if ((len - i) % 3 == 0 && i != 0) {
        formattedText = ' $formattedText';
      }
    }

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  final int? maxLength;

  UpperCaseTextFormatter({this.maxLength});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (maxLength != null && newValue.text.length > maxLength!) {
      return oldValue;
    }
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
