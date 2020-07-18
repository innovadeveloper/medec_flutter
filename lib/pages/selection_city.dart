import 'package:flutter/material.dart';

class SelectionCity extends StatelessWidget {
  const SelectionCity({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        _backgroundTop(context),
        _searchInputTop(context),
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
