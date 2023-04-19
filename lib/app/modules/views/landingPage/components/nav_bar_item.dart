import 'package:chatie/app/modules/views/landingPage/components/animated_bar.dart';
import 'package:chatie/app/modules/views/landingPage/components/menu.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';


class NavBarItem extends StatelessWidget {
  const NavBarItem({
    required this.navBar,
    required this.press,
    required this.riveOnInit,
    required this.selectedNav,
    super.key,
  });

  final Menu navBar;
  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;
  final Menu selectedNav;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBar(isActive: selectedNav == navBar),
          SizedBox(
            height: 36,
            width: 36,
            child: Opacity(
              opacity: selectedNav == navBar ? 1 : 0.5,
              child: RiveAnimation.asset(
                navBar.rive.src,
                artboard: navBar.rive.artboard,
                onInit: riveOnInit,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
