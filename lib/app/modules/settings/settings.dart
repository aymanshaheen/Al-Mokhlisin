import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hisnelmoslem/app/data/app_data.dart';
import 'package:hisnelmoslem/app/modules/app_language_page/app_language_page.dart';
import 'package:hisnelmoslem/app/modules/font_family_page/font_family_page.dart';
import 'package:hisnelmoslem/app/modules/settings/alarm_settings.dart';
import 'package:hisnelmoslem/app/modules/settings/font_settings.dart';
import 'package:hisnelmoslem/app/modules/settings/settings_controller.dart';
import 'package:hisnelmoslem/app/modules/settings/settings_tile.dart';
import 'package:hisnelmoslem/app/modules/sound_manager/sounds_manager_page.dart';
import 'package:hisnelmoslem/app/modules/theme_manager/themes_manager_page.dart';
import 'package:hisnelmoslem/app/shared/transition_animation/transition_animation.dart';
import 'package:hisnelmoslem/core/values/constant.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      init: SettingsController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            title: Text(
              "settings".tr,
              style: const TextStyle(fontFamily: "Uthmanic"),
            ),
            // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          body: ListView(
            children: [
              if (!appData.isCardReadMode)
                SettingsTile(
                  title: "page mode".tr,
                  onTap: () {
                    appData.toggleReadModeStatus();
                    controller.update();
                  },
                  context: context,
                  icon: MdiIcons.bookOpenPageVariant,
                )
              else
                SettingsTile(
                  title: "card mode".tr,
                  onTap: () {
                    appData.toggleReadModeStatus();
                    controller.update();
                  },
                  context: context,
                  icon: MdiIcons.card,
                ),
              SettingsTile(
                title: "theme manager".tr,
                onTap: () {
                  transitionAnimation.fromBottom2Top(
                    context: context,
                    goToPage: const ThemeManagerPage(),
                  );
                },
                context: context,
                icon: Icons.palette,
              ),
              SettingsTile(
                title: "effect manager".tr,
                onTap: () {
                  transitionAnimation.fromBottom2Top(
                    context: context,
                    goToPage: const SoundsManagerPage(),
                  );
                },
                context: context,
                icon: Icons.speaker_group,
              ),
              SettingsTile(
                title: "app language".tr,
                onTap: () {
                  transitionAnimation.fromBottom2Top(
                    context: context,
                    goToPage: const AppLanguagePage(),
                  );
                },
                context: context,
                icon: Icons.translate,
              ),
              SettingsTile(
                title: "font type".tr,
                onTap: () {
                  transitionAnimation.fromBottom2Top(
                    context: context,
                    goToPage: const FontFamilyPage(),
                  );
                },
                context: context,
                icon: Icons.font_download,
              ),
              SettingsTile(
                title: "اعدادات الخط",
                onTap: () {
                  transitionAnimation.fromBottom2Top(
                    context: context,
                    goToPage: const FontSettingsTile(),
                  );
                },
                context: context,
                icon: MdiIcons.formatSize,
              ),
              SettingsTile(
                title: "اعدادات التنبيه",
                onTap: () {
                  transitionAnimation.fromBottom2Top(
                    context: context,
                    goToPage: const AlarmSettingsTile(),
                  );
                },
                context: context,
                icon: MdiIcons.alarm,
              ),
              /**/

              const Divider(),
            ],
          ),
        );
      },
    );
  }
}

class Title extends StatelessWidget {
  final String title;

  const Title({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: Icon(Icons.bookmark_border),

      title: Text(
        title,
        style: TextStyle(fontSize: 20, color: mainColor),
      ),
    );
  }
}
/*
  Title(title: 'contact'.tr),
              ListTile(
                leading: const Icon(Icons.star),
                title: Text("report bugs and request new features".tr),
                onTap: () {
                  EmailManager.sendFeedbackForm();
                },
              ),
              ListTile(
                leading: const Icon(MdiIcons.gmail),
                title: Text("send email".tr),
                onTap: () {
                  EmailManager.messageUS();
                },
              ),
              ListTile(
                leading: const Icon(MdiIcons.github),
                trailing: const Icon(Icons.keyboard_arrow_left),
                title: Text("Github".tr),
                onTap: () async {
                  await openURL(
                    'https://github.com/muslimpack/HisnElmoslem_App',
                  );
                },
              ),
              ListTile(
                leading: const Icon(MdiIcons.information),
                trailing: const Icon(Icons.keyboard_arrow_left),
                title: Text("about us".tr),
                onTap: () {
                  transitionAnimation.fromBottom2Top(
                    context: context,
                    goToPage: const About(),
                  );
                },
              ),
              */