import 'package:flutter/material.dart';
import 'package:liberty_app/app/theme.dart';

class UnderLinedTextFormField extends StatelessWidget {
  const UnderLinedTextFormField({Key? key, this.label, this.suffix})
      : super(key: key);
  final Widget? label;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: buildInputDecoration(context, label: label, suffix: suffix),
    );
  }

  static InputDecoration buildInputDecoration(
    BuildContext context, {
    Widget? label,
    Widget? suffix,
    Widget? prefix,
    bool? isCollapsed,
  }) {
    return InputDecoration(
      label: label,
      suffixIcon: suffix,
      prefixIcon: prefix,
      prefixIconConstraints: BoxConstraints.tight(const Size(35, 35)),
      isCollapsed: isCollapsed ?? false,
      suffixIconConstraints: BoxConstraints.tight(const Size(23, 23)),
      labelStyle: Theme.of(context)
          .textTheme
          .overline
          ?.copyWith(color: AppColors.lightGray, fontSize: 13),
      border: UnderlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: AppColors.lightGray,
        ),
        borderRadius: BorderRadius.circular(
          AppSizes.searchInputRadius,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: AppColors.lightGray,
        ),
        borderRadius: BorderRadius.circular(
          AppSizes.searchInputRadius,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: AppColors.primary,
        ),
        borderRadius: BorderRadius.circular(
          AppSizes.searchInputRadius,
        ),
      ),
    );
  }
}
