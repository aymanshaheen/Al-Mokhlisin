import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hisnelmoslem/app/modules/quran/quran_controller.dart';
import 'package:hisnelmoslem/app/modules/quran/quran_read_page.dart';
import 'package:hisnelmoslem/app/modules/screens/azkar_screen.dart';
import 'package:hisnelmoslem/app/modules/screens/home_screen.dart';
import 'package:hisnelmoslem/app/modules/screens/quran_screen.dart';
import 'package:hisnelmoslem/app/modules/screens/tasbeeh_screen.dart';
import 'package:hisnelmoslem/app/modules/settings/settings.dart';
import 'package:hisnelmoslem/app/shared/widgets/loading.dart';
import 'package:hisnelmoslem/app/views/dashboard/dashboard_controller.dart';
import 'package:hisnelmoslem/core/values/app_colors.dart';
import 'package:hisnelmoslem/core/values/app_size.dart';
import 'package:hisnelmoslem/core/values/app_strings.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  void itemTapped(int x) {
    setState(() {
      selectedIndex = x;
    });
  }

  List<Widget> screens = [
    const HomeScreen(),
    const QuranScreen(),
    const AzkarScreen(),
    const TasbeehScreen(),
    const Settings(),
  ];
  @override
  GetBuilder<DashboardController> build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) => controller.isLoading
          ? const Loading()
          : Scaffold(
              body: screens[selectedIndex],
              bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: AppColors.black,
                  selectedItemColor: Color.fromRGBO(51, 132, 255, 1),
                  unselectedLabelStyle:
                      TextStyle(color: Color.fromRGBO(191, 191, 191, 1)),
                  selectedLabelStyle: TextStyle(
                    color: Color.fromRGBO(51, 132, 255, 1),
                  ),
                  onTap: itemTapped,
                  currentIndex: selectedIndex,
                  items: [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/images/mosque.svg',
                        colorFilter: ColorFilter.mode(
                          selectedIndex == 0
                              ? Color.fromRGBO(51, 132, 255, 1)
                              : Color.fromRGBO(191, 191, 191, 1),
                          BlendMode.srcIn,
                        ),
                      ),
                      label: AppStrings.firstTitle,
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/images/moshaf_icon.svg',
                        colorFilter: ColorFilter.mode(
                          selectedIndex == 1
                              ? Color.fromRGBO(51, 132, 255, 1)
                              : Color.fromRGBO(191, 191, 191, 1),
                          BlendMode.srcIn,
                        ),
                      ),
                      label: AppStrings.secondTitle,
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        height: AppSize.s30,
                        'assets/images/azkar_icon.svg',
                        colorFilter: ColorFilter.mode(
                          selectedIndex == 2
                              ? Color.fromRGBO(51, 132, 255, 1)
                              : Color.fromRGBO(191, 191, 191, 1),
                          BlendMode.srcIn,
                        ),
                      ),
                      label: AppStrings.thirdTitle,
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/images/tasbeeh_icon.svg',
                        colorFilter: ColorFilter.mode(
                          selectedIndex == 3
                              ? Color.fromRGBO(51, 132, 255, 1)
                              : Color.fromRGBO(191, 191, 191, 1),
                          BlendMode.srcIn,
                        ),
                      ),
                      label: AppStrings.fourthTitle,
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/images/settings_icon.svg',
                        colorFilter: ColorFilter.mode(
                          selectedIndex == 4
                              ? Color.fromRGBO(51, 132, 255, 1)
                              : Color.fromRGBO(191, 191, 191, 1),
                          BlendMode.srcIn,
                        ),
                      ),
                      label: AppStrings.fifthTitle,
                    ),
                  ]),
            ),
    );
  }
}
