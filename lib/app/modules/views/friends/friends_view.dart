import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/modules/views/friends/components.dart/custom_friends_button.dart';
import 'package:chatie/app/modules/views/friends/components.dart/friends_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FriendsView extends StatefulWidget {
  const FriendsView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FriendsViewState createState() => _FriendsViewState();
}

class _FriendsViewState extends State<FriendsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends', style: AppTypography.kBold18),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.twentyHorizontal,),
                child: Row(
                  children: <Widget>[
                    CustomFriendsButton(
                      onTap: () {},
                      text: 'Suggestions',
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    CustomFriendsButton(
                      onTap: () {},
                      text: 'All Friends',
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.tenVertical),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.twentyHorizontal,
                ),
                child: Text(
                  'Friend Requests',
                  style: AppTypography.kBold22,
                ),
              ),
              SizedBox(height: AppSpacing.tenVertical),
              ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.twentyHorizontal,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const FriendsCard();
                },
                separatorBuilder: (context, index) =>
                    SizedBox(height: AppSpacing.tenVertical),
                itemCount: 2,
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.twentyHorizontal,
                ),
                child: Text(
                  'People you may know',
                  style: AppTypography.kBold22,
                ),
              ),
              SizedBox(height: AppSpacing.tenVertical),
              ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.twentyHorizontal,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const FriendsCard();
                },
                separatorBuilder: (context, index) =>
                    SizedBox(height: AppSpacing.tenVertical),
                itemCount: 2,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
