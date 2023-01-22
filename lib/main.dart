import 'package:flutter/material.dart';
import 'package:greeny_app/providers/ui_provider.dart';
import 'package:greeny_app/screens/screens.dart';
import 'package:greeny_app/services/services.dart';
import 'package:greeny_app/share_preferences/preferences.dart';
import 'package:greeny_app/themes/themes.dart';
import 'package:provider/provider.dart';

// ****+ VOID MAIN ORIGINAL ********
// void main() => runApp(AppState());

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await Preferences.init();
   runApp(AppState());
} 

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => PlantsService() )
      ],
      child: MyApp(),
      );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => UiProvider()),
        ChangeNotifierProvider(create: ( _ ) => AuthService()),
      ],
      child: MaterialApp(
        title: 'Greeny App',
        debugShowCheckedModeBanner: false,
        theme: Apptheme.lightTheme,
        initialRoute: 'checking',
        routes: {
          'welcome': ( _ ) => const WelcomeScreen(),

          'login': ( _) => LoginScreen(),
          'register': ( _) => RegisterScreen(),

          'checking': ( _ ) => const CheckAuthScreen(),

          'home' : ( _ ) => const HomeScreen(),
          'misPlantas' : ( _ ) => const MisPlantasScreen(),
         // 'buscar' : ( _ ) => const BuscarScreen(),
          'buscar2' : ( _ ) => const BuscarScreen(),
          'misMensajes' : ( _ ) =>  MisMensajesScreen(),
           'mensaje' : ( _ ) => MensajeScreen(),
          'community' : ( _ ) => const CommunityScreen(),
          'planta' : ( _ ) => PlantaScreen(),
          'form' : ( _ ) => FormScreen(),
          'miPerfil' : ( _ ) => const MiPerfilScreen(),
         // 'manual': ( _ ) => ManualScreen(),
          'carousel': ( _ ) => CarouselScreen(),
          'taskAcomplished': ( _ ) => const TaskAcomplishedScreen(),
        },
        scaffoldMessengerKey: NotificationsService.messengerKey,
      ),
    );
  }
}