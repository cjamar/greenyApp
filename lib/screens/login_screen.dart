import 'package:flutter/material.dart';
import 'package:greeny_app/providers/login_form_provider.dart';
import 'package:greeny_app/providers/ui_provider.dart';
import 'package:greeny_app/services/services.dart';
import 'package:greeny_app/themes/themes.dart';
import 'package:greeny_app/widgets/widgets.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
   return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
     resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox( // Es lo mismo que container pero solo para casos donde dicho container no tiene relleno
          width: size.width,
          height: size.height,
          child: Stack(
          // alignment: AlignmentDirectional.centerStart,
           fit: StackFit.expand,
              children: [
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: size.width*0.8,
                        margin: const EdgeInsets.only(top: 10),
                        child: Text('Inicia sesión', style: Apptheme.textBlackLarge, textAlign: TextAlign.start,)
                        ),
                      Container(
                        color: Colors.grey.shade300,
                        width: size.width*0.8,
                        child: const Image(image: AssetImage('assets/img-login.png'), fit: BoxFit.cover),
                      ),
                      SizedBox(
                        width: size.width,
                        child: ChangeNotifierProvider(
                          create: ( _ ) => LoginFormProvider(),
                          child: _LoginForm())
                      ),
                      SizedBox(
                        width: size.width,
                        height: size.height*0.1,
                      ),
                    ],
                  ),
                ),
                 CustomAlternativeButton(size: size, title: '¿No tienes cuenta?', titleButon: 'Registrarme',
                 onPressed: () => Navigator.pushReplacementNamed(context, 'register'))
              ],
            ),
        ),
      )
       ),
    );
  }
}



// ***************************************
// LOGIN FORM ****************************
// ***************************************
class _LoginForm extends StatelessWidget {
   _LoginForm({
    Key? key,
  }) : super(key: key);

  bool isPassword = true;
  bool eyePassword = true;

  @override
  Widget build(BuildContext context) {

    final loginForm = Provider.of<LoginFormProvider>(context);
    final uiProvider = Provider.of<UiProvider>(context);
    final bool changeVisibility = uiProvider.selectedVisibility;
    final plantsService = Provider.of<PlantsService>(context);
   

    return Form(
      // Mantener la referencia en al KEY
      key: loginForm.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Column(
              children: [
                CustomTextFormField(
                  title: 'Usuario', icon: Icons.person, isPassword: false, 
                  keyboardType: TextInputType.emailAddress,
                  validator: (value){
                  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp  = RegExp(pattern);
                  return regExp.hasMatch(value ?? '') ? null : 'El correo no es correcto';
                  },
                  onChange: (value) => loginForm.email = value
                ),
                CustomTextFormField(
                  title: 'Contraseña', icon: Icons.lock, 
                  isPassword: changeVisibility,
                  eyePassword: changeVisibility == eyePassword ? Icons.visibility : Icons.visibility_off, 
                  onPressed: (){
                    uiProvider.selectedVisibility = !uiProvider.selectedVisibility;
                  },
                  validator: (value){
                  return value !=null && value.length >=6 ? null : 'Mínimo 6 caracteres';
                  },
                  onChange: (value) => loginForm.password = value,
                  ),
                 ],
                ),
          ),
          
          Container(
            //  color: Colors.grey.shade400,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomElevatedButton(
                title: loginForm.isLoading ? 'Espere...' : 'Login', 
                textstyle: Apptheme.textWhiteLargeButton ,backgroundColor: Apptheme.primary,
                 onPressed: loginForm.isLoading ? null : () async{
                   
                   await Future.delayed(const Duration(seconds: 0)).then((value) async{
                     
                          final authService = Provider.of<AuthService>(context, listen: false);
                          
                          if(!loginForm.isValidForm()) return;
                          loginForm.isLoading = true;
                           // Validar si el login es correcto
                           await authService.login(loginForm.email, loginForm.password).then((value) async{
                             if(value==null) {
                                await plantsService.loadPlants().then((value) async{
                                await plantsService.loadMyPlants().then((value) async{
                                  Navigator.pushReplacementNamed(context, 'carousel');
                                  });
                              });
                              } else {
                                 NotificationsService.showSnackbar('Usuario o contraseña incorrectos', Apptheme.amberDark);
                                 loginForm.isLoading = false;
                              }
                          });
                         }
                      );
                   }
                ),
              ],
             ),
          ),
         ],
      ));
  }
}












