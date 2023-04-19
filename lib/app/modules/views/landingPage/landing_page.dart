import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/data/helpers/rive_helper.dart';
import 'package:chatie/app/modules/views/friends/friends_view.dart';
import 'package:chatie/app/modules/views/home/home_view.dart';
import 'package:chatie/app/modules/views/landingPage/components/menu.dart';
import 'package:chatie/app/modules/views/landingPage/components/nav_bar_item.dart';
import 'package:chatie/app/modules/views/notifications/notifications.dart';
import 'package:chatie/app/modules/views/profile/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  List<Widget> pages = [
    const HomeView(),
    const FriendsView(),
    Container(),
    const Notifications(),
    const SettingsView(),
  ];
  Menu selectedBottomNav = bottomNavBarMenu.first;

  void updateSelectedBtmNav(Menu menu) {
    if (selectedBottomNav != menu) {
      setState(() {
        selectedBottomNav = menu;
      });
    }
  }

  late AnimationController _animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(
        () {
          setState(() {});
        },
      );
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ));
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: pages[bottomNavBarMenu.indexOf(selectedBottomNav)],
      bottomNavigationBar: Transform.translate(
        offset: Offset(0, animation.value * 100),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(12.h),
            margin: EdgeInsets.only(
              left: AppSpacing.twentyHorizontal,
              right: AppSpacing.twentyHorizontal,
              bottom: AppSpacing.tenVertical,
            ),
            decoration: BoxDecoration(
              color: AppColors.kGrey,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  bottomNavBarMenu.length,
                  (index) {
                    final navBar = bottomNavBarMenu[index];
                    return NavBarItem(
                      navBar: navBar,
                      press: () {
                        RiveHelper.changeSMIBoolState(navBar.rive.status!);
                        updateSelectedBtmNav(navBar);
                      },
                      riveOnInit: (artboard) {
                        navBar.rive.status = RiveHelper.getRiveInput(
                          artboard,
                          stateMachineName: navBar.rive.stateMachineName,
                        );
                      },
                      selectedNav: selectedBottomNav,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
