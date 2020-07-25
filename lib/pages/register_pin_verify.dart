import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medec_app/pages/selection_city.dart';
import 'package:medec_app/utils/AssetsUtils.dart';

class RegisterPinVerify extends StatelessWidget {
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThirdController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();

  FocusNode pinOneFocusNode = FocusNode();
  FocusNode pinTwoFocusNode = FocusNode();
  FocusNode pinThirdFocusNode = FocusNode();
  FocusNode pinFourFocusNode = FocusNode();

  var listInputs = ["", "", "", ""];

  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: Colors.transparent),
  );

  @override
  Widget build(BuildContext context) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              PINNumber(pinOneController, outlineInputBorder, (text) {
                setInput(0, text, context);
              }, pinOneFocusNode),
              PINNumber(pinTwoController, outlineInputBorder, (text) {
                setInput(1, text, context);
              }, pinTwoFocusNode),
              // PINNumber(pinThirdController, outlineInputBorder, (text) {
              //   setInput(2, text, context);
              // }, pinThirdFocusNode),
              // PINNumber(pinFourController, outlineInputBorder, (text) {
              //   setInput(3, text, context);
              // }, pinFourFocusNode),
             
            ],
          ),
          
          //  SizedBox(
          //       width: double.infinity,
          //       height: 100,
          //       child: KeyboardListener(),
          //     ),
        ],
      ),
    );
  }

// https://flutter-es.io/docs/cookbook/forms/focus
// separar el textfield en otra clase porque se necesitarà los mètodos initState y dispose.
  void setInput(int index, String text, BuildContext context) {
    String lastValue = listInputs[index];
    if (lastValue == "" && text == "") {
      print("back input");

      setFocusCurrentPin(index, context);
      // FocusScope.of(context).requestFocus(pinOneFocusNode);
    }
    listInputs[index] = text;
  }

  void setFocusCurrentPin(int index, BuildContext context) {
    if (index < 0) index = 0;

    switch (index) {
      case 0:
        FocusScope.of(context).requestFocus(pinOneFocusNode);
        break;
      case 1:
        FocusScope.of(context).requestFocus(pinTwoFocusNode);
        break;
      case 2:
        FocusScope.of(context).requestFocus(pinThirdFocusNode);
        break;
      case 3:
        FocusScope.of(context).requestFocus(pinFourFocusNode);
        break;
      default:
    }
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
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _phoneNumberInputCard(
                          context, '+51', 3, (textChanged) {}),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: _phoneNumberInputCard(
                            context, '989678931', 9, (textChanged) {}),
                      ),
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

  PINNumber(this.textEditingController, this.outlineInputBorder, this.onChange,
      this.focusNode);
// RawKeyboardListener(
//   focusNode: focusNodes[i],
//   onKey: (RawKeyEvent event) => print('GOT AN EVENT! $event'),
//   child: TextField(
//     key: Key('PinInput_$i'),
//     controller: controllers[i],
//     focusNode: focusNodes[i],
//     ...
//   ),
// );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      child: TextField(
        controller: textEditingController,
        onChanged: onChange,
        maxLength: 1,
        focusNode: focusNode,
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
          border: outlineInputBorder,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
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

class KeyboardListener extends StatefulWidget {
  KeyboardListener();

  @override
  _RawKeyboardListenerState createState() => new _RawKeyboardListenerState();
}

class _RawKeyboardListenerState extends State<KeyboardListener> {
  TextEditingController _controller = new TextEditingController();
  FocusNode _textNode = new FocusNode();

  @override
  initState() {
    super.initState();
  }

  handleKey(RawKeyEventDataAndroid key) {
    print('KeyCode: ${key.keyCode}, CodePoint: ${key.codePoint}, '
        'Flags: ${key.flags}, MetaState: ${key.metaState}, '
        'ScanCode: ${key.scanCode}');
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _textNode,
      onKey: (key) => handleKey(key.data),
      child: TextField(
        controller: _controller,
        focusNode: _textNode,
      ),
    );
  }
}
