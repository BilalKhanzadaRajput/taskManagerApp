import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colors_resource.dart';
import '../constants/dimensions_resource.dart';
import '../utils/text_styles.dart';
import '../utils/theme_extensions.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final bool enabled;

  const CustomTextField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.suffixIcon,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      validator: validator,
      onChanged: onChanged,
      enabled: enabled,
      style: AppTextStyles.bodyLarge(context).copyWith(
        fontSize: DimensionsResource.FONT_SIZE_16.sp,
        color: context.primaryTextColor,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffixIcon,
        labelStyle: AppTextStyles.label(context).copyWith(
          fontSize: DimensionsResource.FONT_SIZE_14.sp,
          color: context.secondaryTextColor,
        ),
        hintStyle: AppTextStyles.label(context).copyWith(
          fontSize: DimensionsResource.FONT_SIZE_14.sp,
          color: context.secondaryTextColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimensionsResource.RADIUS_8),
          borderSide: BorderSide(color: context.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimensionsResource.RADIUS_8),
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimensionsResource.RADIUS_8),
          borderSide: BorderSide(color: context.errorColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimensionsResource.RADIUS_8),
          borderSide: BorderSide(color: context.errorColor, width: 2),
        ),
        filled: true,
        fillColor: context.cardColor,
        contentPadding: EdgeInsets.symmetric(
          horizontal: DimensionsResource.D_16.w,
          vertical: DimensionsResource.D_16.h,
        ),
      ),
    );
  }
}
