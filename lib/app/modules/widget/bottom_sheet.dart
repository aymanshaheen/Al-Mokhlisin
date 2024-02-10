import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hisnelmoslem/app/data/models/zikr_title.dart';
import 'package:hisnelmoslem/app/views/dashboard/dashboard_controller.dart';
import 'package:hisnelmoslem/app/views/dashboard/widgets/bottom_sheet_tile.dart';
import 'package:hisnelmoslem/app/views/dashboard/widgets/title_card.dart';
import 'package:hisnelmoslem/core/utils/alarm_database_helper.dart';
import 'package:hisnelmoslem/core/values/app_colors.dart';
import 'package:hisnelmoslem/core/values/app_constant.dart';
import 'package:hisnelmoslem/core/values/app_size.dart';

@override
Widget bottomSheet(BuildContext context) {
  return GetBuilder<DashboardController>(builder: (controller) {
    final List<DbTitle> titleListToDisplay = controller.searchedTitle;
    return IconButton(
        icon: const Icon(Icons.add, color: AppColors.white),
        onPressed: () => showModalBottomSheet(
              context: context,
              backgroundColor: AppColors.black,
              isDismissible: false,
              barrierColor: AppColors.grey.withOpacity(0.5),
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(40))),
              builder: (context) => Container(
                  height: AppSize.s625,
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSize.s30, vertical: AppSize.s30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "اختار الاذكار",
                            textAlign: TextAlign.right,
                            //   style: getAppTheme().textTheme.titleMedium
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "تعديل",
                              textAlign: TextAlign.right,
                              //  style: getAppTheme().textTheme.titleMedium
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      SizedBox(
                        height: AppSize.s332,
                        child: Scrollbar(
                          controller: controller.fehrsScrollController,
                          thumbVisibility: false,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.only(top: 10),
                            itemCount: titleListToDisplay.length,
                            itemBuilder: (context, index) {
                              return FutureBuilder(
                                future: alarmDatabaseHelper.getAlarmByZikrTitle(
                                  dbTitle: titleListToDisplay[index],
                                ),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return BottomSheetTile(
                                      index: index,
                                      fehrsTitle: titleListToDisplay[index],
                                    );
                                  } else {
                                    return const ListTile();
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  )),
            ));
  });
}
