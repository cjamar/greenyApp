import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {

  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseApiKey = 'AIzaSyBKqnd7E9o2fNQBHNdTcF2XNndVe60Ebt0';
  final storage = FlutterSecureStorage();

  // **************************+
  // CREAR CUENTA **************
  // **************************+
  Future<String?> createUser(String email, String password) async{

    final Map<String, dynamic> authData = {
      'email' : email, 
      'password' : password,
      'returnSecureToken' : true
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signUp',{'key': _firebaseApiKey} );

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if(decodedResp.containsKey('idToken')){
       // Grabar token en security storage
      await storage.write(key: 'token', value: decodedResp['idToken']);
      return null;
    }else{
      return decodedResp['error']['message'];
    }
  }

  // **************************+
  // INICIAR SESIÓN *************
  // **************************++
  Future<String?> login(String email, String password) async{

      final DateTime now = DateTime.now(); 
      final DateTime caducidad;
      final int seconds;
    
    final Map<String, dynamic> authData = {
      'email' : email, 
      'password' : password,
      'returnSecureToken' : true
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword', {'key': _firebaseApiKey} );

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);
    
     if(decodedResp.containsKey('idToken')){
       // Grabar token en security storage
      Map<String, dynamic> token = {
        'token': decodedResp['idToken'], 
        'tokenDateTime': decodedResp['expiresIn']
        };
      seconds = int.parse(decodedResp['expiresIn']); 
      caducidad = now.add(Duration(seconds: seconds));

      print('El token caducará en ${seconds} segundos');
      
      await storage.write(key: 'token', value: decodedResp['idToken']);
      await storage.write(key: 'tokenDateTime',value: caducidad.toString());

     return null;
   }else{
      return decodedResp['error']['message'];
    }
  }

  Future logOut() async {
  //  await storage.delete(key: 'token');
    await storage.deleteAll();

    return;
  }

  // verificación de si tengo token para entrar directamente
  Future<String> readToken() async{
    return await storage.read(key: 'token') ?? '';
  }

  Future<String> readTokenDateTime() async{
    return await storage.read(key: 'tokenDateTime') ?? '';
  }

  // verificación de si el token es valido (y no ha caducado)
  Future<bool> checkValidToken() async{
     
      String token = await readToken();
      String caducidadToken = await readTokenDateTime();

      if(token.isEmpty) return false;
      if(caducidadToken.isEmpty) return false;

      DateTime fechaCaducidad = DateTime.parse(caducidadToken);
      
      if (fechaCaducidad.difference(DateTime.now()).inSeconds > 60){
         return true;
      }
      return false;
  }
  

}