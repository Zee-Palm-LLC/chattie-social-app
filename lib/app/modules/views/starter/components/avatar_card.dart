import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AvatarCard extends StatelessWidget {
  int index;
  final double number;
  AvatarCard({
    required this.index,
    required this.number,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    index = number ~/ 60;
    return FadeInRight(
      delay: const Duration(seconds: 1),
      duration: Duration(milliseconds: (index * 100) + 500),
      child: Container(
        margin: EdgeInsets.only(right: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform.rotate(
              angle: number / 60 * 5.2,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.green.shade100,
                backgroundImage: AssetImage(contacts[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> contacts = <String>[
    'assets/images/avatar-1.png',
    'assets/images/avatar-2.png',
    'assets/images/avatar-3.png',
    'assets/images/avatar-4.png',
    'assets/images/avatar-5.png',
    'assets/images/avatar-6.png',
  ];
}
