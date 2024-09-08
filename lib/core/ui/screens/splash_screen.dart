import 'package:cat_breeds/core/ui.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showIcon = true;
  bool showTitle = false;
  bool hideIcon = false;

  bool nextScreen = false;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  _startAnimation() async {
    // Mostrar el icono
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      showIcon = true;
    });

    // Mostrar el título después de 1 segundo
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      showTitle = true;
    });

    // Ocultar el icono después de 2 segundos
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      hideIcon = true;
    });

    //execute show next screen
    await Future.delayed(const Duration(seconds: 2));
    _nextScreen(context);
  }

  _nextScreen(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final BoxConstraints(
            :maxHeight,
            :maxWidth,
          ) = constraints;
          return Stack(
            alignment: Alignment.center,
            children: [
              // Ícono
              AnimatedPositioned(
                top: hideIcon ? maxHeight : maxHeight / 2,
                duration: const Duration(milliseconds: 1500),
                child: AnimatedOpacity(
                  opacity: hideIcon ? 0.0 : 1.0,
                  duration: const Duration(seconds: 1),
                  child: AssetSVG.catHead.getWidget(
                    context,
                    height: 100,
                  ),
                ),
              ),
              // Título
              AnimatedPositioned(
                top: hideIcon ? maxHeight / 2 - 20 : maxHeight / 2.5,
                duration: const Duration(seconds: 1),
                child: AnimatedOpacity(
                  opacity: showTitle ? 1.0 : 0.0,
                  duration: const Duration(seconds: 1),
                  child: Text(
                    "Cat breeds",
                    textAlign: TextAlign.center,
                    style: context.getDisplayLarge(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
