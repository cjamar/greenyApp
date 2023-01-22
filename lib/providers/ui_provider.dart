import 'package:flutter/material.dart';


class UiProvider extends ChangeNotifier{

  int _selectedMenuOption = 0;
  int _selectedCategoryOption = 0;
  bool _isActivated = false;
  bool _isPassword = true;

  int get selectedMenuOption {
    return _selectedMenuOption;
  }

   set selectedMenuOption(int i){
    _selectedMenuOption = i;
    notifyListeners(); // Esto notificará a todos los widgets que puedan escuchar un cambio
  }

  int get selectedCategoryOption {
    return _selectedCategoryOption;
  }

  set selectedCategoryOption (int i){
    _selectedCategoryOption = i;
    notifyListeners();
  }

  bool get selectedVisibility {
    return _isPassword;
  }

  set selectedVisibility (bool value){
      _isPassword = value;
      notifyListeners();
  }

  bool get selectedTaskActivation{
    return _isActivated;
  }
 
  set selectedTaskActivation (bool value){
    _isActivated = value;
    notifyListeners();
  }


}