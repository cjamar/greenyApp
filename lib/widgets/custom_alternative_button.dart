import 'package:flutter/material.dart';
import 'package:greeny_app/themes/themes.dart';
import 'package:greeny_app/widgets/widgets.dart';

class CustomAlternativeButton extends StatelessWidget {
  const CustomAlternativeButton({
    Key? key,
    required this.size, required this.title, required this.titleButon, this.onPressed,
  }) : super(key: key);

  final Size size;
  final String title;
  final String titleButon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: size.width,
        height: size.height*0.11,
        decoration: BoxDecoration(
          color: Apptheme.primaryClear,
          borderRadius: const BorderRadius.only(topRight: Radius.circular(60), topLeft: Radius.circular(60))
        ),
        child: Container(
          margin: const EdgeInsets.only(bottom: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: Apptheme.textBlackSmall,),
              CustomTextButton(title: titleButon, textstyle: Apptheme.textGreenMedium,
              onPressed: onPressed),
            ],
          ),
        ),
      ),
    );
  }
}