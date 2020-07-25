import 'package:flutter/material.dart';
import 'package:medec_app/utils/AssetsUtils.dart';
import 'package:medec_app/utils/DecorationUtils.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  static const PADDING_PRIMARY_VIEW = 20.0; // APP BAR, CARDVIEWS
  static const ROUND_PRIMARY_VIEW = 20.0; // TEXTFIELD, CARD

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // TextEditingController placeNameController = TextEditingController();

  static const DEPARTMENTS_DATA = [
    "Ancash",
    "Apurímac",
    "Arequipa",
    "Ayacucho",
    "Cajamarca",
    "Cuzco",
    "Huancavelica",
    "Huánuco",
    "Ica",
    "Junín",
    "La Libertad",
    "Lambayeque",
    "Lima",
    "Loreto",
    "Madre de Dios",
    "Moquegua",
    "Pasco",
    "Piura",
    "Puno",
    "San Martin",
    "Tacna",
    "Tumbes",
    "Ucayali"
  ];
  List<String> filteredDeparments = DEPARTMENTS_DATA;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        _backgroundColor(context),
        _backgroundTop(context),
        _toolbarTop(context),
        Column(
          children: <Widget>[
            _optionsHomeTop(context),
            Expanded(
              child: Container(height: 20,),
            ),
            _listBannerSponsored(context),
          ],
        ),
      ]),
    );
  }

// #region background top and circle container
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
              bottomLeft: Radius.circular(Home.ROUND_PRIMARY_VIEW),
              bottomRight: Radius.circular(Home.ROUND_PRIMARY_VIEW),
            ),
          ),
        ),
      ],
    );
  }

  Widget _toolbarTop(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(Home.PADDING_PRIMARY_VIEW),
        child: Text(
          'Medico',
          style: Theme.of(context).textTheme.headline5.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
// #endregion

//#region option_menu_buttons_top
  /**
   * circle options
   * Doctor
   * Medicines
   * Diagnostic
   */
  Widget _optionsHomeTop(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 110,
        left: 20,
        right: 20,
      ),
      // padding: EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _optionMenu(AssetsUtils.ICON_NURSE, "Doctor",
              "Search doctor around you", () {}),
          _optionMenu(AssetsUtils.ICON_MICROSCOPE, "Medicines",
              "Order Medicine to home", () {}),
          _optionMenu(AssetsUtils.ICON_PILL, "Digonostic",
              "Book test at Doorstep", () {}),
        ],
      ),
    );
  }

  Widget _optionMenu(
      String imagePath, String title, String subtitle, Function function) {
    return Column(
      children: <Widget>[
        _ovalButton(imagePath, function),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: 70,
          child: Text(
            subtitle,
            maxLines: 2,
            style: Theme.of(context).textTheme.headline6.copyWith(
                color: Colors.black, fontSize: 9, fontWeight: FontWeight.w100),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _ovalButton(String imagePath, Function function) {
    final sizeOption = 70.0;
    return Container(
      decoration: DecorationUtils.boxDecorationShadowOval(sizeOption),
      child: ClipOval(
        child: Material(
          elevation: 16.0,
          child: InkWell(
            child: SizedBox(
              width: sizeOption,
              height: sizeOption,
              child: Image.asset(imagePath),
            ),
            onTap: function,
          ),
        ),
      ),
    );
  }
//#endregion

Widget _listBannerSponsored(BuildContext context){
  return ListView.builder(
    itemCount: 4,
    scrollDirection: Axis.horizontal,
    itemBuilder: (BuildContext context, int index){
      return Container(
        color: Colors.red,
        height: 300,
        width: 500,
        child: Text('hola $index'),);
  });
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
