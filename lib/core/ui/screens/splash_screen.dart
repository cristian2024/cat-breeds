import 'package:cat_breeds/core/ui.dart';
import 'package:cat_breeds/features/cat_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String fullRoute = '/$route';
  static const String route = 'splash_screen';
  static const String routeName = 'splashScreen';

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
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      hideIcon = true;
      nextScreen = true;
    });

    //execute show next screen
    await Future.delayed(
      const Duration(milliseconds: 1500),
    );
    _nextScreen(context);
  }

  _nextScreen(BuildContext context) {
    context.goNamed(CatBreedsScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                top: nextScreen
                    ? 80
                    : hideIcon
                        ? maxHeight / 2 - 20
                        : maxHeight / 2.5,
                duration: const Duration(seconds: 1),
                child: AnimatedOpacity(
                  opacity: showTitle ? 1.0 : 0.0,
                  duration: const Duration(seconds: 1),
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(seconds: 1),
                    style: context.getDisplayLarge().copyWith(
                          fontSize: nextScreen
                              ? context.getTitleLarge().fontSize
                              : context.getDisplayLarge().fontSize,
                        ),
                    child: const Text(
                      "Cat breeds",
                      textAlign: TextAlign.center,
                    ),
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
