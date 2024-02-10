import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hisnelmoslem/core/themes/theme_services.dart';


class QuranPageController extends GetxController {
  /* *************** Variables *************** */
  //

  QuranPageController();

  //
  static const _volumeBtnChannel = MethodChannel("volume_button_channel");

  //
  final quranReadPageScaffoldKey = GlobalKey<ScaffoldState>();
    final ScrollController quranScrollController = ScrollController();

  PageController pageController = PageController();
  int currentPage = 0;
  bool fabIsClicked = true;


  //
 /* final List<Quran> _quran = <Quran>[];
  List<Quran> quranDisplay = <Quran>[];
  Quran? quranRequiredSurah;
*/
List<dynamic> arabic =[];
List malayalam =[];
List quran =[];
  //
  bool isLoading = true;

  //

  /* *************** Controller life cycle *************** */
  //
  @override
  Future<void> onInit() async {
    super.onInit();
    // hide status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    //
    await fetchAzkar();
    //

  /*  _volumeBtnChannel.setMethodCallHandler((call) {
      if (call.method == "volumeBtnPressed") {
        if (call.arguments == "VOLUME_DOWN_UP") {
          pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
          );
        }
        if (call.arguments == "VOLUME_UP_UP") {
          pageController.previousPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
          );
        }
      }

      return Future.value();
    });
*/
    isLoading = false;
    update();
  }

  @override
  void onClose() {
    super.onClose();
    //
    pageController.dispose();
    //
    _volumeBtnChannel.setMethodCallHandler(null);
    //
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  /* *************** Functions *************** */

  ///
 /* void perpareRequiredPages(SurahNameEnum surahName) {
    if (surahName == SurahNameEnum.endofAliImran) {
      quranRequiredSurah = quranDisplay[0];
    } else if (surahName == SurahNameEnum.alKahf) {
      quranRequiredSurah = quranDisplay[1];
    } else if (surahName == SurahNameEnum.assajdah) {
      quranRequiredSurah = quranDisplay[2];
    } else if (surahName == SurahNameEnum.alMulk) {
      quranRequiredSurah = quranDisplay[3];
    }
  }*/

  ///
  /*Future<void> preparePages() async {
    await fetchAzkar().then((value) {
      _quran.addAll(value);
      quranDisplay = _quran;
    });
  }*/

  ///
 /* Future<List<Quran>> fetchAzkar() async {
    final String data = await rootBundle.loadString('assets/json/quran.json');

    final quran = <Quran>[];

    final quranJson = json.decode(data);

    if (quranJson is List) {
      for (final item in quranJson) {
        quran.add(Quran.fromJson(item as Map<String, dynamic>));
      }
    }

    return quran;
  }*/
  Future fetchAzkar ()async{
  final String response =await rootBundle.loadString("assets/json/hafs_smart_v8.json");
  final data=json.decode(response);
  arabic=data["quran"]as List;
  malayalam=data["malayalam"]as List;
  return quran=[arabic,malayalam];
}

  ///
  void onPageViewChange(int page) {
    //  currentPage = page;
    currentPage = page;
    update();
  }

  void toggleTheme() {
    ThemeServices.changeThemeMode();
    update();
  }

  void onDoubleTap() {
    // hide statusbar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }
}
