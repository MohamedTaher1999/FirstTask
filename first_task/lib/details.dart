import 'package:first_task/provider/infoProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class details extends StatefulWidget {
  @override
  _details createState() => _details();
}

class _details extends State<details> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<infoProvider>(context);

    return Container(
      height: MediaQuery.of(context).size.height * .2,
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsetsDirectional.only(start: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style:
                            TextStyle(color: Color(0xFFBDBDBD), fontSize: 10),
                      ),
                      SizedBox(height: 2),
                      Text(
                        bloc.information.data.description,
                        style:
                            TextStyle(color: Color(0xFF757575), fontSize: 10),
                      ),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Category',
                        style:
                            TextStyle(color: Color(0xFFBDBDBD), fontSize: 10),
                      ),
                      SizedBox(height: 2),
                      Text(
                        bloc.information.data.category.name,
                        style:
                            TextStyle(color: Color(0xFF757575), fontSize: 10),
                      ),
                    ],
                  )),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Market',
                        style:
                            TextStyle(color: Color(0xFFBDBDBD), fontSize: 10),
                      ),
                      SizedBox(height: 2),
                      Text(
                        bloc.information.data.market.name,
                        style:
                            TextStyle(color: Color(0xFF757575), fontSize: 10),
                      ),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deliverable',
                        style:
                            TextStyle(color: Color(0xFFBDBDBD), fontSize: 10),
                      ),
                      SizedBox(height: 2),
                      Text(
                        getDelivered(bloc.information.data.deliverable),
                        style:
                            TextStyle(color: Color(0xFF757575), fontSize: 10),
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }

  getDelivered(v) {
    if (v) {
      return "Deliverable";
    } else {
      return "Not Deliverable";
    }
  }
}
