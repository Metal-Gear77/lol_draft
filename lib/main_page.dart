import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lol_draft/component.dart';
import 'package:lol_draft/main_controller.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOL DRIFT"),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(child: SvgPicture.asset('assets/icons/top.svg')),
                            DragTarget(
                                onAccept: (value) {},
                                builder: (
                                  BuildContext context,
                                  List<dynamic> accepted,
                                  List<dynamic> rejected,
                                ) {
                                  return slotCard(Get.find<MainController>().dragTempData.value);
                                })
                          ],
                        ),
                        Row(
                          children: [
                            CircleAvatar(child: SvgPicture.asset('assets/icons/top.svg')),
                            DragTarget(
                                onAccept: (value) {},
                                builder: (
                                  BuildContext context,
                                  List<dynamic> accepted,
                                  List<dynamic> rejected,
                                ) {
                                  return slotCard(Get.find<MainController>().dragTempData.value);
                                })
                          ],
                        ),
                        Row(
                          children: [
                            CircleAvatar(child: SvgPicture.asset('assets/icons/top.svg')),
                            DragTarget(
                                onAccept: (value) {},
                                builder: (
                                  BuildContext context,
                                  List<dynamic> accepted,
                                  List<dynamic> rejected,
                                ) {
                                  return slotCard(Get.find<MainController>().dragTempData.value);
                                })
                          ],
                        ),
                        Row(
                          children: [
                            CircleAvatar(child: SvgPicture.asset('assets/icons/top.svg')),
                            DragTarget(
                                onAccept: (value) {},
                                builder: (
                                  BuildContext context,
                                  List<dynamic> accepted,
                                  List<dynamic> rejected,
                                ) {
                                  return slotCard(Get.find<MainController>().dragTempData.value);
                                })
                          ],
                        ),
                        Row(
                          children: [
                            CircleAvatar(child: SvgPicture.asset('assets/icons/top.svg')),
                            DragTarget(
                                onAccept: (value) {},
                                builder: (
                                  BuildContext context,
                                  List<dynamic> accepted,
                                  List<dynamic> rejected,
                                ) {
                                  return slotCard(Get.find<MainController>().dragTempData.value);
                                })
                          ],
                        ),
                      ],
                    ),
                    VerticalDivider(
                      width: 50,
                      color: Colors.black,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            DragTarget(
                                onAccept: (value) {},
                                builder: (
                                  BuildContext context,
                                  List<dynamic> accepted,
                                  List<dynamic> rejected,
                                ) {
                                  return slotCard(Get.find<MainController>().dragTempData.value);
                                }),
                            CircleAvatar(child: SvgPicture.asset('assets/icons/top.svg')),
                          ],
                        ),
                        Row(
                          children: [
                            DragTarget(
                                onAccept: (value) {},
                                builder: (
                                  BuildContext context,
                                  List<dynamic> accepted,
                                  List<dynamic> rejected,
                                ) {
                                  return slotCard(Get.find<MainController>().dragTempData.value);
                                }),
                            CircleAvatar(child: SvgPicture.asset('assets/icons/top.svg')),
                          ],
                        ),
                        Row(
                          children: [
                            DragTarget(
                                onAccept: (value) {},
                                builder: (
                                  BuildContext context,
                                  List<dynamic> accepted,
                                  List<dynamic> rejected,
                                ) {
                                  return slotCard(Get.find<MainController>().dragTempData.value);
                                }),
                            CircleAvatar(child: SvgPicture.asset('assets/icons/top.svg')),
                          ],
                        ),
                        Row(
                          children: [
                            DragTarget(
                                onAccept: (value) {},
                                builder: (
                                  BuildContext context,
                                  List<dynamic> accepted,
                                  List<dynamic> rejected,
                                ) {
                                  return slotCard(Get.find<MainController>().dragTempData.value);
                                }),
                            CircleAvatar(child: SvgPicture.asset('assets/icons/top.svg')),
                          ],
                        ),
                        Row(
                          children: [
                            DragTarget(
                                onAccept: (value) {},
                                builder: (
                                  BuildContext context,
                                  List<dynamic> accepted,
                                  List<dynamic> rejected,
                                ) {
                                  return slotCard(Get.find<MainController>().dragTempData.value);
                                }),
                            CircleAvatar(child: SvgPicture.asset('assets/icons/top.svg')),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Divider(),
              SizedBox(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  child: Obx(
                    () => GridView.builder(
                        padding: EdgeInsets.all(18),
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 150,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1),
                        itemCount: Get.find<MainController>().idList.length,
                        itemBuilder: (context, index) {
                          return Draggable(
                              feedback: slotCard(Get.find<MainController>().idList[index]),
                              child: idCard(Get.find<MainController>().idList[index]));
                        }),
                  ))
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.find<MainController>().test();
          Get.find<MainController>().showAddIdCard(context);
        },
        tooltip: '추가',
        child: const Icon(Icons.add),
      ),
    );
  }
}
