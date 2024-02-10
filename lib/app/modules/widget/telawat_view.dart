import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hisnelmoslem/app/modules/widget/telawat_item.dart';
import 'package:hisnelmoslem/core/values/app_size.dart';

class TelawatView extends StatelessWidget {
  List<TelawatItem> telawatList = [
    TelawatItem(
      text: 'الفاتحة',
    ),
    TelawatItem(
      text: 'البقرة',
    ),
    TelawatItem(
      text: 'الكهف',
    ),
  ];
  TelawatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: AppSize.s10,
        ),
        Row(
          children: [
            const SizedBox(
              width: AppSize.s10,
            ),
            SvgPicture.asset('assets/images/telawa.svg'),
            const SizedBox(
              width: AppSize.s5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'التلاوات',
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
          ],
        ),
        const SizedBox(
          height: AppSize.s5,
        ),
        SizedBox(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.only(right: AppSize.s5, left: AppSize.s5),
            child: ListView.builder(
                itemCount: telawatList.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return telawatList[index];
                }),
          ),
        )
      ],
    );
  }
}
