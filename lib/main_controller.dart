import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lol_draft/IdModel.dart';
import 'package:lol_draft/component.dart';

class MainController extends GetxController {

  @override
  void onInit() {
    super.onInit();

    for (int i = 0; i < 5; i++) {
      idList1.add(emptyData);
      idList2.add(emptyData);
    }
  }

  IdModel emptyData = IdModel(nickName: "", tier: "", position: []);

  RxBool isDragging = false.obs;

  List<Widget> positionButtonList = [
    positionIcon(describeEnum(PositionEnum.top)),
    positionIcon(describeEnum(PositionEnum.jungle)),
    positionIcon(describeEnum(PositionEnum.mid)),
    positionIcon(describeEnum(PositionEnum.bottom)),
    positionIcon(describeEnum(PositionEnum.support))
  ];

  RxList<IdModel> idList = <IdModel>[].obs;

  Rx<IdModel> dragTempData = IdModel(nickName: "", tier: "", position: []).obs;

  RxList<IdModel> idList1 = <IdModel>[].obs;
  RxList<IdModel> idList2 = <IdModel>[].obs;

  void addIdList(IdModel idModel) {
    idList.add(idModel);
  }

  void removeIdList(int index) {
    idList.removeAt(index);
  }

  void showAddIdCard(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        TextEditingController nickNameController = TextEditingController();
        TextEditingController tierNameController = TextEditingController();

        List<String> positionList = [
          describeEnum(PositionEnum.top),
          describeEnum(PositionEnum.jungle),
          describeEnum(PositionEnum.mid),
          describeEnum(PositionEnum.bottom),
          describeEnum(PositionEnum.support)
        ];
        RxList<bool> isSelected = [false, false, false, false, false].obs;

        return AlertDialog(
          title: Text('title'),
          content: SizedBox(
            width: 400,
            height: 200,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "nickName"),
                  controller: nickNameController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "tier"),
                  controller: tierNameController,
                ),
                Divider(),
                Obx(() => ToggleButtons(
                      isSelected: isSelected,
                      onPressed: (int index) {
                        isSelected[index] = !isSelected[index];
                      },
                      children: positionButtonList,
                    ))
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Add Id Card'),
              onPressed: () {
                List<String> selectedPositionList = [];

                for (int i = 0; i < 5; i++) {
                  if (isSelected[i]) {
                    selectedPositionList.add(positionList[i]);
                  }
                }

                addIdList(IdModel(
                    nickName: nickNameController.text,
                    tier: tierNameController.text,
                    position: selectedPositionList));

                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }
}

enum PositionEnum { top, jungle, mid, bottom, support }
