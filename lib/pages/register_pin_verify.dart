import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medec_app/pages/selection_city.dart';
import 'package:medec_app/utils/AssetsUtils.dart';
import 'package:flutter/services.dart';

class RegisterPinVerify extends StatelessWidget {
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThirdController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();

  var listInputs = ["", "", "", ""];

  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: Colors.transparent),
  );

  /*
   * retorna el tamanio total de la pantalla sin considerar el tamanio del
   * la barra de notificaciones o notch..
   * pero si considera el safe area : (padding.top, padding.bottom)
   */
  double _screenTotalSizeWithoutAppBar(MediaQueryData mediaQueryData) {
    return (mediaQueryData.size.height -
        mediaQueryData.padding.top -
        mediaQueryData.padding.bottom);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var heightTop = _screenTotalSizeWithoutAppBar(mediaQuery) * 0.5;
    return Scaffold(body: new Builder(
        // Create an inner BuildContext so that the onPressed methods
        // can refer to the Scaffold with Scaffold.of().
        builder: (BuildContext context) {
      return SafeArea(
        child: Container(
          // color: Theme.of(context).primaryColor,
          child: Column(
            children: <Widget>[
              Container(
                height: heightTop,
                child: Column(children: [
                  _toolbarTop(context),
                  _descriptionTop(context),
                ]),
              ),
              _middleBottomBody(context),
            ],
          ),
        ),
      );
    }));
  }

  Widget _toolbarTop(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(SelectionCity.PADDING_PRIMARY_VIEW),
      child: Icon(
        Icons.clear,
      ),
    );
  }

  Widget _descriptionTop(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text(
            'Enter code',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 200,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.ac_unit,
                  color: Colors.green,
                ),
                Icon(
                  Icons.ac_unit,
                  color: Colors.green,
                ),
                Icon(
                  Icons.ac_unit,
                  color: Colors.green,
                ),
                Icon(
                  Icons.ac_unit,
                  color: Colors.green,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: Text(
              'Enter your mobile number we will send you the OTP to verify later',
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          _phoneNumberInputBody(context),
        ],
      ),
    );
  }

  Widget _phoneNumberInputBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      child: Center(
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      PINNumber(
                          pinOneController, outlineInputBorder, (text) {}),
                      PINNumber(
                          pinTwoController, outlineInputBorder, (text) {}),
                      PINNumber(
                          pinThirdController, outlineInputBorder, (text) {}),
                      PINNumber(
                          pinFourController, outlineInputBorder, (text) {}),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: FlatButton(
                    child: new Text('Submit'),
                    onPressed: () {
                      // final snackBar =
                      //     SnackBar(content: Text('Yay! A SnackBar!'));
                      // Scaffold.of(context).showSnackBar(snackBar);
                      createSnackBar(context, 'Title - subtitle');
                    },
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(
                        20.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
        content: Container(
      height: 30,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
            child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.headline5,
                )),
          ),
          SizedBox(
            height: 10.0,
            child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.headline6,
                )),
          ),
        ],
      ),
    ));

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    Scaffold.of(context).showSnackBar(snackBar);
  }

  Widget _middleBottomBody(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var heightBackground = _screenTotalSizeWithoutAppBar(mediaQuery) * 0.5;

    return Container(
      height: heightBackground,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Text(
            'Did not receive the code?',
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.grey, fontSize: 11),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  print("Hello world");
                },
                child: Text(
                  'Resend',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.blue),
                ),
              ),
              FlatButton(
                onPressed: () {
                  print("Hello world");
                },
                // focusColor: Colors.green,
                // highlightColor: Colors.purple,
                // splashColor: Colors.purple,
                child: Text(
                  'Get a call now',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.blue),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class PINNumber extends StatelessWidget {
  final TextEditingController textEditingController;
  final OutlineInputBorder outlineInputBorder;
  final Function onChange;
  FocusNode focusNode;

  PINNumber(this.textEditingController, this.outlineInputBorder, this.onChange);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      child: TextField(
        controller: textEditingController,
        onChanged: onChange,
        maxLength: 1,
        // focusNode: focusNode,
        // enabled: false,
        // obscureText: true,
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(color: Theme.of(context).primaryColor),
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(
            10.0,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          filled: true,
          fillColor: Colors.white30,
          counterText: "",
        ),
      ),
    );
  }
}
