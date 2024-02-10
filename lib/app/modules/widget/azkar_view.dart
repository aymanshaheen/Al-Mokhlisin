import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hisnelmoslem/app/modules/widget/bottom_sheet.dart';
import 'package:hisnelmoslem/app/shared/widgets/empty.dart';
import 'package:hisnelmoslem/app/views/dashboard/dashboard_controller.dart';
import 'package:hisnelmoslem/app/views/dashboard/widgets/azkar_tile.dart';
import 'package:hisnelmoslem/core/utils/alarm_database_helper.dart';
import 'package:hisnelmoslem/core/values/app_size.dart';

class AzkarView extends StatefulWidget {
  const AzkarView({super.key});

  @override
  State<AzkarView> createState() => _AzkarViewState();
}

class _AzkarViewState extends State<AzkarView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: AppSize.s15,
        ),
        Row(
          children: [
            const SizedBox(
              width: AppSize.s10,
            ),
            SvgPicture.asset(
              "assets/images/azkar_icon.svg",
            ),
            const SizedBox(
              width: AppSize.s5,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                'الاذكار',
                textAlign: TextAlign.right,
                //style: getAppTheme().textTheme.titleMedium
              ),
            ),
            const Spacer(),
            bottomSheet(context),
          ],
        ),
        const SizedBox(
          height: AppSize.s5,
        ),
        azkarViewItem(context),
      ],
    );
  }
}

@override
Widget azkarViewItem(BuildContext context) {
  return GetBuilder<DashboardController>(
    builder: (controller) {
      return controller.favouriteTitle.isEmpty
          ? Empty(
              isImage: false,
              icon: Icons.bookmark_outline_rounded,
              title: "nothing found in favourites".tr,
              description:
                  "no title from the index is marked as a favourite. Click on the Favorites icon at any index title"
                      .tr,
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return FutureBuilder(
                    future: alarmDatabaseHelper.getAlarmByZikrTitle(
                      dbTitle: controller.favouriteTitle[index],
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return HomeAzkarTile(
                          index: index,
                          fehrsTitle: controller.favouriteTitle[index],
                        );
                      } else {
                        return Container();
                      }
                    },
                  );
                },
                itemCount: controller.favouriteTitle.length,
              ),
            );
    },
  );
}
