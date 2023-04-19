import 'package:chatie/app/controllers/theme_controller.dart';
import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/data/helpers/theme_helper.dart';
import 'package:chatie/app/modules/views/profile/components/profile_header.dart';
import 'package:chatie/app/modules/views/profile/components/settings_card.dart';
import 'package:chatie/app/modules/views/profile/components/theme_mode_selection.dart';
import 'package:chatie/app/modules/views/profile/profile_page_view.dart';
import 'package:chatie/app/modules/widgets/dialogs/logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: AppTypography.kBold18,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProfileHeader(
              onTap: () {
                Get.to<Widget>(() => const ProfilePageView());
              },
            ),
            SizedBox(
              height: AppSpacing.tenVertical,
            ),
            Padding(
              padding: EdgeInsets.only(left: AppSpacing.twentyHorizontal),
              child: Text(
                'Account',
                style: AppTypography.kBold22,
              ),
            ),
            SizedBox(
              height: AppSpacing.tenVertical,
            ),
            Container(
              color: isDarkMode(context) ? AppColors.kGrey : Colors.white,
              padding: EdgeInsets.symmetric(
                vertical: AppSpacing.twentyVertical,
                horizontal: AppSpacing.twentyHorizontal,
              ),
              child: Column(
                children: [
                  GetBuilder<ThemeController>(
                    init: ThemeController(),
                    initState: (_) {},
                    builder: (_) {
                      return SettingsCard(
                        onTap: () {
                          Get.bottomSheet<Widget>(ThemeModeSelection(
                            currentTheme: _.theme,
                            theme: theme,
                            lightThemeCallback: () {
                              _.setTheme('light');
                              Get.back<void>();
                            },
                            darkThemeCallback: () {
                              _.setTheme('dark');
                              Get.back<void>();
                            },
                            systemThemeCallback: () {
                              _.setTheme('system');
                              Get.back<void>();
                            },
                          ));
                        },
                        title: 'Dark Mode',
                        subTitle: 'Dark',
                        iconColor: Colors.orange,
                        icon: Icons.brightness_2,
                      );
                    },
                  ),
                  SettingsCard(
                    onTap: () {},
                    title: 'Notifications',
                    subTitle: 'Turn ON/OFF Notifications',
                    iconColor: Colors.red,
                    icon: Icons.notifications,
                  ),
                  SettingsCard(
                    onTap: () {},
                    title: 'Privacy',
                    subTitle: 'Privacy settings',
                    iconColor: Colors.green,
                    icon: Icons.lock,
                  ),
                  SettingsCard(
                    onTap: () {},
                    title: 'Help',
                    subTitle: 'Help and feedback',
                    iconColor: Colors.blue,
                    icon: Icons.help_outline,
                  ),
                  SettingsCard(
                    onTap: () {
                      Get.dialog<Widget>(const LogoutDialog());
                    },
                    title: 'Logout',
                    subTitle: 'Logout',
                    iconColor: Colors.black,
                    icon: Icons.exit_to_app,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
