import 'dart:ui';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:greeny_app/screens/home_screen.dart';




class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: Column(
             children: [
               TabBar(
                  labelStyle: const TextStyle(fontSize: 12),
                  indicatorColor: const Color.fromARGB(255, 214, 214, 214),
                  labelColor: Colors.green,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                 const Tab(text: 'Buscar', icon: Icon(Icons.search)),
                 const Tab(text: 'Mis plantas', icon: Icon(Icons.home)),
                  Tab(
                    text: 'Mensajes', 
                    icon: Badge(
                      badgeContent: const Text('3', style: TextStyle(color: Colors.white)),
                      showBadge: true,
                      child: const Icon(Icons.message)
                      )
                    ),
                 const Tab(text: 'Community', icon: Icon(Icons.star)),
                ]),
            ],
          ),
        )
       ),
    );
  }
}