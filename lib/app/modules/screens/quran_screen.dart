import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hisnelmoslem/app/data/models/zikr_title.dart';
import 'package:hisnelmoslem/app/modules/quran/quran_controller.dart';
import 'package:hisnelmoslem/app/modules/quran/surah_builder.dart';
import 'package:hisnelmoslem/app/modules/quran/widgets/arabic_sura_number.dart';
import 'package:hisnelmoslem/app/shared/widgets/loading.dart';
import 'package:hisnelmoslem/app/views/dashboard/dashboard_controller.dart';
import 'package:hisnelmoslem/app/views/dashboard/widgets/azkar_tile.dart';
import 'package:hisnelmoslem/core/utils/alarm_database_helper.dart';
import 'package:hisnelmoslem/core/values/app_colors.dart';
import 'package:hisnelmoslem/core/values/app_constant.dart';
import 'package:hisnelmoslem/core/values/app_size.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuranPageController>(
      init: QuranPageController(),
      builder: (controller) {
        final quran = controller.quran;
        return (controller.isLoading)
            ? const Loading()
            : Scaffold(
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
                            'assets/images/moshaf_icon.png',
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
                      ' المصحف',
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
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppSize.s5),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 4.7 / 6,
                        child: Scrollbar(
                          controller: controller.quranScrollController,
                          thumbVisibility: false,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.only(top: 10),
                            itemCount: quran.length,
                            itemBuilder: (context, index) {
                              return FutureBuilder(
                                future: controller.fetchAzkar(),
                                builder: (
                                  BuildContext context,
                                  AsyncSnapshot snapshot,
                                ) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    if (snapshot.hasError) {
                                      return const Text('Error');
                                    } else if (snapshot.hasData) {
                                      return indexCreator(
                                          snapshot.data, context);
                                    } else {
                                      return const Text('Empty data');
                                    }
                                  } else {
                                    return Text(
                                        'State: ${snapshot.connectionState}');
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

  Container indexCreator(dynamic quran, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      height: AppSize.s65,
      color: const Color.fromARGB(255, 221, 250, 236),
      child: ListView(
        children: [
          for (int i = 0; i < 114; i++)
            Container(
              height: AppSize.s15,
              color: i % 2 == 0
                  ? const Color.fromARGB(255, 253, 247, 230)
                  : const Color.fromARGB(255, 253, 251, 240),
              child: TextButton(
                child: Row(
                  children: [
                    ArabicSuraNumber(i: i),
                    const SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      AppConstants.arabicName[i]['name'].toString(),
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.black87,
                          fontFamily: 'quran',
                          shadows: [
                            Shadow(
                              offset: Offset(.5, .5),
                              blurRadius: 1.0,
                              color: Color.fromARGB(255, 130, 130, 130),
                            )
                          ]),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                onPressed: () {
                  //fabIsClicked = false;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SurahBuilder(
                              arabic: quran[0],
                              sura: i,
                              suraName:
                                  AppConstants.arabicName[i]['name'].toString(),
                              ayah: 0,
                            )),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
