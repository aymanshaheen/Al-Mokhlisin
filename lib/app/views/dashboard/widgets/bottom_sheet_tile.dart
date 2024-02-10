import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hisnelmoslem/app/data/app_data.dart';
import "package:hisnelmoslem/app/data/models/models.dart";
import 'package:hisnelmoslem/app/modules/azkar_card.dart/azkar_read_card.dart';
import 'package:hisnelmoslem/app/modules/azkar_page/azkar_read_page.dart';
import 'package:hisnelmoslem/app/shared/transition_animation/transition_animation.dart';
import 'package:hisnelmoslem/app/views/dashboard/dashboard_controller.dart';
import 'package:hisnelmoslem/core/utils/azkar_database_helper.dart';
import 'package:hisnelmoslem/core/values/app_size.dart';
import 'package:hisnelmoslem/core/values/constant.dart';

class BottomSheetTile extends StatelessWidget {
  final int index;
  final DbTitle fehrsTitle;

  const BottomSheetTile({
    super.key,
    required this.fehrsTitle,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: AppSize.s5),
          child: ListTile(
              title: Text(
                fehrsTitle.name,
                // style: getAppTheme().textTheme.titleMedium
              ),
              trailing: fehrsTitle.favourite
                  ? IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: mainColor,
                      ),
                      onPressed: () {
                        azkarDatabaseHelper.deleteTitleFromFavourite(
                          dbTitle: fehrsTitle,
                        );
                        //
                        fehrsTitle.favourite = false;
                        //
                        controller.allTitle
                            .firstWhere(
                              (element) =>
                                  element.orderId == fehrsTitle.orderId,
                            )
                            .favourite = false;
                        //
                        controller.favouriteTitle.removeWhere(
                          (item) => item.orderId == fehrsTitle.orderId,
                        );

                        controller.favouriteTitle
                            .sort((a, b) => a.orderId.compareTo(b.orderId));
                        //
                        controller.update();
                      },
                    )
                  : IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {
                        //
                        azkarDatabaseHelper.addTitleToFavourite(
                          dbTitle: fehrsTitle,
                        );
                        fehrsTitle.favourite = true;
                        //
                        controller.allTitle[fehrsTitle.orderId - 1] =
                            fehrsTitle;
                        controller.favouriteTitle.add(fehrsTitle);
                        controller.favouriteTitle
                            .sort((a, b) => a.orderId.compareTo(b.orderId));
                        //
                        controller.update();
                        //
                      },
                    ),
              onTap: () {
                if (!appData.isCardReadMode) {
                  transitionAnimation.circleReval(
                    context: Get.context!,
                    goToPage: AzkarReadPage(index: fehrsTitle.id),
                  );
                } else {
                  transitionAnimation.circleReval(
                    context: Get.context!,
                    goToPage: AzkarReadCard(index: fehrsTitle.id),
                  );
                }
              }),
        );
      },
    );
  }
}

/* IconButton(
    onPressed: () => showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.black,
      isDismissible: false,
      barrierColor: AppColors.grey.withOpacity(0.5),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
      builder: (context) => Container(
        height: AppSize.s625,
        padding: const EdgeInsets.symmetric(
            horizontal: AppSize.s30, vertical: AppSize.s30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("إضافة",
                    textAlign: TextAlign.right,
                  //  style: getAppTheme().textTheme.titleMedium
              ),
                Text("اختار الاذكار",
                    textAlign: TextAlign.right,
                 //   style: getAppTheme().textTheme.titleMedium
                    ),
              ],
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            SizedBox(
              height: AppSize.s350,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: AppConstants.imagesName.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSize.s5),
                      child: ListTile(
                        title: Text(AppConstants.titleName[index],
                           // style: getAppTheme().textTheme.titleMedium
                        ),
                        trailing: Icon(Icons.favorite_border),
                        iconColor: AppColors.white,
                        // onTap: () => ,
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    ),
    icon: const Icon(Icons.add, color: AppColors.white),
  );
}*/
