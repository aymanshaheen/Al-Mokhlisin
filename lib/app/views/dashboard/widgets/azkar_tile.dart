import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hisnelmoslem/app/data/app_data.dart';
import "package:hisnelmoslem/app/data/models/models.dart";
import 'package:hisnelmoslem/app/modules/azkar_card.dart/azkar_read_card.dart';
import 'package:hisnelmoslem/app/modules/azkar_page/azkar_read_page.dart';
import 'package:hisnelmoslem/app/shared/transition_animation/transition_animation.dart';
import 'package:hisnelmoslem/app/views/dashboard/dashboard_controller.dart';
import 'package:hisnelmoslem/core/values/app_constant.dart';
import 'package:hisnelmoslem/core/values/app_size.dart';

class TextCard extends StatelessWidget {
  final int index;
  final DbTitle fehrsTitle;

  const TextCard({
    super.key,
    required this.fehrsTitle,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Text(
          fehrsTitle.name,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(
            color: Color(0xFFF8F8F8),
            fontSize: 14,
            fontFamily: 'Almarai',
            fontWeight: FontWeight.w700,
            height: 0.09,
          ),
          textAlign: TextAlign.right,
        );
      },
    );
  }
}

class AzkarScreenTile extends StatelessWidget {
  final int index;
  final DbTitle fehrsTitle;

  const AzkarScreenTile({
    super.key,
    required this.fehrsTitle,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
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
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(
                        right: AppSize.s10,
                        top: AppSize.s10,
                      ),
                      child: Text(
                        fehrsTitle.name,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Color(0xFFF8F8F8),
                          fontSize: 16,
                          fontFamily: 'Almarai',
                          fontWeight: FontWeight.w700,
                          height: 0.12,
                        ),
                      ),
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
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/images/arrow_back.svg',
                    color: const Color(0xFFD9D9D9),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HomeAzkarTile extends StatelessWidget {
  final int index;
  final DbTitle fehrsTitle;

  const HomeAzkarTile({
    super.key,
    required this.fehrsTitle,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return InkWell(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSize.s2),
                height: 120,
                width: 130,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    AppConstants.imagesName[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s15,
              ),
              TextCard(
                index: index,
                fehrsTitle: controller.favouriteTitle[index],
              ),
            ],
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
          },
        );
      },
    );
  }
}
  /*    leading: fehrsTitle.favourite
              ? IconButton(
                  icon: Icon(
                    Icons.bookmark,
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
                          (element) => element.orderId == fehrsTitle.orderId,
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
                  icon: const Icon(Icons.bookmark_border_outlined),
                  onPressed: () {
                    //
                    azkarDatabaseHelper.addTitleToFavourite(
                      dbTitle: fehrsTitle,
                    );
                    fehrsTitle.favourite = true;
                    //
                    controller.allTitle[fehrsTitle.orderId - 1] = fehrsTitle;
                    controller.favouriteTitle.add(fehrsTitle);
                    controller.favouriteTitle
                        .sort((a, b) => a.orderId.compareTo(b.orderId));
                    //
                    controller.update();
                    //
                  },
                ),
              trailing: !dbAlarm.hasAlarmInside
              ? IconButton(
                  icon: const Icon(Icons.alarm_add_rounded),
                  onPressed: () {
                    dbAlarm.title = fehrsTitle.name;
                    showFastAlarmDialog(
                      context: context,
                      dbAlarm: dbAlarm,
                      isToEdit: false,
                    ).then((value) {
                      if (value is DbAlarm) {
                        final int index = controller.alarms.indexOf(dbAlarm);
                        if (value.hasAlarmInside) {
                          if (index == -1) {
                            controller.alarms.add(value);
                          } else {
                            controller.alarms[index] = value;
                          }
                          controller.update();
                        }
                      }
                    });
                  },
                )
              : tempAlarm.isActive
                  ? GestureDetector(
                      onLongPress: () {
                        showFastAlarmDialog(
                          context: context,
                          dbAlarm: dbAlarm,
                          isToEdit: true,
                        ).then((value) {
                          if (value is DbAlarm) {
                            if (value.hasAlarmInside) {
                              // int index = controller.alarms.indexOf(dbAlarm);
                              tempAlarm = value;
                              // controller.alarms[index] = value;
                              controller.update();
                            }
                          }
                        });
                      },
                      child: IconButton(
                        icon: Icon(
                          Icons.notifications_active,
                          color: mainColor,
                        ),
                        onPressed: () {
                          dbAlarm.isActive = tempAlarm.isActive = false;
                          alarmDatabaseHelper.updateAlarmInfo(dbAlarm: dbAlarm);

                          //
                          alarmManager.alarmState(dbAlarm: dbAlarm);
                          //
                          controller.update();
                        },
                      ),
                    )
                  : IconButton(
                      icon: Icon(
                        Icons.notifications_off,
                        color: redAccent,
                      ),
                      onPressed: () {
                        dbAlarm.isActive = tempAlarm.isActive = true;
                        alarmDatabaseHelper.updateAlarmInfo(dbAlarm: dbAlarm);

                        //
                        alarmManager.alarmState(dbAlarm: dbAlarm);
                        //
                        controller.update();
                      },
                    ),*/