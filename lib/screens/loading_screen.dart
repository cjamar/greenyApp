import 'package:flutter/material.dart';
import 'package:greeny_app/widgets/custom_app_bar.dart';


class LoadingScreen extends StatelessWidget {
   
  const LoadingScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar().appBar(context, 'Buscar'),
      body: Center(
         child: CircularProgressIndicator(
           color: Colors.green.withOpacity(0.4)
           ),
      ),
    );
  }
}