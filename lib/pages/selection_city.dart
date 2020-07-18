import 'dart:math';

import 'package:flutter/material.dart';

class SelectionCity extends StatelessWidget {

  SelectionCity({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        _backgroundTop(context),
        _toolbarTop(context),
        Column(
          children: <Widget>[
            _searchInputTop(context),
            Expanded(
              child: _listViewDepartments(context),
            ),
          ],
        ),
      ]),
    );
  }

  Widget _backgroundTop(BuildContext context) {
    var roundCorner = 40.0;

    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(roundCorner),
              bottomRight: Radius.circular(roundCorner),
            ),
          ),
        ),
      ],
    );
  }

  Widget _toolbarTop(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.clear,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Select your city',
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchInputTop(BuildContext context) {
    var roundCorner = 20.0;
    return Container(
      margin: EdgeInsets.only(
        top: 160,
        left: 20,
        right: 20,
      ),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(roundCorner),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        child: TextField(
          decoration: new InputDecoration(
            border: InputBorder.none,
            hintText: 'Search here',
            icon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  Widget _listViewDepartments(BuildContext context) {
    final elementsList = _listElements(20); // only test
    
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: elementsList.length,
        itemBuilder: (BuildContext context, int index) {

          return Container(
            height: 50,
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            child: Center(child: Text('Entry ${elementsList[index]}')),
          );
        });
  }

  List<Map<int, String>> _listElements(int listSize) {
    return List<Map<int, String>>.generate(
        listSize,
        (int index) => {
              index : "A${index}",
            });
  }
}

// TextField(
//   decoration: InputDecoration(
//     border: InputBorder.none,
//     hintText: 'Search here',
//   ),
//   maxLines: 1,
//   style: Theme.of(context).textTheme.headline6.copyWith(
//         height: 1,
//       ),
// ),
