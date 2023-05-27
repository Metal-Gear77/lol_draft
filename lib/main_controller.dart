import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lol_draft/IdModel.dart';
import 'package:lol_draft/component.dart';
import 'package:provider/provider.dart';

class MainProvider extends ChangeNotifier {
  IdModel emptyData = IdModel(nickName: "", tier: "", position: []);

  var isDragging = false;

  List<Widget> positionButtonList = [
    positionIcon(describeEnum(PositionEnum.top)),
    positionIcon(describeEnum(PositionEnum.jungle)),
    positionIcon(describeEnum(PositionEnum.mid)),
    positionIcon(describeEnum(PositionEnum.bottom)),
    positionIcon(describeEnum(PositionEnum.support))
  ];

  List<IdModel> idList = <IdModel>[];

  IdModel dragTempData = IdModel(nickName: "", tier: "", position: []);

  List<IdModel> idList1 = <IdModel>[
    IdModel(nickName: "", tier: "", position: []),
    IdModel(nickName: "", tier: "", position: []),
    IdModel(nickName: "", tier: "", position: []),
    IdModel(nickName: "", tier: "", position: []),
    IdModel(nickName: "", tier: "", position: [])
  ];
  List<IdModel> idList2 = <IdModel>[
    IdModel(nickName: "", tier: "", position: []),
    IdModel(nickName: "", tier: "", position: []),
    IdModel(nickName: "", tier: "", position: []),
    IdModel(nickName: "", tier: "", position: []),
    IdModel(nickName: "", tier: "", position: [])
  ];

  int tierSum1 = 0;
  int tierSum2 = 0;

  void addIdList(IdModel idModel) {
    idList.add(idModel);
    notifyListeners();
  }

  void removeIdList(int index) {
    idList.removeAt(index);
    notifyListeners();
  }

  void showAddIdCard(BuildContext context) {
    TextEditingController nickNameController = TextEditingController();
    TextEditingController tierNameController = TextEditingController();

    List<String> positionList = [
      describeEnum(PositionEnum.top),
      describeEnum(PositionEnum.jungle),
      describeEnum(PositionEnum.mid),
      describeEnum(PositionEnum.bottom),
      describeEnum(PositionEnum.support)
    ];
    List<bool> isSelected = [false, false, false, false, false];

    showDialog(
        context: context,
        builder: (_) {
          final myModel = Provider.of<MainProvider>(context, listen: true);
          return ChangeNotifierProvider.value(
            value: myModel,
            child: AlertDialog(
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
                    Consumer<MainProvider>(
                      builder: (context, provider, child) {
                        return ToggleButtons(
                          isSelected: isSelected,
                          onPressed: (int index) {
                            isSelected[index] = !isSelected[index];
                            notifyListeners();
                          },
                          children: positionButtonList,
                        );
                      },
                    )
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
                    notifyListeners();
                    Navigator.of(context).pop(); // Dismiss alert dialog
                  },
                ),
              ],
            ),
          );

          // return AlertDialog(
          //   title: Text('title'),
          //   content: SizedBox(
          //     width: 400,
          //     height: 200,
          //     child: Column(
          //       children: [
          //         TextField(
          //           decoration: InputDecoration(labelText: "nickName"),
          //           controller: nickNameController,
          //         ),
          //         TextField(
          //           decoration: InputDecoration(labelText: "tier"),
          //           controller: tierNameController,
          //         ),
          //         Divider(),
          //         ToggleButtons(
          //           isSelected: isSelected,
          //           onPressed: (int index) {
          //             isSelected[index] = !isSelected[index];
          //             notifyListeners();
          //           },
          //           children: positionButtonList,
          //         )
          //       ],
          //     ),
          //   ),
          //   actions: <Widget>[
          //     TextButton(
          //       child: Text('Add Id Card'),
          //       onPressed: () {
          //         List<String> selectedPositionList = [];
          //
          //         for (int i = 0; i < 5; i++) {
          //           if (isSelected[i]) {
          //             selectedPositionList.add(positionList[i]);
          //           }
          //         }
          //
          //         addIdList(IdModel(
          //             nickName: nickNameController.text,
          //             tier: tierNameController.text,
          //             position: selectedPositionList));
          //         notifyListeners();
          //         Navigator.of(context).pop(); // Dismiss alert dialog
          //       },
          //     ),
          //   ],
          // );
        });
  }

  void calculateTierSum() {
    int tempSum1 = 0;
    int tempSum2 = 0;
    for (int i = 0; i < 5; i++) {
      try {
        var temp = int.parse(idList1[i].tier!);
        tempSum1 += temp;
        print(tempSum1);
      } catch (e) {
        print(e);
      }
    }
    for (int i = 0; i < 5; i++) {
      try {
        var temp = int.parse(idList2[i].tier!);
        tempSum2 += temp;
        print(tempSum2);
      } catch (e) {
        print(e);
      }
    }
    tierSum1 = tempSum1;
    tierSum2 = tempSum2;
    notifyListeners();
  }
}

enum PositionEnum { top, jungle, mid, bottom, support }
