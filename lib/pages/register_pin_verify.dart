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

  @override
  Widget build(BuildContext context) {
    FocusManager.instance.primaryFocus.unfocus();
    return Scaffold(
      body: SafeArea(
        child: Container(
          // color: Theme.of(context).primaryColor,
          child: Column(
              // mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _toolbarTop(context),
                _descriptionTop(context),
                // _phoneNumberInputBody(context),
                // _phoneNumberInputBody(context),
              ]),
        ),
      ),
    );
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
          Container(
            height: 60,
            child: Image(
              image: AssetImage(
                AssetsUtils.ICON_VERIFICATION_PHONE_NUMBER,
              ),
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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //     PINNumber(pinOneController, outlineInputBorder, (text) {}),
          //     PINNumber(pinTwoController, outlineInputBorder, (text) {}),
          //     PINNumber(pinThirdController, outlineInputBorder, (text) {}),
          //     PINNumber(pinFourController, outlineInputBorder, (text) {}),
          //   ],
          // ),
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
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: FlatButton(
                    child: new Text('Submit'),
                    onPressed: () {},
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

  Widget _phoneNumberInputCard(
      BuildContext context, String hintText, int maxLength, Function function) {
    var mediaQuery = MediaQuery.of(context);
    var widthInput = mediaQuery.size.width * 0.8;
    return Container(
      width: 60,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            5.0,
          ),
        ),
        border: Border.all(
          color: Colors.grey[300],
        ),
      ),
      child: TextField(
        textAlign: TextAlign.left,
        decoration: new InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          counterText: "",
        ),
        textInputAction: TextInputAction.done,
        maxLength: maxLength,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        onChanged: function,
        style: Theme.of(context).textTheme.headline6,
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
