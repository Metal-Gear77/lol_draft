import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lol_draft/IdModel.dart';
import 'package:lol_draft/main_controller.dart';

Widget idCard(IdModel idModel) {
  return Container(
      padding: EdgeInsets.all(20),
      width: 150,
      height: 150,
      child: Card(
        child: Column(
          children: [
            Text(idModel.nickName!),
            Text(idModel.tier!),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                  idModel.position!.length, (index) => positionIcon(idModel.position![index])),
            )
          ],
        ),
      ));
}

Widget positionIcon(String positionString) {
  switch (positionString) {
    case "top":
      return CircleAvatar(child: SvgPicture.asset('assets/icons/top.svg'));
    case "jungle":
      return CircleAvatar(child: SvgPicture.asset('assets/icons/jungle.svg'));
    case "mid":
      return CircleAvatar(child: SvgPicture.asset('assets/icons/mid.svg'));
    case "bottom":
      return CircleAvatar(child: SvgPicture.asset('assets/icons/bottom.svg'));
    case "support":
      return CircleAvatar(child: SvgPicture.asset('assets/icons/support.svg'));
    default:
      return CircleAvatar(child: SvgPicture.asset('assets/icons/support.svg'));
  }
}

Widget slotCard(IdModel idModel) {
  return Container(
      padding: EdgeInsets.all(20),
      width: 400,
      height: 100,
      child: Card(
        // color: Colors.cyanAccent,
        child: ListTile(
          title: Text(idModel.nickName.toString()),
          leading: Text(idModel.tier.toString()),
          trailing: SizedBox(
            width: 100,
            child: Row(
              children: List<Widget>.generate(
                  idModel.position!.length, (index) => positionIcon(idModel.position![index])),
            ),
          ),
        ),
      ));
}
