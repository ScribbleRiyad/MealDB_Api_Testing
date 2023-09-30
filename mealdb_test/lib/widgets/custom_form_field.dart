import 'package:flutter/material.dart';

import '../utils/theme_styles.dart';


class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      this.hint,
      this.controller,
      this.onChanged,
      this.maxLines,
      this.textInputType,
      this.obscureText,
      this.onFieldSubmitted,
      this.onEditingComplete,
      this.validator,
      this.suffixIcon,
      this.color,
      this.onFinished,
      this.horizontalPadding,
      this.verticalPadding,
      this.fillColor,
      this.labelText,this.fontColor,
        this.hintFontWeight,
        this.hintFontSize,
        this.enabled,
      this.hintColor})
      : super(key: key);

  final String? hint;

  final int? maxLines;
  final ValueChanged? onChanged;
  final ValueChanged? onFinished;
  final VoidCallback? onEditingComplete;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final String? Function(String)? onFieldSubmitted;
  final bool? obscureText;
  final bool? enabled;
  final Widget? suffixIcon;
  final FontWeight? hintFontWeight;
  final Color? color;
  final Color? fillColor;
  final Color? fontColor;
  final String? labelText;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color? hintColor;
 final double? hintFontSize;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      obscureText: obscureText!,
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: TextInputAction.next,
      keyboardType: textInputType ?? TextInputType.emailAddress,
      enabled: enabled ?? true,
      decoration: formInputDecoration(
          suffixIcon: suffixIcon,
          labelText: labelText,
          color: color,
          horizontal: horizontalPadding,
          vertical: verticalPadding,
          hintText: hint!,
          hintColor: hintColor,
          hintFontWeight: hintFontWeight,
          hintFontSize: hintFontSize,
          fillColor: fillColor),
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      style: const TextStyle(fontSize: 14, color: ThemeStyles.blackColor ),
      validator: validator,
      onSaved: onFinished,
    );
  }
}

formInputDecoration(
    {required String hintText,
    Widget? suffixIcon,
    Color? color,
    Color? fillColor,
    Color? hintColor,
    String? labelText,
    FontWeight? hintFontWeight,
    double? hintFontSize,
    double? horizontal,
    double? vertical}) {
  return InputDecoration(
    filled: true,
    fillColor: fillColor ?? Colors.white,
    hintText: hintText,
    labelText: labelText,

    hintStyle: TextStyle(
      fontSize: hintFontSize ?? 14,
      color: hintColor ?? ThemeStyles.secondaryTextColor,
      fontWeight: hintFontWeight ?? FontWeight.normal,
    ),
    suffixIcon: suffixIcon,
    errorStyle: const TextStyle(fontSize: 10, color: Colors.red),
    labelStyle: const TextStyle(
      fontSize: 16,
      color: Colors.black,
    ),
    contentPadding: EdgeInsets.symmetric(
        horizontal: horizontal ?? 10, vertical: vertical ?? 10),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15.00),
      ),
    ),
    disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: color ?? const Color(0xffF1F1F1), width: 0),
    borderRadius: const BorderRadius.all(
      Radius.circular(15.00),
    ),
  ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color ?? const Color(0xffF1F1F1), width: 0),
      borderRadius: const BorderRadius.all(
        Radius.circular(15.00),
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.black12, width: 1),
      borderRadius: const BorderRadius.all(
        Radius.circular(15.00),
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.black12, width: 1),
      borderRadius: const BorderRadius.all(
        Radius.circular(15.00),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.black12, width: 1),
      borderRadius: const BorderRadius.all(
        Radius.circular(15.00),
      ),
    ),
  );
}
