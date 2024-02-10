import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hisnelmoslem/core/values/app_size.dart';

class TelawatItem extends StatelessWidget {
  String text;
  TelawatItem({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: AppSize.s2),
          child: Container(
            width: 120,
            height: 120,
            child: Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/surah_bgrnd.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SvgPicture.asset('assets/images/fateha.svg')
              /*  Center(
                  child: Text(
                text,
                style: TextStyle(color: Colors.white, fontFamily: 'Quran'),
              )) */
            ]),
          ),
          /*  child: Container(
            height: 120,
            width: 130,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/surah_bgrnd.jpg',
                fit: BoxFit.cover,
                
              ),
            ),
          ), */
        ),
        const SizedBox(
          height: AppSize.s15,
        ),
        Text(
          text,
          style: TextStyle(
            color: Color(0xFFF8F8F8),
            fontSize: 14,
            fontFamily: 'Almarai',
            fontWeight: FontWeight.w700,
            height: 0.09,
          ),
        ),
      ],
    );
  }
}
