import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/data/helpers/theme_helper.dart';
import 'package:chatie/app/modules/views/home/components/feed_button.dart';
import 'package:chatie/app/modules/views/home/components/like_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: isDarkMode(context) ? AppColors.kGrey : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 50.h,
                    height: 50.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AppAssets.kAvatar1),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Shameel Irtaza',
                        style: AppTypography.kBold18,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        '01-4-2023',
                        style: AppTypography.kLight14.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.more_horiz,
                  size: 30,
                  color: Colors.grey[600],
                ),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: AppSpacing.tenVertical,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              style: AppTypography.kLight14,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            height: 250.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.kFeed),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: AppSpacing.tenVertical,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const LikeCard(),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      '2.5K',
                      style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                    ),
                  ],
                ),
                Text(
                  '400 Comments',
                  style: TextStyle(fontSize: 13, color: Colors.grey[800]),
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppSpacing.tenVertical,
          ),
          Container(
            height: 50.0.h,
            padding:
                EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black12)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                FeedButton(
                  isActive: true,
                  icon: Icons.thumb_up,
                  text: 'Like',
                ),
                FeedButton(
                  isActive: false,
                  icon: Icons.chat,
                  text: 'Comments',
                ),
                FeedButton(
                  isActive: false,
                  icon: Icons.share,
                  text: 'Share',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
