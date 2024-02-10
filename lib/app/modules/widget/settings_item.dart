import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hisnelmoslem/core/values/app_size.dart';

class SettingsItem extends StatelessWidget {
  String settingsTitle;

  SettingsItem({super.key, required this.settingsTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSize.s10),
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        height: AppSize.s65,
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1C),
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ListTile(
                title: Text(
                  settingsTitle,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Color(0xFFF8F8F8),
                    fontSize: 16,
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.w700,
                    height: 0.12,
                  ),
                ),
                leading: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/images/drag.svg',
                        color: const Color(0xFFD9D9D9))),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/images/arrow_back.svg',
                    color: const Color(0xFFD9D9D9))),
          ],
        ),
      ),
    );
  }
}

List<SettingsItem> settingsList = [
  SettingsItem(
    settingsTitle: 'اعدادات عامة',
  ),
  SettingsItem(
    settingsTitle: 'اعدادات المصحف',
  ),
  SettingsItem(
    settingsTitle: 'اعدادات الاذكار و التسبيح',
  ),
  SettingsItem(
    settingsTitle: 'مواقع التواصل',
  ),
];
