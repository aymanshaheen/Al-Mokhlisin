import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hisnelmoslem/app/modules/settings/settings_controller.dart';
import 'package:hisnelmoslem/app/modules/settings/settings_tile.dart';
import 'package:hisnelmoslem/app/shared/widgets/font_settings.dart';

class FontSettingsTile extends StatelessWidget {
  const FontSettingsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "اعدادات الخط",
            style: const TextStyle(fontFamily: "Uthmanic"),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: ListView(children: [
          TextSample(
            controllerToUpdate: controller,
          ),
          FontSettingsToolbox(
            controllerToUpdate: controller,
          ),
        ]),
      );
    });
  }
}
