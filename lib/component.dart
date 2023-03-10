import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lol_draft/IdModel.dart';
import 'package:lol_draft/main_controller.dart';

Widget idCard(IdModel idModel) {
  return Container(
      padding: EdgeInsets.all(20),
      width: 360,
      height: 240,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              idModel.nickName!,
              style: TextStyle(fontSize: 24),
            ),
            Text(idModel.tier!),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                  idModel.position!.length, (index) => positionIcon(idModel.position![index])),
            ),
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
      width: 440,
      height: 100,
      child: Card(
          child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 40,
            child: Text(idModel.tier.toString()),
          ),
          SizedBox(
            width: 100,
            child: Text(idModel.nickName.toString()),
          ),
          SizedBox(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: List<Widget>.generate(
                    idModel.position!.length, (index) => positionIcon(idModel.position![index])),
              ))
        ],
      )));
}
