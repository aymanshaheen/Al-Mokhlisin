import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hisnelmoslem/core/values/app_size.dart';

Widget userData() {
  return Container(
    child: Padding(
      padding: EdgeInsets.only(
          left: AppSize.s20,
          right: AppSize.s20,
          bottom: AppSize.s15,
          top: AppSize.s40),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/images/dark_icon.svg",
            height: 44,
            width: 44,
          ),
          SizedBox(
            width: AppSize.s10,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'السلام عليكم',
                style: TextStyle(
                  color: Color(0xFF9A9A9A),
                  fontSize: 12,
                  fontFamily: 'Almarai',
                  fontWeight: FontWeight.w400,
                  height: 0.10,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'بلال',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Almarai',
                  fontWeight: FontWeight.w700,
                  height: 0.08,
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            height: 40,
            width: 70,
            decoration: BoxDecoration(
                color: Color.fromRGBO(28, 28, 28, 1),
                borderRadius: BorderRadius.all(Radius.circular(52))),
            child: Row(
              children: [
                Container(
                  height: AppSize.s30,
                  width: AppSize.s30,
                  padding: EdgeInsets.only(top: AppSize.s3, right: AppSize.s5),
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Center(
                    child: Text(
                      '1',
                      // style: getAppTheme().textTheme.titleMedium,
                    ),
                  ),
                ),
                Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(43, 43, 43, 1),
                    shape: BoxShape.circle,
                  ),
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: SvgPicture.asset(
                        "assets/images/cup.svg",
                        width: 10,
                        height: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
