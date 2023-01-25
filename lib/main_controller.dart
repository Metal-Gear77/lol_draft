import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lol_draft/IdModel.dart';
import 'package:lol_draft/component.dart';

class MainController extends GetxController {
  RxList<IdModel> idList = <IdModel>[].obs;
  Rx<IdModel> dragTempData = IdModel(
      nickName: "empty",
      tier: "b1",
      position: [position.top.toString(), position.bottom.toString()]).obs;

  void addIdList(IdModel idModel) {
    idList.add(idModel);
  }

  void removeIdList(int index) {
    idList.removeAt(index);
  }

  void test() {
    idList.add(IdModel(
        nickName: "asd",
        tier: "b1",
        position: [position.support.toString(), position.bottom.toString()]));
  }

  void showAddIdCard(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        TextEditingController nickNameController = TextEditingController();
        TextEditingController tierNameController = TextEditingController();

        List<String> positionList = [];
        List<Widget> positionButtonList = [
          Text(position.top.toString()),
          Text(position.jungle.toString()),
          Text(position.mid.toString()),
          Text(position.bottom.toString()),
          Text(position.support.toString())
        ];

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
                Row(
                  children: [
                    ToggleButtons(children: positionButtonList, isSelected: isSelected)
                        // TODO: 토글 버튼 리스트 추가

                    // FloatingActionButton(
                    //     child: positionIcon(position.bottom.toString()),
                    //     onPressed: () {
                    //       if (positionList.contains(position.bottom.toString())) {
                    //         positionList.add(position.bottom.toString());
                    //       } else {
                    //         positionList.remove(position.bottom.toString());
                    //       }
                    //     })
                  ],
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Add Id Card'),
              onPressed: () {
                addIdList(IdModel(
                    nickName: nickNameController.text,
                    tier: tierNameController.text,
                    position: []));
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }
}

enum position { top, jungle, mid, bottom, support }
