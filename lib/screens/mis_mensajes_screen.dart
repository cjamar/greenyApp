import 'package:flutter/material.dart';
import 'package:greeny_app/themes/themes.dart';
import 'package:greeny_app/widgets/widgets.dart';


class MisMensajesScreen extends StatelessWidget {

MisMensajesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar().appBar(context, 'Mis mensajes'),
      body: CustomCardChat()
    );
  }
}

// ***************************
// CUSTOM CARD CHAT  ********+  
// **************************+
class CustomCardChat extends StatelessWidget {
  CustomCardChat({
    Key? key
  }) : super(key: key);

   List<Map<String, String>> chatUsers=[
    {
      "avatar": 'https://pbs.twimg.com/profile_images/378800000666146573/b767f1e1c23c00925f42c63319e01897_400x400.jpeg',
      "name": 'Bender',
      "message": 'Hola cacho carne!',
      "datatime": '19:35'
    },
    {
      "avatar": 'https://www.geekmi.news/__export/1631110092068/sites/debate/img/2021/09/08/leela-futurama-1_1.jpg_375108060.jpg',
      "name": 'Leela',
      "message": 'A la nave!',
      "datatime": 'Ayer'
    },
    {
      "avatar": 'https://static.wikia.nocookie.net/esfuturama/images/1/19/Fansworth.png/revision/latest?cb=20130125191001',
      "name": 'Professor Farnsworth',
      "message": 'Buenas noticias muchachos!',
      "datatime": '27/05/22'
    },
    {
     "avatar": 'https://i.pinimg.com/564x/79/ca/51/79ca517fe5bac70132895613fdd76ef9--futurama.jpg',
     "name": 'Zapp brannigan',
     "message": 'Kiff, acompañame a la cubierta de observación, necesito inspirarme un tanto...',
     "datatime": '19/05/2'
    }
  ];
  
  @override
  Widget build(BuildContext context) {

   return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.pushNamed(context, 'mensaje', arguments: chatUsers);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Row(
              children: [
                 CircleAvatar(
                  backgroundColor: Apptheme.secondary.withOpacity(0.3),
                  radius: 24,
                  backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/378800000666146573/b767f1e1c23c00925f42c63319e01897_400x400.jpeg'),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Bender', style: Apptheme.textBlackMediumLarge),
                        const SizedBox(height: 5),
                        Text('Oye Fry, de todos mis amigos...tu, el único', style: Apptheme.textSecondaryMedium, overflow: TextOverflow.ellipsis, maxLines: 2)
                      ],
                    ),
                  )
                  ),
                  Text('19:35', style: Apptheme.textSecondarySmall,)
              ],
            ),
          ),
        )
        ),
    );
  }
}


