import 'package:first_task/provider/infoProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'model.dart';

class product extends StatefulWidget {
  product();

  @override
  _product createState() => _product();
}

class _product extends State<product> {
  _product();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<infoProvider>(context);

    return Container(
        height: MediaQuery.of(context).size.height * .2,
        alignment: AlignmentDirectional.centerStart,
        margin: EdgeInsets.only(left: 10),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Size',
                  style: TextStyle(color: Color(0xFFBDBDBD)),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: creatSizes()),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Color',
                  style: TextStyle(color: Color(0xFFBDBDBD)),
                ),
                Row(children: creatColors())
              ],
            )
          ],
        ));
  }

  getBoxSize(v, b) {
    return b ? getSelectedBox(v) : getUnSelectedBox(v);
  }

  getSelectedBox(v) {
    final bloc = Provider.of<infoProvider>(context);

    return Container(
        decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            color: Color(0xFFEF9A9A),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        margin: EdgeInsets.only(left: 10, top: 10),
        child: Text(
          v,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ));
  }

  getUnSelectedBox(v) {
    final bloc = Provider.of<infoProvider>(context);

    return Container(
        decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        margin: EdgeInsets.only(left: 10, top: 10),
        child: Text(
          v,
          style: TextStyle(color: Colors.black, fontSize: 15),
        ));
  }

  getColor(value, isSelected) {
    final bloc = Provider.of<infoProvider>(context);

    return Container(
      margin: EdgeInsets.only(left: 10, top: 10),
      width: 30,
      height: 30,
      child: isSelected
          ? Icon(
              Icons.done,
              size: 20,
              color: Colors.white,
            )
          : Icon(null),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: value,
        boxShadow: [
          BoxShadow(
            color: value.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            // offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }

  creatSizes() {
    final bloc = Provider.of<infoProvider>(context);

    List<Widget> list = [];
    for (int i = 0; i < bloc.information.data.options.length; i++) {
      if (bloc.information.data.options[i].optionGroupId == 1) {
        list.add(getUnSelectedBox(bloc.information.data.options[i].name));
      }
    }

    return list;
  }

  creatColors() {
    final bloc = Provider.of<infoProvider>(context);

    List<Widget> list = [];
    for (int i = 0; i < bloc.information.data.options.length; i++) {
      if (bloc.information.data.options[i].optionGroupId == 2) {
        if (bloc.information.data.options[i].name[0] == '#') {
          list.add(getColor(
              _colorFromHex(bloc.information.data.options[i].name), false));
        } else {
          list.add(getColor(
              _colorFromHex(colours[bloc.information.data.options[i].name]),
              false));
        }
      }
    }
    return list;
  }

  Color _colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }
}
