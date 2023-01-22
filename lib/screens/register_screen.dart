import 'package:flutter/material.dart';
import 'package:greeny_app/models/models.dart';
import 'package:greeny_app/providers/login_form_provider.dart';
import 'package:greeny_app/providers/ui_provider.dart';
import 'package:greeny_app/services/services.dart';
import 'package:greeny_app/themes/themes.dart';
import 'package:greeny_app/widgets/widgets.dart';
import 'package:provider/provider.dart';


class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
   return SafeArea(
       top: false,
       bottom: false,
       child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
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
                        margin: const EdgeInsets.only(top: 25),
                        child: Text('Crea una cuenta', style: Apptheme.textBlackLarge, textAlign: TextAlign.start,)
                        ),
                      SizedBox(
                        width: size.width*0.8,
                        child: const Image(image: AssetImage('assets/img-signup.png'), fit: BoxFit.cover),
                      ),
                      SizedBox(
                        width: size.width,
                        child: ChangeNotifierProvider(
                        create: ( _ ) => LoginFormProvider(),
                        child: _RegisterForm())
                      ),
                      SizedBox(
                        width: size.width,
                        height: size.height*0.1,
                      ),
                    ],
                  ),
                ),
                CustomAlternativeButton(size: size, title: '¿Ya tienes una cuenta?', titleButon: 'Iniciar sesión',
                 onPressed: () => Navigator.pushReplacementNamed(context, 'login'))
              ],
            ),
          ),
        )
       ),
    );
  }
}

// ***************************************
// REGISTER FORM *************************
// ***************************************
class _RegisterForm extends StatelessWidget {
   _RegisterForm({
    Key? key,
  }) : super(key: key);

  bool isPassword = true;
  bool eyePassword = true;
  String password = '';

  @override
  Widget build(BuildContext context) {

    final loginForm = Provider.of<LoginFormProvider>(context);
    final uiProvider = Provider.of<UiProvider>(context);
    final bool changeVisibility = uiProvider.selectedVisibility;
    final plantService = Provider.of<PlantsService>(context);

    return Form(
      // Mantener la referencia en al KEY
      key: loginForm.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // color: Colors.grey.shade300,
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
                  onPressed: () => uiProvider.selectedVisibility = !uiProvider.selectedVisibility,
                   validator: (value){
                    password = value ?? '';
                    return value !=null && value.length >=6 ? null : 'Mínimo 6 caracteres';
                  },
                  onChange: (value) => loginForm.password = value,
                  ),
                  CustomTextFormField(
                  title: 'Repetir contraseña', icon: Icons.lock, 
                  isPassword: changeVisibility,
                  eyePassword: changeVisibility == eyePassword ? Icons.visibility : Icons.visibility_off, 
                  onPressed: () => uiProvider.selectedVisibility = !uiProvider.selectedVisibility,
                  validator: (value){
                    return password==value ? null : 'Las contraseñas no coinciden';
                    },
                  ),
                 ],
                ),
          ),
          
          Container(
            //  color: Colors.grey.shade400,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomElevatedButton(title: 'Sign up', textstyle: Apptheme.textWhiteLargeButton ,backgroundColor: Apptheme.primary,
                 onPressed: loginForm.isLoading ? null : () async{
                    final authService = Provider.of<AuthService>(context, listen: false);
                    
                    if(!loginForm.isValidForm()) return;
                    
                    loginForm.isLoading = true;
                    // Validar si el login es correcto
                   // await Future.delayed(const Duration(seconds: 0));
                    final String? errorMessage = await authService.createUser(loginForm.email, loginForm.password);

                    if(errorMessage == null){
                         print(errorMessage);
                       //  User newUser = new User(nombre: 'Usuario ejemplo', plantsUser: [], plantsFavorites: []);
                       //  plantService.addUser(newUser);

                         Navigator.pushReplacementNamed(context, 'login');
                    }else{
                        print(errorMessage);
                        NotificationsService.showSnackbar('Esta cuenta ya existe en tu dispositivo', Apptheme.amberDark);
                        loginForm.isLoading = false;
                    }
                  }
                 ),
               ],
             ),
          )
         ],
      ));
  }
}


