import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hisnelmoslem/core/values/app_size.dart';

Widget calendarTime() {
  return Column(
    children: [
      Row(textDirection: TextDirection.rtl, children: [
        const SizedBox(
          width: AppSize.s10,
        ),
        SvgPicture.asset(
          "assets/images/calendar_month.svg",
          color: Color.fromRGBO(249, 249, 249, 1),
          height: 24,
          width: 24,
        ),
        const SizedBox(
          width: AppSize.s5,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            'التقويم الهجري',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xFFF8F8F8),
              fontSize: 16,
              fontFamily: 'Almarai',
              fontWeight: FontWeight.w700,
              height: 0.12,
            ),
          ),
        )
      ]),
      const SizedBox(
        height: AppSize.s10,
      ),
      Container(
        height: AppSize.s150,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(right: 5, left: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/moon.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const Positioned(
              right: AppSize.s30,
              bottom: AppSize.s50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    
                children: [
                  Text(
                    '14 - رجب - 1440',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFFF8F8F8),
                      fontSize: 14,
                      fontFamily: 'Almarai',
                      fontWeight: FontWeight.w700,
                      height: 0.16,
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s30,
                  ),
                  Text(
                    'مساء الخير',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Almarai',
                      fontWeight: FontWeight.w700,
                      height: 0.16,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )
    ],
  );
}
