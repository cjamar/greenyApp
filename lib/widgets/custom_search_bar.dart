import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:greeny_app/models/models.dart';
import 'package:greeny_app/screens/buscar_screen.dart';
import 'package:greeny_app/services/plants_service.dart';
import 'package:greeny_app/themes/themes.dart';
import 'package:greeny_app/widgets/widgets.dart';
import 'package:provider/provider.dart';


class CustomSearchBar extends StatefulWidget {
  CustomSearchBar({
    Key? key,
    required this.size, this.onChanged, this.onPressedClose, this.iconClose,
  }) : super(key: key);

  final Size size;
  final Function(String)? onChanged;
  final Function()? onPressedClose;
  final Widget? iconClose;
  

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  
  final plants = PlantsService().plants;

  List<Plant> matchPlants = [];
  
 // final isVisible;
  final TextEditingController controller = new TextEditingController();

  @override
   Widget build(BuildContext context) {

    final plantService = Provider.of<PlantsService>(context);

    return Container(
      alignment: Alignment.center,
      height: 48,
     // height: widget.size.height*0.06,
      width: widget.size.width,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade300),
        ),
      child: TextField(
          controller: controller,
          style: Apptheme.textPrimaryMediumLarge,
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Apptheme.secondary, size: 20),
            suffixIcon: Visibility(
              visible: controller.text.isEmpty ? false : true,
              child: IconButton(onPressed: () async{
                  controller.clear();
                  await plantService.loadPlants();
                  setState(() {});
              }, icon: Icon(Icons.close, color: Apptheme.secondary, size: 20)),
            ), // Visibility(
            hintText: 'Buscar',
            hintStyle: Apptheme.textSecondaryMediumLarge,
           ),
           onChanged: widget.onChanged,
        )
     );
  }
}