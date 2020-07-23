import 'package:flutter/material.dart';

class BateryInfo extends StatelessWidget {
  const BateryInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Text(
        'hello word',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
