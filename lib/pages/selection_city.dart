import 'package:flutter/material.dart';

class SelectionCity extends StatelessWidget {
  SelectionCity({Key key}) : super(key: key);
  static const PADDING_PRIMARY_VIEW = 20.0;  // APP BAR, CARDVIEWS
  static const ROUND_PRIMARY_VIEW = 20.0;  // TEXTFIELD, CARD

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        _backgroundColor(context),
        _backgroundTop(context),
        _toolbarTop(context),
        Column(
          children: <Widget>[
            _searchInputTop(context),
            _useLocationBody(context),
            Expanded(
              child: _listViewDepartmentsBody(context),
            ),
          ],
        ),
      ]),
    );
  }

  Widget _backgroundColor(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey[200],
    );
  }

  Widget _backgroundTop(BuildContext context) {

    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(ROUND_PRIMARY_VIEW),
              bottomRight: Radius.circular(ROUND_PRIMARY_VIEW),
            ),
          ),
        ),
      ],
    );
  }

  Widget _toolbarTop(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(PADDING_PRIMARY_VIEW),
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
    return Container(
      margin: EdgeInsets.only(
        top: 110,
        left: 20,
        right: 20,
      ),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(ROUND_PRIMARY_VIEW),
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

  Widget _useLocationBody(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 30.0,
        ),
        child: InkWell(
          splashColor: Colors.white60,
          onTap: () {
            print("click..!");
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: PADDING_PRIMARY_VIEW,
            ),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.location_on,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Use current location',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listViewDepartmentsBody(BuildContext context) {
    final elementsList = _listElements(20); // only test
    var roundCorner = 20.0;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: PADDING_PRIMARY_VIEW,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(roundCorner),
          topRight: Radius.circular(roundCorner),
        ),
      ),
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: elementsList.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(children: [
              ListTile(
                title: Text(
                  'Entry ${elementsList[index]}',
                ),
              ),
              Divider(
                color: Colors.grey.withOpacity(0.4),
              )
            ]);
          }),
    );
  }

  List<Map<int, String>> _listElements(int listSize) {
    return List<Map<int, String>>.generate(
        listSize,
        (int index) => {
              index: "A${index}",
            });
  }

  Widget _widget(BuildContext context) {}
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
