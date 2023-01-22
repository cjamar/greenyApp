import 'package:flutter/material.dart';
import 'package:greeny_app/screens/screens.dart';
import 'package:greeny_app/themes/themes.dart';
import 'package:greeny_app/widgets/custom_app_bar.dart';


class MensajeScreen extends StatelessWidget {

 
  @override
  Widget build(BuildContext context) {

    // final arguments = ModalRoute.of(context).settings.arguments as MisMensajesScreen;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
          const Padding(
             padding: EdgeInsets.only(right: 10),
             child: CircleAvatar(
               backgroundImage: AssetImage('assets/avatar-user-img.jpg'),
             ),
           ),
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('Bender', style: Apptheme.textWhiteMediumLarge,),
                 const SizedBox(height: 2),
                 Text('Última vez hoy a las 19:35', style: Apptheme.textWhiteMedium,)
               ],
             ),
           ),
           IconButton(
             onPressed: () => print('Opciones mensaje'), 
             icon: const Icon(Icons.more_vert)
             )
          ],
        ),
      ),
      body: Column(
        children: [
          // const Spacer(),
          Expanded(
            child: Column(
              children: const[
                 _MessageLeft(title: 'Hola cacho carne!'),
                _MessageRight(title: 'Tronco, Bender!'),
                _MessageLeft(title: 'Te vienes a la robofiesta?'),
                _MessageRight(title: 'No lo se, Bender...'),
                _MessageRight(title: 'Deberiamos quedarnos a arreglar la nave'),
                _MessageLeft(title: 'Tu verás pringaillo, me beberé 5 a tu salud!'),
                _MessageLeft(title: 'Oye Fry, de todos mis amigos...tu, el único'),
              ],
            )
            ),
          // Expanded(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //        Icon(Icons.chat, size: 60, color: Apptheme.secondary.withOpacity(0.4),),
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          //         child: Text('Todavía no tienes mensajes, se el primero en escribir!', style: Apptheme.textSecondaryMediumLarge, textAlign: TextAlign.center),
          //       ),
          //     ]),
          //  ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Apptheme.secondary.withOpacity(0.2))),
              color: Apptheme.white ,
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Icon(Icons.mic, color: Apptheme.primary),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          color: Apptheme.secondary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.sentiment_satisfied_alt_outlined, color: Apptheme.secondary),
                            const SizedBox(width: 10),
                             Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Escribe un mensaje',
                                  hintStyle: TextStyle(color: Apptheme.secondary),
                                  border: InputBorder.none
                                ),
                              ))
                          ],
                        ),
                      ),
                    ),
                    
                  ),
                  IconButton(
                    onPressed: (){
                      print('enviar mensaje');
                    }, 
                    icon: InkWell(child: Icon(Icons.send, color: Apptheme.primaryMediumClear,))
                    )
                  ]
                )
              ),
          )
        ],
      ),
   );
  }
}

// **********************************
// MESSAGE SENDER *******************
// **********************************
class _MessageLeft extends StatelessWidget {
  const _MessageLeft({
    Key? key, required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
           margin: const EdgeInsets.only(top: 20, left: 10),
           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
           decoration: BoxDecoration(
             color: Apptheme.primary,
             borderRadius: BorderRadius.circular(20)
           ),
           child: Text(title, style: Apptheme.textWhiteMedium, overflow: TextOverflow.clip, maxLines: 3)
          ),
      ],
    );
  }
}


// **********************************
// MESSAGE USER *********************
// **********************************
class _MessageRight extends StatelessWidget {
  const _MessageRight({
    Key? key, required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
           margin: const EdgeInsets.only(top: 20, left: 10),
           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
           decoration: BoxDecoration(
             color: Apptheme.primaryClear,
             borderRadius: BorderRadius.circular(20)
           ),
           child: Text(title, style: Apptheme.textPrimaryMedium, overflow: TextOverflow.clip, maxLines: 3)
          ),
      ],
    );
  }
}