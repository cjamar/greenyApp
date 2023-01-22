import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({Key? key, required this.title, 
  this.onPressed, required this.textstyle}) : super(key: key);

  final String title;
  final TextStyle textstyle;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
        child: TextButton(
        onPressed: onPressed,
        child: Text(title, style: textstyle)
       ),
    );
  }
}