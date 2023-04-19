import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/modules/views/friends/components.dart/custom_friends_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FriendsCard extends StatelessWidget {
  const FriendsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage(AppAssets.kFeed),
          radius: 50.r,
        ),
        SizedBox(width: AppSpacing.tenHorizontal),
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Chritain Guzmen', style: AppTypography.kBold16),
              Text(
                '6 mutual friends',
                style: AppTypography.kLight14.copyWith(color: Colors.grey),
              ),
              SizedBox(height: 5.h),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomFriendsButton(
                      onTap: () {},
                      text: 'Remove',
                      radius: 5.r,
                    ),
                  ),
                  SizedBox(width: AppSpacing.tenHorizontal),
                  Expanded(
                    child: CustomFriendsButton(
                      onTap: () {},
                      text: 'Confirm',
                      radius: 5.0.r,
                      color: Colors.orange,
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ],
          ),
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
