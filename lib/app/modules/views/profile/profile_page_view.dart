import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/data/helpers/theme_helper.dart';
import 'package:chatie/app/modules/views/friends/components.dart/custom_friends_button.dart';
import 'package:chatie/app/modules/views/home/components/feed_card.dart';
import 'package:chatie/app/modules/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomLeft,
              clipBehavior: Clip.none,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 200.h,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://www.sageisland.com/wp-content/uploads/2017/06/beat-instagram-algorithm.jpg',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 100.h,
                  child: Container(
                    height: 190.h,
                    width: 190.w,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          AppAssets.kAvatar1,
                        ),
                      ),
                      border: Border.all(
                        color: isDarkMode(context)
                            ? AppColors.kGrey
                            : Colors.white,
                        width: 6.w,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 210,
                  left: 130,
                  child: Container(
                    height: 60.0.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          isDarkMode(context) ? AppColors.kGrey : Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: isDarkMode(context)
                              ? AppColors.kGrey
                              : Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.bottomLeft,
              padding:
                  EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
              height: 130.0,
              child: Text(
                'Shameel Irtaza',
                style: AppTypography.kBold32,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
              child: Text(
                'Flutter Developer',
                style: AppTypography.kBold18.copyWith(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: AppSpacing.tenVertical,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
              child: Row(
                children: [
                  Expanded(
                    child: CustomFriendsButton(
                      onTap: () {},
                      text: 'Add Story',
                      radius: 5.r,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(width: AppSpacing.tenHorizontal),
                  Expanded(
                    child: CustomFriendsButton(
                      onTap: () {},
                      text: 'Edit Profile',
                      radius: 5.0.r,
                    ),
                  ),
                  SizedBox(width: AppSpacing.tenHorizontal),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffEBECF0),
                    ),
                    onPressed: () {},
                    child: const Icon(
                      Icons.more_horiz,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppSpacing.tenVertical,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
              child: Text(
                'Friends',
                style: AppTypography.kBold22,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
              child: Text(
                '1301 Friends',
                style: AppTypography.kLight14.copyWith(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: GridView.builder(
                itemCount: 6,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.h,
                  mainAxisSpacing: 4.w,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10.r),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          AppAssets.kAvatar1,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.twentyHorizontal,
              ),
              child: PrimaryButton(
                text: 'See All Friends',
                onTap: () {},
                borderRadius: 5.01.r,
                height: 45.0.h,
              ),
            ),
            SizedBox(
              height: AppSpacing.tenVertical,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
              child: Text(
                'Posts',
                style: AppTypography.kBold22,
              ),
            ),
            SizedBox(height: AppSpacing.twentyVertical),
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10.w,
                ),
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) => const FeedCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
