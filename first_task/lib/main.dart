import 'package:provider/provider.dart';
import 'package:first_task/provider/infoProvider.dart';

import 'package:first_task/product.dart';
import 'package:first_task/reviews.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => infoProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: '\nlace up stake shoes\n',
                    style: TextStyle(color: appTextColor, fontSize: 13)),
                TextSpan(
                    text: '       JD 10.0',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: appText2Color))
              ])),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  alignment: AlignmentDirectional.bottomEnd,
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: appTextColor,
                    size: 18,
                  ),
                ),
              ],
              backgroundColor: appBarColor,
            ),
            body: HomePage()),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedOption = 0;
  List allOptions = [product(), details(), reviews()];

  List isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<infoProvider>(context);

    return Scaffold(
        backgroundColor: appBarColor,
        body: Container(
            child: (bloc.isloading)
                ? Container(
                    child: Center(
                      child: Text('Loading.......'),
                    ),
                  )
                : Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                bloc.information.data.media[0].url,
                                height: MediaQuery.of(context).size.height * .5,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          buildTabs(),
                          allOptions[_selectedOption],
                          Divider(height: .5, color: Color(0xFFD6D6D6)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FlatButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "FAVOURITE     ",
                                      style:
                                          TextStyle(color: Color(0xFF616161)),
                                    ),
                                    Icon(
                                      Icons.favorite,
                                      color: Color(0xFF616161),
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              FlatButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "ADD TO...         ",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                color: Color(0xFFEF9A9A),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )));
  }

  buildTabs() {
    return Container(
        width: MediaQuery.of(context).size.height - 100.0,
        height: MediaQuery.of(context).size.width * .15,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          buildOption('Product', 0),
          buildOption('Details', 1),
          buildOption('Reviews', 2),
        ]));
  }

  buildOption(String title, int index) {
    return Stack(
      children: [
        isSelected[index]
            ? Container(
                decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                child: Text(
                  title,
                  style: TextStyle(color: Color(0xFFF48FB1), fontSize: 20),
                ),
              )
            : Container(
                height: 8.0,
                width: 8.0,
              ),
        GestureDetector(
            onTap: () {
              setState(() {
                _selectedOption = index;
                isOptionSelected(index);
              });
            },
            child: isSelected[index]
                ? Text(
                    '',
                  )
                : Text(
                    title,
                  ))
      ],
    );
  }

  isOptionSelected(index) {
    var previousIndex = isSelected.indexOf(true);
    isSelected[index] = true;
    isSelected[previousIndex] = false;
  }
}
