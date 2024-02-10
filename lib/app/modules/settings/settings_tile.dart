import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hisnelmoslem/core/values/app_size.dart';

Widget SettingsTile(
    {required String title,
    required IconData icon,
    required BuildContext context,
    required void Function() onTap}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: AppSize.s10, right: AppSize.s10),
    child: Container(
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
                title,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Color(0xFFF8F8F8),
                  fontSize: 16,
                  fontFamily: 'Almarai',
                  fontWeight: FontWeight.w700,
                  height: 0.12,
                ),
              ),
              leading: Icon(icon),
              onTap: onTap,
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
