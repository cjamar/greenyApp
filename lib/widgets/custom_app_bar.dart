import 'package:flutter/material.dart';
import 'package:greeny_app/themes/themes.dart';
import 'package:flutter/services.dart';




class CustomAppBar {

  final String title = '';
  

  PreferredSizeWidget appBar(BuildContext context, String title){
    
     final Size size = MediaQuery.of(context).size;

    return AppBar(
      iconTheme: IconThemeData(color: Apptheme.primary),
      elevation: 0,
      backgroundColor: Colors.white,
      toolbarHeight: size.height*0.06,
      flexibleSpace: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Container(padding: EdgeInsets.only(right: size.width*0.08)),
            Text(title, style: Apptheme.textBlackLargeButton),
            InkWell(
              onTap: (){
                Scaffold.of(context).openEndDrawer();
              },
              child: const CircleAvatar(
              backgroundImage: AssetImage('assets/avatar-img.jpeg'),
               radius: 20,
              ),
            ),
          ]),
          )
        ),
     );
    
    // return AppBar(
    //  // leading: Image(image: AssetImage(logo)),
    //   title: Text(title, textAlign: TextAlign.center, style: Apptheme.textPrimaryMediumLarge),
    //   elevation: 0,
    //   backgroundColor: Apptheme.white,
    //   actions: [
    //       Padding(
    //       padding: const EdgeInsets.only(right: 20),
    //       child: GestureDetector(
    //         onTap: (){
    //           Scaffold.of(context).openEndDrawer();
    //           print('Abrir drawer');
    //         },
    //         child: const CircleAvatar(
    //           backgroundImage: AssetImage('assets/avatar-img.jpeg'),
    //           // radius: 20,
    //         ),
    //       ),
    //      )
    //   ],

    // );
  }

   PreferredSizeWidget appBarSearcher(BuildContext context, Size size, String title, 
   Container searchBarContainer, Container categoryListContainer){

    final Size size = MediaQuery.of(context).size;

    return AppBar(
      elevation: 0,
      backgroundColor: Apptheme.white,
      toolbarHeight: size.height*0.21,
      flexibleSpace: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 0, right: 0, top: 5),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   SizedBox(
                     width: size.width*0.27,
                     child: const Image(image: AssetImage('assets/logo-greeny.png'))),
                 // Container(padding: EdgeInsets.only(right: size.width*0.08)),
                 // Text(title, style: Apptheme.textBlackLargeButton),
                  InkWell(
                    onTap: (){
                       Scaffold.of(context).openEndDrawer();
                    },
                    child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/avatar-img.jpeg'),
                     radius: 20,
                    ),
                  ),
                ]),
              ),
             Container(child: searchBarContainer),
             Container(child: categoryListContainer)   
            ],
          ),
          )
        ),
     );
  }

  // APPBAR SEARCHER 2 (SLIVER APPBAR)
  

  
}

