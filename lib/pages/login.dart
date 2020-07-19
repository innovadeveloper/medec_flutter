import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medec_app/model/onboarding_model.dart';
import 'package:medec_app/utils/AssetsUtils.dart';

class Login extends StatelessWidget {
  static const ROUND_PRIMARY_VIEW = 20.0; // TEXTFIELD, CARD

  /*
   * retorna el tamanio total de la pantalla sin considerar el tamanio del appbar y
   * la barra de notificaciones o notch..
   */
  double _screenTotalSize(
      ObstructingPreferredSizeWidget appBar, MediaQueryData mediaQueryData) {
    return (mediaQueryData.size.height -
        appBar.preferredSize.height -
        mediaQueryData.padding.top);
  }

  /*
   * retorna el tamanio total de la pantalla sin considerar el tamanio del
   * la barra de notificaciones o notch..
   */
  double _screenTotalSizeWithoutAppBar(MediaQueryData mediaQueryData) {
    return (mediaQueryData.size.height - mediaQueryData.padding.top);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    // var isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      body: Column(
        children: <Widget>[
          _backgroundTop(context),
          // Container(
          //   child: Text(
          //     'Login',
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _backgroundTop(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var heightBackground = _screenTotalSizeWithoutAppBar(mediaQuery) * 0.5;
    const photoWidthCut = 200.0; // space of cutted
    var widthBackground = mediaQuery.size.width;

    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(Login.ROUND_PRIMARY_VIEW),
        bottomRight: Radius.circular(Login.ROUND_PRIMARY_VIEW),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: photoWidthCut * -1,
            child: Image(
              image: AssetImage(
                AssetsUtils.BG_PHOTO_DOCTOR,
              ),
              fit: BoxFit.cover,
              height: heightBackground,
              width: widthBackground + photoWidthCut,
            ),
          ),
          Container(
            width: double.infinity,
            height: heightBackground,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.8),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(Login.ROUND_PRIMARY_VIEW),
                bottomRight: Radius.circular(Login.ROUND_PRIMARY_VIEW),
              ),
            ),
          ),
          Container(
            height: heightBackground,
            child: Center(
              child: Text(
                'MEDIC',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          )
        ],
      ),
    );
  }
}
