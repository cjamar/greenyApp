import 'package:flutter/material.dart';
import 'package:greeny_app/themes/themes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/widgets.dart';



class CarouselScreen extends StatelessWidget {

 final PageController _controller = PageController();
 
 @override
   Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              _SplashScreen(headTitle: 'Explora.' ,title: 'Empieza a buscar las plantas que se ajusten a tus gustos', 
              image: 'assets/img-carousel-1.png', size: size,),
              _SplashScreen(headTitle: 'Cuida.', title: 'Cuida de tus plantas, gestiona las tareas que necesites', 
              image: 'assets/img-carousel-2.png',  size: size),
              _SplashScreen(headTitle: 'Aprende.', title: 'Consulta el manual de cada planta y conviértete en un experto en la materia', 
              image: 'assets/img-carousel-3.png',  size: size),
            ],
          ),
          // DOT INDICATOR ***********++
          Container(
            alignment: const Alignment(0, 0.45),
            child: SmoothPageIndicator(
              controller: _controller, 
              count: 3,
              effect: WormEffect(
                dotWidth: 9,
                dotHeight: 9,
                dotColor: Apptheme.primaryClear,
                activeDotColor: Apptheme.primary
              ),
              )),
          Container(
             alignment: const Alignment(0, 0.8),
            child: CustomElevatedButton(title: 'Empezar', backgroundColor: Apptheme.primary, color: Apptheme.white, borderWidth: 0,
            textstyle: Apptheme.textWhiteLargeButton, onPressed: ()=> Navigator.pushReplacementNamed(context, 'home'),),
          )   
        ],
      )
   );
  }
}

class _SplashScreen extends StatelessWidget {
  const _SplashScreen({
    Key? key, required this.title, required this.image, required this.size, required this.headTitle,
  }) : super(key: key);

  final Size size;
  final String title;
  final String headTitle;
  final String image;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(image: AssetImage(image)),
              Container(
                width: size.width*0.7,
                
                margin: const EdgeInsets.only(top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(headTitle, style: Apptheme.textPrimaryXL),
                    const SizedBox(height: 10),
                    Text(title, style: Apptheme.textPrimaryLargeButton, 
                    textAlign: TextAlign.center),
                  ],
                )),
            ],
          ),
         Container()
        ],
      ),
    );
  }
}