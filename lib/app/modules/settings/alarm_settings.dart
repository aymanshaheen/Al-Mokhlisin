import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hisnelmoslem/app/data/app_data.dart';
import 'package:hisnelmoslem/app/modules/alarms_manager/alarms_page.dart';
import 'package:hisnelmoslem/app/modules/settings/settings_controller.dart';
import 'package:hisnelmoslem/app/modules/settings/settings_tile.dart';
import 'package:hisnelmoslem/app/shared/functions/get_snackbar.dart';
import 'package:hisnelmoslem/app/shared/transition_animation/transition_animation.dart';
import 'package:hisnelmoslem/app/shared/widgets/font_settings.dart';
import 'package:hisnelmoslem/core/values/constant.dart';

class AlarmSettingsTile extends StatelessWidget {
  const AlarmSettingsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "اعدادات التنبيه",
            style: const TextStyle(fontFamily: "Uthmanic"),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: ListView(children: [
              ListTile(
                title: Text("reminders manager".tr),
                leading: const Icon(
                  Icons.alarm_add_rounded,
                ),
                onTap: () {
                  transitionAnimation.fromBottom2Top(
                    context: context,
                    goToPage: const AlarmsPages(),
                  );
                },
              ),
              SwitchListTile(
                title: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(
                    Icons.person,
                  ),
                  title: Text("fasting mondays and thursdays reminder".tr),
                ),
                activeColor: mainColor,
                value: appData.isFastAlarmEnabled,
                onChanged: (value) {
                  appData.changFastAlarmStatus(value: value);

                  if (appData.isFastAlarmEnabled) {
                    getSnackbar(
                      message:
                          "${"activate".tr} | ${"fasting mondays and thursdays reminder".tr}",
                    );
                  } else {
                    getSnackbar(
                      message:
                          "${"deactivate".tr} | ${"fasting mondays and thursdays reminder".tr}",
                    );
                  }
                  controller.update();
                },
              ),
              SwitchListTile(
                title: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(
                    Icons.alarm,
                  ),
                  title: Text("sura Al-Kahf reminder".tr),
                ),
                activeColor: mainColor,
                value: appData.isCaveAlarmEnabled,
                onChanged: (value) {
                  appData.changCaveAlarmStatus(value: value);

                  if (appData.isCaveAlarmEnabled) {
                    getSnackbar(
                      message:
                          "${"activate".tr} | ${"sura Al-Kahf reminder".tr}",
                    );
                  } else {
                    getSnackbar(
                      message:
                          "${"deactivate".tr} | ${"sura Al-Kahf reminder".tr}",
                    );
                  }
                  controller.update();
                },
              ),
              const Divider(),
              /**/
        ]),
      );
    });
  }
}
