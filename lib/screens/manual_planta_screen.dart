import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greeny_app/screens/screens.dart';
import 'package:greeny_app/themes/themes.dart';
import 'package:greeny_app/widgets/custom_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ManualScreen extends StatefulWidget {

 
  String? manual;
  
  ManualScreen({Key? key, this.manual}) : super(key: key);

  @override
  State<ManualScreen> createState() => _ManualScreenState();
}

class _ManualScreenState extends State<ManualScreen> {

  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if(Platform.isAndroid) WebView.platform = AndroidWebView();
  } 

  @override
  Widget build(BuildContext context) {
 
   return SafeArea(
     child: Scaffold(
       appBar: AppBar(
        // toolbarHeight: 50,
         centerTitle: false,
         title: Text('Volver a mi planta', style: Apptheme.textPrimaryMediumLarge),
         elevation: 0,
         backgroundColor: Colors.transparent,
         leading: IconButton(onPressed: () => Navigator.pop(context), 
         icon: Icon(Icons.arrow_back_sharp, color: Apptheme.primary,)
         ),),
       body: WebView(
        initialUrl: widget.manual,
        javascriptMode: JavascriptMode.disabled, // con el disabled evitamos los banners publicitarios, pero también desactivamos el javascript de la propia página
        onWebViewCreated: (WebViewController controller){
          _controller.complete(controller);
        },
        )),
   );
  }
}