import 'package:flutter/material.dart';
import 'package:greeny_app/themes/themes.dart';


class CustomElevatedButton2 extends StatelessWidget {
  const CustomElevatedButton2({
    Key? key,
    required this.size, required this.title, required this.backgroundColor, 
    required this.textstyle, required this.icon, required this.color, required this.onPressed,
  }) : super(key: key);

  final Size size;
  final String title;
  final IconData icon;
  final Color backgroundColor;
  final Color color;
  final TextStyle textstyle;
  final Function()? onPressed;
  
 @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height*0.06,
      width: size.width*0.9,
      child: OutlinedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 20,),
            const  SizedBox(width: 20),
            Text(title, style: textstyle)
          ],
          ),
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          side: BorderSide(color: Apptheme.primary, width: 0.5),
        //shape: const StadiumBorder()
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
        ),
        onPressed: onPressed
        ),
    );
  }
}