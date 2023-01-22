import 'package:flutter/material.dart';
import 'package:greeny_app/themes/themes.dart';
// ******************************************
// CUSTOM TEXTFORMFIELD  ********************
// ******************************************

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key, required this.title, this.icon, this.eyePassword, 
    required this.isPassword, this.keyboardType, this.onPressed, this.validator, this.onChange,
  }) : super(key: key);

  final String title;
  final IconData? icon;
  final IconData? eyePassword;
  final bool isPassword;
  final TextInputType? keyboardType;
  final Function()? onPressed;
  final String? Function(String?)? validator;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: size.width,
      height: size.height*0.07,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: onChange,
            keyboardType: keyboardType,
            decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Apptheme.secondary, width: 0.5)),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Apptheme.primary)),
            focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Apptheme.red)),
            icon: Icon(icon, color: Apptheme.primaryMediumClear),
            hintText: title,
            hintStyle: Apptheme.textSecondaryMediumLarge,
            labelStyle: Apptheme.textGreenMedium,
            suffixIcon: IconButton(
              onPressed: onPressed, 
              icon: Icon(eyePassword), color: Apptheme.primaryMediumClear
              ),
          ),
          validator: validator,
          obscureText: isPassword,
        ),
      );
  }
}

