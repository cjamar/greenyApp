import 'package:flutter/material.dart';
import 'package:greeny_app/providers/ui_provider.dart';
import 'package:greeny_app/screens/screens.dart';
import 'package:greeny_app/widgets/widgets.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {

  // final size = MediaQuery.of(context).size;

    return const Scaffold (
      body: _HomeBody(),
      endDrawer: CustomDrawer(),
      bottomNavigationBar: CustomBottomNavBar(),
   );
  }
}



class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Obtener el Menu Selected Option
    final uiProvider = Provider.of<UiProvider>(context);

    // Cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOption;

    switch(currentIndex){
      case 0: 
      return const BuscarScreen();
      case 1:
        return const MisPlantasScreen();
      case 2:
        return MisMensajesScreen();
      case 3:
        return const CommunityScreen();  
    }

    return Container(
      color: Colors.red,
      height: 200,
      width: double.infinity,
      child: const Center(child: Text('Home Screen Body')),
    );
  }
}



