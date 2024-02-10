import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hisnelmoslem/app/data/models/zikr_title.dart';
import 'package:hisnelmoslem/app/views/dashboard/dashboard_controller.dart';
import 'package:hisnelmoslem/app/views/dashboard/widgets/azkar_tile.dart';
import 'package:hisnelmoslem/core/utils/alarm_database_helper.dart';
import 'package:hisnelmoslem/core/values/app_colors.dart';
import 'package:hisnelmoslem/core/values/app_size.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({super.key});

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        final List<DbTitle> titleListToDisplay = controller.searchedTitle;
        return Scaffold(
          backgroundColor: AppColors.black,
          appBar: AppBar(
            backgroundColor: AppColors.black,
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: AppSize.s10),
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(28, 28, 28, 1),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: SvgPicture.asset(
                      'assets/images/settings.svg',
                      height: 20,
                      width: 20,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
            title: const Padding(
              padding: EdgeInsets.only(right: AppSize.s10),
              child: Text(
                ' الأذكار',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFFF8F8F8),
                  fontSize: 20,
                  fontFamily: 'Almarai',
                  fontWeight: FontWeight.w800,
                  height: 0.06,
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.s5),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 4.7 / 6,
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
                              return AzkarScreenTile(
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
              ),
            ],
          ),
        );
      },
    );
  }
}
