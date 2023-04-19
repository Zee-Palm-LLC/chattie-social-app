import 'package:flutter/material.dart';

class ScrollControllerButton extends StatelessWidget {
  final VoidCallback onTap;
  const ScrollControllerButton({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.orange,
        ),
        child: const Icon(Icons.arrow_downward, color: Colors.white),
      ),
    );
  }
}
