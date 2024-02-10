import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hisnelmoslem/app/modules/quran/quran_controller.dart';
import 'package:hisnelmoslem/core/values/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SurahBuilder extends StatefulWidget {
  final int sura;
  final dynamic arabic;
  final  String suraName;
  int ayah;

  SurahBuilder(
      {Key? key, required this.sura, required this.arabic, required this.suraName, required this.ayah})
      : super(key: key);

  @override
  _SurahBuilderState createState() => _SurahBuilderState();
}
class _SurahBuilderState extends State<SurahBuilder> {
  bool view = true;

  @override
  void initState() {
   // WidgetsBinding.instance.addPostFrameCallback((_) => jumbToAyah());
    super.initState();
  }

 /* jumbToAyah() {
    if (fabIsClicked) {
      itemScrollController.scrollTo(
          index: widget.ayah,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOutCubic);
    }
    fabIsClicked = false;
  }
*/
  Row verseBuilder(int index,num previousVerses) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.arabic[index + previousVerses]['aya_text'].toString(),
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: "quran",
                  color: const Color.fromARGB(196, 0, 0, 0),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                ],
              ),
            ],
          ),
        ),
      ],
    );
  }



  Widget SingleSuraBuilder(int LenghtOfSura) {
    String fullSura = '';
    int previousVerses = 0;
    if (widget.sura + 1 != 1) {
      for (int i = widget.sura - 1; i >= 0; i--) {
        previousVerses = previousVerses + AppConstants.noOfVerses[i];
      }
    }

    if (!view)
      for (int i = 0; i < LenghtOfSura; i++) {
        fullSura += widget.arabic[i + previousVerses]['aya_text'].toString();
      }




    return GetBuilder<QuranPageController>(
      builder: (controller) =>  SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 253, 251, 240),
          child: view
              ? ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  (index != 0) || (widget.sura == 0) || (widget.sura == 8)
                      ? const Text('')
                      : const RetunBasmala(),
                    Container(
                    color: index % 2 != 0
                        ? const Color.fromARGB(255, 253, 251, 240)
                        : const Color.fromARGB(255, 253, 247, 230),
                    child: PopupMenuButton(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: verseBuilder(index, previousVerses),
                        ),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            onTap: () {
                             // saveBookMark(widget.sura + 1, index);
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.bookmark_add,
                                  color:
                                  Color.fromARGB(255, 56, 115, 59),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Bookmark'),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            onTap: () {
    
                            },
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(
                                  Icons.share,
                                  color:
                                  Color.fromARGB(255, 56, 115, 59),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Share'),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ],
              );
            },
            itemCount: LenghtOfSura,
          )
              : ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        widget.sura + 1 != 1 && widget.sura + 1 != 9
                            ? const RetunBasmala()
                            : const Text(''),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            fullSura, //mushaf mode
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 40,
                              fontFamily: "quran",
                              color: const Color.fromARGB(196, 44, 44, 44),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    int LengthOfSura = AppConstants.noOfVerses[widget.sura];


    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: Scaffold(
        appBar: AppBar(
          leading: Tooltip(
            message: 'Mushaf Mode',
            child: TextButton(
              child: const Icon(
                Icons.chrome_reader_mode,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  view = !view;
                });
              },
            ),
          ),
          centerTitle: true,
          title: Text(
            // widget.
            widget.suraName,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'quran',
                shadows: [
                  Shadow(
                    offset: Offset(1, 1),
                    blurRadius: 2.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ]),
          ),
          backgroundColor: const Color.fromARGB(255, 56, 115, 59),
        ),
        body: SingleSuraBuilder(LengthOfSura),
      ),
    );
  }
}
class RetunBasmala extends StatelessWidget {
  const RetunBasmala({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Center(
        child: Text(
          'بسم الله الرحمن الرحيم',
          style: TextStyle(fontFamily: 'me_quran', fontSize: 30),
          textDirection: TextDirection.rtl,
        ),
      ),
    ]);
  }
}
