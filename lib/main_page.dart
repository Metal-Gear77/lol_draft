import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lol_draft/IdModel.dart';
import 'package:lol_draft/component.dart';
import 'package:lol_draft/main_controller.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MainProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final subjectState = context.watch<MainProvider>();
    final subjectProvider = context.read<MainProvider>();

    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("LOL DRIFT")),
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("1팀 MMR 합 : ${subjectState.tierSum1}"),
                    SizedBox(
                      width: 400,
                    ),
                    Text("2팀 MMR 합 : ${subjectState.tierSum2}")
                  ],
                ),
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
                                          subjectState.idList1[index] = subjectState.emptyData;
                                          subjectState.calculateTierSum();
                                        },
                                        child: CircleAvatar(
                                            child: subjectState.positionButtonList[index]),
                                      ),
                                      Expanded(
                                        child: DragTarget(onAccept: (IdModel value) {
                                          subjectState.idList1[index] = value;
                                          subjectState.calculateTierSum();
                                        }, builder: (
                                          BuildContext context,
                                          List<dynamic> accepted,
                                          List<dynamic> rejected,
                                        ) {
                                          return Draggable(
                                              onDragCompleted: () {
                                                subjectState.idList1[index] =
                                                    subjectState.emptyData;
                                              },
                                              data: subjectState.idList1[index],
                                              feedback: slotCard(subjectState.idList1[index]),
                                              child: slotCard(subjectState.idList1[index]));
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
                                          subjectState.idList2[index] = value;
                                          subjectState.calculateTierSum();
                                        }, builder: (
                                          BuildContext context,
                                          List<dynamic> accepted,
                                          List<dynamic> rejected,
                                        ) {
                                          return Draggable(
                                              onDragCompleted: () {
                                                subjectState.idList2[index] =
                                                    subjectState.emptyData;
                                              },
                                              data: subjectState.idList2[index],
                                              feedback: slotCard(subjectState.idList2[index]),
                                              child: slotCard(subjectState.idList2[index]));
                                        }),
                                      ),
                                      FloatingActionButton(
                                        tooltip: 'delete',
                                        onPressed: () {
                                          subjectState.idList2[index] = subjectState.emptyData;
                                          subjectState.calculateTierSum();
                                        },
                                        child: CircleAvatar(
                                            child: subjectState.positionButtonList[index]),
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
                  child: GridView.builder(
                      padding: EdgeInsets.all(18),
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 350,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.5),
                      itemCount: subjectState.idList.length,
                      itemBuilder: (context, index) {
                        return Draggable(
                            onDragStarted: () {
                              subjectState.isDragging = true;
                            },
                            onDragEnd: (dragEndCallback) {
                              subjectState.isDragging = false;
                            },
                            data: subjectState.idList[index],
                            feedback: slotCard(subjectState.idList[index]),
                            child: idCard(subjectState.idList[index]));
                      }),
                )
              ]),
        ),
        floatingActionButton: !subjectState.isDragging
            ? FloatingActionButton(
                onPressed: () {
                  subjectState.showAddIdCard(context);
                },
                tooltip: 'add',
                child: Icon(Icons.add))
            : DragTarget(onAccept: (IdModel data) {
                subjectState.idList.remove(data);
              }, builder:
                (BuildContext context, List<Object?> candidateData, List<dynamic> rejectedData) {
                return FloatingActionButton(
                    backgroundColor: Colors.red,
                    onPressed: () {},
                    tooltip: 'delete',
                    child: Icon(Icons.delete_outline_outlined));
              }));
  }

}
