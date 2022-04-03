import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:liberty_app/app/theme.dart';
import 'package:liberty_app/presentation/widget/common/assets_icon.dart';
import 'package:liberty_app/presentation/widget/common/underlined_text_field.dart';

class DateFormPicker extends StatelessWidget {
  const DateFormPicker(
      {Key? key, required this.selectedDateHandler, this.label, this.suffix})
      : super(key: key);
  final String? label;
  final Widget? suffix;

  final void Function(DateTime? dateTime) selectedDateHandler;

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("dd-MM-yyyy");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom:8.0),
            child: Text(label!,
                style: Theme.of(context)
                    .textTheme
                    .overline
                    ?.copyWith(color: AppColors.lightGray, fontSize: 13)),
          ),
        DateTimeField(
          format: format,
          onChanged: selectedDateHandler,
          decoration: UnderLinedTextFormField.buildInputDecoration(
            context,
            // label: label,
            suffix: Container(),
            prefix: Padding(
              padding: const EdgeInsets.only(right: 5.0, bottom: 8),
              child: AssetsSvg.timeCalender(
                  width: 30, height: 30, color: AppColors.lightGray),
            ),
            isCollapsed: false,
          ),
          onShowPicker: (context, currentValue) {
            return showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));
          },
        ),
      ],
    );
  }
}
