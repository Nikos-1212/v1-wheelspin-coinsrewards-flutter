import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ui_lib/styles/app_theme.dart';
import 'package:ui_lib/widgets/colored_status_bar.dart';

class AppLayout extends StatelessWidget {
  final Widget child;

  const AppLayout({
    Key? key,
    required this.child,
  }) : super(key: key);

  void backButtonAction() {
    Modular.to.pop();
  }
  @override
  Widget build(BuildContext context) {
    return VGColoredStatusBar(
      color: VGApplicationTheme.colors.primary,
      child: Scaffold(
        backgroundColor: VGAppTheme.defaultThemeData.canvasColor,
          appBar: AppBar(
              actions: [
                IconButton(
                icon: Icon(
                  Icons.close,
                  color: VGApplicationTheme.colors.base900,
                ),
                onPressed: () => backButtonAction(),
              ),
              ],
              bottomOpacity: 0.0,
              elevation: 0.0,
              backgroundColor: VGApplicationTheme
                  .colors.base50, // Replace with your desired color
            ),
        body: SafeArea(
          child: child),
      ),
    );
  }
}
