import 'package:flutter/material.dart';
import 'package:greeny_app/themes/themes.dart';


class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.title, required this.backgroundColor, 
    required this.textstyle, this.color, this.onPressed, this.borderWidth,
  }) : super(key: key);

 // final Size size;
  final String title;
  final Color backgroundColor;
  final Color? color;
  final double? borderWidth;
  final TextStyle textstyle;
  final Function()? onPressed;
  
 @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: size.height*0.06,
      width: size.width*0.85,
      child: OutlinedButton(
        child: Text(title, style: textstyle),
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          side: BorderSide(color: color ?? Apptheme.primary, width: borderWidth ?? 0.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
       // shape: const StadiumBorder()
        ),
       onPressed: onPressed
        ),
    );
  }
}