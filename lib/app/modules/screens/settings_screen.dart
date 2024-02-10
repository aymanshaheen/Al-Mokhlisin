import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hisnelmoslem/app/modules/widget/settings_item.dart';
import 'package:hisnelmoslem/core/values/app_colors.dart';
import 'package:hisnelmoslem/core/values/app_size.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.black,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color(0xFF1C1C1C),
              ),
              child: IconButton(
                icon: SvgPicture.asset(
                  'assets/images/arrow_forward.svg',
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          title: const Center(
              child: Padding(
            padding: EdgeInsets.only(left: AppSize.s65),
            child: Text(
              'الاعدادات',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFFF8F8F8),
                fontSize: 20,
                fontFamily: 'Almarai',
                fontWeight: FontWeight.w800,
                height: 0.06,
              ),
            ),
          ))),
      body: Column(children: [
        const SizedBox(
          height: AppSize.s10,
        ),
        Padding(
            padding: const EdgeInsets.only(right: AppSize.s5, left: AppSize.s5),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 3 / 4,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: settingsList.length,
                itemBuilder: (context, index) {
                  return settingsList[index];
                },
              ),
            ))
      ]),
    );
  }
}
