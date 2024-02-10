import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hisnelmoslem/app/modules/rearrange_dashboard/rearrange_dashboard_page_controller.dart';
import 'package:hisnelmoslem/app/modules/widget/azkar_view.dart';
import 'package:hisnelmoslem/app/modules/widget/calendar_time.dart';
import 'package:hisnelmoslem/app/modules/widget/telawat_view.dart';
import 'package:hisnelmoslem/app/modules/widget/user_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RearrangeDashboardPageController>(
      init: RearrangeDashboardPageController(),
      builder: (rearrangeController) {
        return SingleChildScrollView(
          child: Column(
            children: [
              userData(),
              calendarTime(),
              const AzkarView(),
              TelawatView(),

              /*TabBarView(
            physics: const BouncingScrollPhysics(),
            controller: controller.tabController,
            children: [
              ...List.generate(
                appDashboardItem.length,
                (index) {
                  return appDashboardItem[rearrangeController.list[index]]
                      .widget;
                },
              ),
            ],
          );*/
            ],
          ),
        );
      },
    );
  }
}
