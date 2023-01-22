import 'package:flutter/material.dart';
import 'package:greeny_app/themes/themes.dart';
import 'package:greeny_app/widgets/custom_app_bar.dart';
import 'package:greeny_app/widgets/widgets.dart';


class FormScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    String _selectedGender = 'Male';
    
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: CustomAppBar().appBar(context, 'Formulario'),
        body: Container(
          color: Colors.grey.withOpacity(0.3),
          margin: EdgeInsets.symmetric(horizontal: 8),
          width: size.width,
          height: size.height,
          child: Form(
            //  key: key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                   width: size.width,
                   margin: const EdgeInsets.only(top: 10),
                   child: Text('Te ayudamos a encontrar tu planta ideal, contesta a estas preguntas...', style: Apptheme.textPrimaryMediumLarge, textAlign: TextAlign.center),
                     ),
                   Container(
                     child: Text('1 / 4', style: Apptheme.textPrimaryMediumLarge,),
                   ),  
                  Container(
                    color: Colors.grey.shade200,
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      children: [
                          _questionForm(title: '¿Buscas planta de interior o de exterior?',),
                          _CustomRadioButton(size: size, selectedGender: _selectedGender, title: 'Interior', value: 'Interio'),
                          _CustomRadioButton(size: size, selectedGender: _selectedGender, title: 'Exterior', value: 'Exteriora'),
                          _CustomRadioButton(size: size, selectedGender: _selectedGender, title: 'Indiferente', value: 'Indiferente'),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey.shade200,
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      children: [
                          _questionForm(title: '¿Cuánto tiempo sueles pasar en casa?'),
                          _CustomRadioButton(size: size, selectedGender: _selectedGender, title: '> 9h', value: '> 9h'),
                          _CustomRadioButton(size: size, selectedGender: _selectedGender, title: '9h - 12h', value: '9h - 12h'),
                          _CustomRadioButton(size: size, selectedGender: _selectedGender, title: '< 12h', value: '< 12h'),
                      ],
                    ),
                  ),
                 Container(
                    color: Colors.grey.shade200,
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      children: [
                          _questionForm(title: '¿Tienes mascota en casa?'),
                          _CustomRadioButton(size: size, selectedGender: _selectedGender, title: 'Si', value: 'Si'),
                          _CustomRadioButton(size: size, selectedGender: _selectedGender, title: 'No', value: 'No'),
                      ],
                    ),
                  ),
                 CustomElevatedButton(title: 'Siguiente >',textstyle: Apptheme.textPrimaryMediumLarge , backgroundColor: Apptheme.primaryClear,),
                ],
              ),
          ),
        )
       ),
    );
  }
}

class _questionForm extends StatelessWidget {
  const _questionForm({
    Key? key, required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Text(title, style: Apptheme.textBlackMediumLarge),
    );
  }
}


// ******************************************
// RADIO BUTTON CUSTOM **********************
// *************************************+****
class _CustomRadioButton extends StatelessWidget {
  const _CustomRadioButton({
    Key? key,
    required this.size,
    required String selectedGender, required this.value, required this.title,
  }) : _selectedGender = selectedGender, super(key: key);

  final Size size;
  final String _selectedGender;
  final String value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: size.width*0.4,
      child: OutlinedButton(
         child: Text(title, style: Apptheme.textPrimaryMediumLarge),
         style: OutlinedButton.styleFrom(
         side: BorderSide(width: 0.5, color: Apptheme.primary)),
         onPressed: (){},
        // child: ListTile(
        //    title: Text(title, style: Apptheme.textPrimaryMedium),
        //    leading: Radio<String>(
        //    activeColor: Apptheme.primary,
        //    focusColor: Apptheme.secondary, 
        //    value: value, 
        //    groupValue: _selectedGender, 
        //    onChanged:(value){}
        // )
        //   ),
      ),
    );
  }
}


// ******************************************
// OPTION CARD CUSTOM ***********************
// *************************************+****
class _CustomOptionCard extends StatelessWidget {
  const _CustomOptionCard({
    Key? key,
    required this.size, required this.title,
  }) : super(key: key);

  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => print('Opción seleccionada')),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 70,
        width: size.width*0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: Apptheme.textBlackMediumLarge),
            Container(height: 20, width: 20, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Apptheme.secondary)),)
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}





