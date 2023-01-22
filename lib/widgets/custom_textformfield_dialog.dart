import 'package:flutter/material.dart';
import 'package:greeny_app/themes/themes.dart';
// ***************************************
// TEXTFORMFIELD DIALOGS ****************+
// ***************************************
class CustomTextFormFieldDialog extends StatelessWidget {
  const CustomTextFormFieldDialog({
    Key? key, this.onChanged, required this.hintText, this.validator, this.initialValue,
  }) : super(key: key);

  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String hintText;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue ?? '', 
      autofocus: true,
      decoration: InputDecoration(
         enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Apptheme.secondary, width: 0.5)),
         focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Apptheme.primary)),
         focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Apptheme.red)),
         hintStyle: Apptheme.textSecondaryMediumLarge,
         labelStyle: Apptheme.textGreenMedium,
         hintText: hintText
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,  
        validator: validator,
        onChanged: onChanged,
      );
  }
}
