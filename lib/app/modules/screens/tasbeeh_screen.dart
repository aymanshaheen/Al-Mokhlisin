import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hisnelmoslem/app/modules/tally/tally_controller.dart';
import 'package:hisnelmoslem/app/modules/tally/widgets/cards/tally_card.dart';
import 'package:hisnelmoslem/app/shared/widgets/loading.dart';
import 'package:hisnelmoslem/core/values/app_size.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TasbeehScreen extends StatelessWidget {
  const TasbeehScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * .75;
    final double height = MediaQuery.of(context).size.height * .75;
    late double smalLenght;
    if (width > height) {
      smalLenght = height;
    } else {
      smalLenght = width;
    }
    return GetBuilder<TallyController>(
      init: TallyController(),
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            "tally".tr,
            style: const TextStyle(fontFamily: "Uthmanic"),
          ),
        ),
        body: (controller.isLoading)
            ? const Loading()
            : SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                    right: AppSize.s5,
                    left: AppSize.s5,
                  ),
                  itemCount: controller.allTally.length,
                  itemBuilder: (context, index) {
                    return TallyCard(dbTally: controller.allTally[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                ),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.createNewTally();
          },
          child: const Icon(
            MdiIcons.plus,
            size: AppSize.s40,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),

      /* Align(
          
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
            child: const Icon(
              MdiIcons.plus,
              size: AppSize.s40,
            ),
            onPressed: () {
              controller.createNewTally();
            },
          ),
        ), */
    );
  }
}
