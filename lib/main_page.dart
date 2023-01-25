import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lol_draft/IdModel.dart';
import 'package:lol_draft/component.dart';
import 'package:lol_draft/main_controller.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("LOL DRIFT")),
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 500,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: 1000,
                      child: Row(
                        children: [
                          Expanded(
                            child: ListView.builder(
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      FloatingActionButton(
                                        tooltip: 'delete',
                                        onPressed: () {
                                          Get.find<MainController>().idList1[index] =
                                              Get.find<MainController>().emptyData;
                                        },
                                        child: CircleAvatar(
                                            child: Get.find<MainController>()
                                                .positionButtonList[index]),
                                      ),
                                      Expanded(
                                        child: DragTarget(onAccept: (IdModel value) {
                                          Get.find<MainController>().idList1[index] = value;
                                        }, builder: (
                                          BuildContext context,
                                          List<dynamic> accepted,
                                          List<dynamic> rejected,
                                        ) {
                                          return Obx(() => Draggable(
                                              onDragCompleted: () {
                                                Get.find<MainController>().idList1[index] =
                                                    Get.find<MainController>().emptyData;
                                              },
                                              data: Get.find<MainController>().idList1[index],
                                              feedback: slotCard(
                                                  Get.find<MainController>().idList1[index]),
                                              child: slotCard(
                                                  Get.find<MainController>().idList1[index])));
                                        }),
                                      )
                                    ],
                                  );
                                }),
                          ),
                          VerticalDivider(
                            width: 50,
                            color: Colors.black,
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: DragTarget(onAccept: (IdModel value) {
                                          Get.find<MainController>().idList2[index] = value;
                                        }, builder: (
                                          BuildContext context,
                                          List<dynamic> accepted,
                                          List<dynamic> rejected,
                                        ) {
                                          return Obx(() => Draggable(
                                              onDragCompleted: () {
                                                Get.find<MainController>().idList2[index] =
                                                    Get.find<MainController>().emptyData;
                                              },
                                              data: Get.find<MainController>().idList2[index],
                                              feedback: slotCard(
                                                  Get.find<MainController>().idList2[index]),
                                              child: slotCard(
                                                  Get.find<MainController>().idList2[index])));
                                        }),
                                      ),
                                      FloatingActionButton(
                                        tooltip: 'delete',
                                        onPressed: () {
                                          Get.find<MainController>().idList1[index] =
                                              Get.find<MainController>().emptyData;
                                        },
                                        child: CircleAvatar(
                                            child: Get.find<MainController>()
                                                .positionButtonList[index]),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
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
                              maxCrossAxisExtent: 350,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1.5),
                          itemCount: Get.find<MainController>().idList.length,
                          itemBuilder: (context, index) {
                            return Draggable(
                                onDragStarted: () {
                                  Get.find<MainController>().isDragging.value = true;
                                },
                                onDragEnd: (dragEndCallback) {
                                  Get.find<MainController>().isDragging.value = false;
                                },
                                data: Get.find<MainController>().idList[index],
                                feedback: slotCard(Get.find<MainController>().idList[index]),
                                child: idCard(Get.find<MainController>().idList[index]));
                          }),
                    ))
              ]),
        ),
        floatingActionButton: Obx(() => !Get.find<MainController>().isDragging.value
            ? FloatingActionButton(
                onPressed: () {
                  Get.find<MainController>().showAddIdCard(context);
                },
                tooltip: 'add',
                child: Icon(Icons.add))
            : DragTarget(onAccept: (IdModel data) {
                Get.find<MainController>().idList.remove(data);
              }, builder:
                (BuildContext context, List<Object?> candidateData, List<dynamic> rejectedData) {
                return FloatingActionButton(
                    backgroundColor: Colors.red,
                    onPressed: () {},
                    tooltip: 'delete',
                    child: Icon(Icons.delete_outline_outlined));
              })));
  }
}
