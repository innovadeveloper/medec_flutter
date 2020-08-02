import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medec_app/utils/AssetsUtils.dart';
import 'package:medec_app/utils/DecorationUtils.dart';
// import 'package:steel_crypt/steel_crypt.dart';
import 'package:encrypt/encrypt.dart' as Encrypt;


class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // TextEditingController placeNameController = TextEditingController();

  static const PADDING_PRIMARY_VIEW = 20.0; // APP BAR, CARDVIEWS
  static const ROUND_PRIMARY_VIEW = 20.0; // TEXTFIELD, CARD
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
    desencripted();

    return Scaffold(
      body: Stack(children: [
        _backgroundColor(context),
        _backgroundTop(context),
        _toolbarTop(context),
        // Column(
        //   children: <Widget>[
        //     _optionsHomeTop(context),
        //     SizedBox(
        //       height: 30,
        //     ),
        //     _listBannerSponsored(context),
        //     _listDoctorsNearbyYou(context),
        //   ],
        // ),
      ]),
    );
  }

  /**
   * desencripta una cadena base64 con el algoritmo AES y 
   * mòdo CBC.
   * 
   * More info :
   * https://pub.dev/packages/encrypt
   */
  void desencripted(){
    try{
      print("========================================");
      print("========================================");
      var keyString = "This is a key123";
      var ivString = "This is an IV456";
      var encryptedText = "1oONZCFWVJKqYEEF4JuL8dVmx/9OScdOvC07IQzxIbQ=";
      // encryptedText = "/1/uw245HE70j+fnzxr115pGHgR8xaGUPz2dNpXgIXFaqCa9lezhwx6fXwU0cBWvZ40z7qsxysn7CTd6WniyH4U4fxvmy9xOk2lDjEDaxJ6vu/RGHvnReCRJtpisezFhfDY29iLEHdkRMtRqLIzlAA==";
      encryptedText = '/1/uw245HE70j+fnzxr115pGHgR8xaGUPz2dNpXgIXFaqCa9lezhwx6fXwU0cBWvZ40z7qsxysn7CTd6WniyH4U4fxvmy9xOk2lDjEDaxJ6vu/RGHvnReCRJtpisezFhjhn1mWJuX6GSPB8hfNGdP2SfPGgpBWyvYJ57XYn6kxGVxfD1iEZKb64B7u02inubk9zj8MvFn1hUP5Qd1g3MbG4DiRXbbL+vg7ztcgfoZVn1/1tl5N85qTESGhjhSbS8XXeQmTUf+eDiWuQ2TwsVVhxuES+dYyIcwNreF0sKkDguytddvDrNnbyZqmaNYWk+SPJhb1DFY2K1VsdK9dZIZDwvG5+MSbyxIpahj6zb1Tg0VwafuWEhisyP81DeGeueE/RqG/eJVE33xtWzekQKW2CoPSigxdwjq/jCtPbPPIMBBvVWSfBvqBGVEHQ6710PcZDjGfjKjLGqsjS9ZCh30scLDSeMezMnO8klc1W3HCqsOEXsEWkcEI6sDagr9qi8jJ1dkdObPretoX0gD4ytz7dvvPIbZAwXfURLb8wwHw+dqBR0CjOuzxt6MiR3FViNrrW3rYZ6U/538bMnFOJf4b7wrZSx2T91DjntqZI6TyHhfKwl8XjcWTWCzzc6oyws2a+Jbo6EXBzF259FMxDjQnclTtl7upo3lUlNp3f1QLORpa0cVrQ/v5dNek9AW5JlGghxS815b2/Qe3smrCmPiK2nbpIf9FFPt1ZiFp+9hbp6NA1/FYllnBloDQLFCuxQUp60GggHFjUWs21Wn16+D9oOF93VQi9KaN9tnrYT8zvuc/ijBJmGPxuIN9t1kAa5p74H2oviw3nO22QT3SvfiwM914AkMk6GVbYCEkWuI4Ms/2RJEnBmzb0PhnjLA3CoBWBedtMyQQ55uZ0YONLrOqNevaTYHf/VKjUvaPHUGW2PwBd5cpWdhIaNKnTXGueJKNw+BeQa4sbFqkbi6Z0o2DASdzBmo45GW9DG7YfhOZbD0cMupNO5EBimBUKlVVseVly8SDKByt7vj4aRMY3D5aH/54n4DkrQoSaw4bMJATLmjtNIylRbhHbtU0CuYlantTVu5GKXitjR4JUv6aRjxRXXz9tfl9GNu41jtCDfE7W/ZZXWNR5dY4oXquWBanWDbS616faHchi6duNMn0xmU3yRj70sdeAqv3Nof8OwuXrpovliPt06yYnAQfG9ghwzpNa793TbCR7c2HP8AtDpTmpeednVMd/Atn8dP2qI632iO8vLxE5Qm4Y2foM12tK9IjYZGW6JVGc+KUUGklk1U/CZAm6nsCtDgH95ePFYsvNfE147YSh5oC188OQFAudkvkyIK5nn+MySk19CdNlNeQ==';
      encryptedText = '/1/uw245HE70j+fnzxr115pGHgR8xaGUPz2dNpXgIXFaqCa9lezhwx6fXwU0cBWvZ40z7qsxysn7CTd6WniyH4U4fxvmy9xOk2lDjEDaxJ6vu/RGHvnReCRJtpisezFhjhn1mWJuX6GSPB8hfNGdP2SfPGgpBWyvYJ57XYn6kxGVxfD1iEZKb64B7u02inubk9zj8MvFn1hUP5Qd1g3MbG4DiRXbbL+vg7ztcgfoZVn1/1tl5N85qTESGhjhSbS8XXeQmTUf+eDiWuQ2TwsVVhxuES+dYyIcwNreF0sKkDguytddvDrNnbyZqmaNYWk+SPJhb1DFY2K1VsdK9dZIZDwvG5+MSbyxIpahj6zb1Tg0VwafuWEhisyP81DeGeueE/RqG/eJVE33xtWzekQKW2CoPSigxdwjq/jCtPbPPIMBBvVWSfBvqBGVEHQ6710PcZDjGfjKjLGqsjS9ZCh30scLDSeMezMnO8klc1W3HCqsOEXsEWkcEI6sDagr9qi8jJ1dkdObPretoX0gD4ytz7dvvPIbZAwXfURLb8wwHw+dqBR0CjOuzxt6MiR3FViNrrW3rYZ6U/538bMnFOJf4b7wrZSx2T91DjntqZI6TyHhfKwl8XjcWTWCzzc6oyws2a+Jbo6EXBzF259FMxDjQnclTtl7upo3lUlNp3f1QLORpa0cVrQ/v5dNek9AW5JlGghxS815b2/Qe3smrCmPiK2nbpIf9FFPt1ZiFp+9hbp6NA1/FYllnBloDQLFCuxQUp60GggHFjUWs21Wn16+D9oOF93VQi9KaN9tnrYT8zvuc/ijBJmGPxuIN9t1kAa5p74H2oviw3nO22QT3SvfiwM914AkMk6GVbYCEkWuI4Ms/2RJEnBmzb0PhnjLA3CoBWBedtMyQQ55uZ0YONLrOqNevaTYHf/VKjUvaPHUGW2PwBd5cpWdhIaNKnTXGueJKNw+BeQa4sbFqkbi6Z0o2DASdzBmo45GW9DG7YfhOZbD0cMupNO5EBimBUKlVVseVly8SDKByt7vj4aRMY3D5aH/54n4DkrQoSaw4bMJATLmjtNIylRbhHbtU0CuYlantTVu5GKXitjR4JUv6aRjxRXXz9tfl9GNu41jtCDfE7W/ZZXWNR5dY4oXquWBanWDbS616faHchi6duNMn0xmU3yRj70sdeAqv3Nof8OwuXrpovliPt06yYnAQfG9ghwzpNa793TbCR7c2HP8AtDpTmpeednVMd/Atn8dP2qI632iO8vLxE5Qm4Y2foM12tK9IjYZGW6JVGc+KUUGklk1U/CZAm6nsCtDgH95ePFYsvNfE147YSh5oC188OQFAudkMLS0tBcJykxppvEl9/3HooANVJKrnrA97pSYX6u1dQ69kpujpyXu8wpsr7M/RdLcbxRTd94Lbg22UJ5f8EEV2g0gI1sLcAnJNz8CeCjO/5MHpOCoBubrckz/UzB6br4VYktMIf/+Ldm/psqJ1d8VDNLtMwkYzWibnN5R4OFxjVou4jEIc19/kcXACV5kWnYV7V5Ie6XgsAUymcQ+LtlJ9EjqLUxb5tkwBz1lxnEag7qx4t12rY06FqxO4SYRR8dZqz4Za87dJvbPGXRqZCaPET8DgTKIIEqc9bpfElW10Zk73upYPtpbhPLp9uPpEn5kHidEgVqUWSC5XpIyvA2IWHMMUcBreaegozC/9iRoOl29BdKJiIlJ4EeOEgXqAN8yyJq9+WkTj44fY/xJ1zfo3cG7SOWZKKRQjxc1gmhFJdsV7Z9WsQG27solxiAp4xCXTN69ho+P4MhgqTiJJhziz0/ObnVzoMj2vHVZ5OUB9sbwiMYNysqFM7PP3j6G7W6MPKv+Rbak9ZWLu3meRXCaNXUknozK7o7AFSmg6GimH23++obJHnCJg4m3cw6z/dDTFkbhqHsGCte31DfEZ/MFzo9xAtphhvZLujz2FIcUSMPSNcF35RP9d1J7k1NCJv5hPsDsBBJDsHYeqWNafjI2Q6qsb1by5XGi3l7OgazSl109eTkebX4/79VLrwT+GG72DkXIYIY3SHk9ixR8yn86vfffEp31LXfbIYViYMQdwpOEywr1+LmlF9qChxUOtbP9TPv+Y9ZpQCM0JPVPOQq7MWmfCzpOET4JSD2VPUdKdJ0Bue5Kyrbkv1tlim9yYqd3jyOOM36T7kkgtHetWAob4hf+a5cV/sUQEJ4o3xoUObFu4GwrchwUA2bg+dj6ktIdRvQyvaWxDix/abxPAfSq9icCpPfhQf1j9Bs2gwRFqWjk0fybGVE7vcthzS5OG9g/hnm/M04G2rfooHjiKpkJp2GGfdTWozXJBMVfBN6Ws+X4oAbWKBs6t1uKOSVdBQd3LiM7c115Rj++rtVqjt1wr3MWtZcRotDFGWjQEqpGIEXxDTw1O71ykyS7LTRFL9lsCPZo9RbHZQ/lRZGfVTGpQXGGmFnz9bD9af9U/Up9auAPUuyMTrPiAMhrKDFs1EXgyvT4REVXA5qfNppePHy98zv+WPfDmg47/GqBkKYWC83pNKve7LT2dQGR9lVRZAgcnUeaG6vbmAzYu3s9NaEt66pEh4HVC+VBlVUZGW/3KrCqZO5wbnuJOMqRko0HGUWh9vG0GMZs6qcN5LAp7Msyd8mUgSiIsYNfeeJEqyCue5kdkqh8ScY8hfbh6yurnWwuBtTow64zeG+0cgDVNLeYl/0Vb3+DnyY3T+RQLeuMURBY5S9ntFgK6AY4n/KgJo7NXx8+ubP6ClF50RIci0Qh6fouWOO8qaWC0DeFKXpIX9neo/M2Vb+FhM5nihenJtTJA34sEe5KSTZOto5/YmuXbRlrL9XzzRoVklZavqJJZovcBQ6mJX88aoUqcr6gd6hSVmxClPWgVPhYHC8CYxGW1wkvMV2MwAulVOcQqPCyhtB3x/zihQLjhVjPs4EaBTSt4knzVbMBD8SnWAHMiuaZ/uHuRJocmNFosf5E3sMpmuQ4oYGRDkGcUHZBrQ3xmkjzd9NuTTt6RtdSeAifKjjvW2UTrHkPsWrFHH7j0BUOyzezRaxOXp6NOPwDSXaazjSL4Z0K9K47mfKQ0RHan0ndCf6wshVQgl/jFLqg6qRi/kBNK0asREynp+vlGcVcoyZq3paK26sUcAirZP+qGbHopYVD9CTpEJTBgM+3rIQwqn3b7DyasXvCcXE4zcOkAttB0j86dAPyZQQjCbETU0DUlISwiHh5cHqIAlNCdgiGtP8wxRryhrN+zqnquDa8kStOWaiUzEFp8UYQGoZt0p1AQom7CguNO6/cP8C79fMrcqa1Y77yRcgxyUiTBAjftiWVar1Pb17jWGNP+SEbrS45vVFxgBO+gP+yT154b5gJ93qGwHXzC97RIXvi2FpklqipSXyz9SGpeukMV9fOlw8Z+VceG8DOUoU8os13lpqPtQPZS3oESo0hyrKQHgFl2ECa7WM6cr/206TK/ar1SDQ65TpM68WXXkedhQJ52ACxw43u3oXbOVpqX48gZsM1SYXu6dCw6BS0gtxlW8O4oxUw5jbO/Z02tagdxev9AlOpQUxUnV2YQQTYUahIYzJfE9Q3a4HYnp+hioAF0I7w/Tfn1MRBYXEzieSaN4BbE/CMwYR5BtmCjqfX+Xu+doIzpVUHh4fRvuvUWdRhCzJWpVeifAcRqAcjS/oMJfrjLF7hC46pA7Eg7OCh+RYyj6LdBJmvwG5BcVMcsIP1JVTo2AiZvgV4ai2reoMIdOKL3BjoZZ/PkTO/vEmrKxURpQ2wlmez3jFZlrVO9Sb/p9CPCQGlP74bTtOO9apVAEVwcQjsEP5HzlzJJUV08All3e0k/ZK7JMXd4wdGg0DFJ+Iz32TFB9QnS7sXzCj2v6mbtMaAaYJUZcqJO3sXq99bDjB+Nqaf/lxNuouVtV8nLb+Vf3I6PNEySq/+FActrQmajRQejOUe779es52sckUzKQLW5gTNWfy3lp4wIjRQUte301vccAXWiFuu2Ijh9G3EKi9htBFhCZUlBxOeMgNxSaNV6lSS5+JqMriVxWF1TdY07PWsDyain5RqGj3/RMnspcZ3Dtba2PKOaortnZ7IhCzC2dG8KSUrKIdoRhEq7uSI1FzCI8Etz27tm3SacqY/OSE1koWpOmNMHBXLv8O3yD/emMrb392EXgV6JXKiCF2kFdBmu3zSR/Wp29ji7ORsmX1ZKWXNDiR0IUhjoJ/uW+WMRHW0E/jPSNApuWS9HP1EKV+hhRVt4nSRktGEDcaLJ9XRxMdBU5xJdtSG9sH4muxU721dVODUKLmzXhKiJAV4FdLdKZ/X2HtnG6ac99juK5K3MET/yqqTDLAHaXjfT+2V2hVH8BLHPgPBZPU/8mhuQqm4HvXD+Keut+piGqHYYQ+VMPLqmUo/6/OzFcVruich34Vd6ToS7jjX8H3gZvFmK80soGjcDINnKXd3lD1JwvfjS0c7uaoikvMa/gjsm6Lr66+vxGd/fVPRQDJ7WpbOV65TvJbTuHG9Ox9qH661X2uyvRgu9tRWyb0P25pv5nUAcBRDmMDPwQX0+cajf61so6GAn+cJMRYqgT8rto4DQsm4ZmWnhmF5vUBP3x1Whr88GXoQ2uoi35qu5kVFASuOzpLaq0yhYFxSEbk4wA6QRZYetA4xDy+zdvgl1ky0qiLXmokWvM9hlXGjkSiMwYh4BW6ta9cGSePQZjRBGiYq+2HMhRRhctWoC8pJvhqbBpM23ukaIZUToqEi3ZetWWmb1tS36jzBCGz5qu6RrjvLR3LduqxeCvWvdV4oF6uHUkne4NT54STip9979XRtFGUwrXEr5h0A4BQtq/UAmg06kwCP+07wL1tuwj+cEULs4xbV4emW51BOD8RpnKrTt3k8K245nqxNEeOLhnPk+E/m3HNm0yJwJjNQ5FeZdIURhOzP4jDYtiA0M5CS+d/0MmUqzcprSj1t+sdpJEnCC9Yh406yxHEw68/9mJ9ruIWCerEK+CIZ0eh9cUaS6+wJyGAo4vVK0/A7Ncg71ZDkfk+6+NczXibycocF/U+1nHuW6OtCteEbEQBda4/HSUl10HDTGj3ySWpEDvbyXANo9TLX44ze9bXTng1/VOuNz8Q2UZlCtwhImBramDmgPj14xzqSPxZjgiFTvIcVJW9QNYgCybm2oN+EeU5kqhCQU69Y6dZ1NB0IrmfsKQEp6ancRaYrMSsRpgTbgFF4sKjGmnK+r4vMEVDX5EwpkZh18SVKh9ohwRVfNPeaFiM3TnMsZVwEdCZuLL+H92PMTedMcr1TkvU91cLg5mEGiBvGIRaL5QvAb8tMYKe8dce8UWp3jTDNm7zouGmRJYJdPEjAh9SqXmjIjpJkoYR/d/gd7ZxKkQJ40kKigGsvT/64OTH2P9djQr3tcMAB5I2N0DoT1g5YMlQpvi/RItczXCoYzg8gt1an2c7VOaxgXhUBwQj9YaFOgXDllwnhifOfpCjoxZJnqIOb5u0BvLfixXCVAf/+97wlNU19XqFofroNS9NtieyYeKAdN2nR9S69qIjgZt7WYVIN5w7McNH0SnBOIJdeb/UKEjS2mY38gpuiCrnQEQBkGd766DH74pyI3mhki22xFJEC5fgVeG3zY0x1BEJ+qW7JZGhS3lwF7JbFoD+s+QA7du4xXOt0sueXyVK1GdVF/cCvoZITXeH/Bu5GpVJosVUP1phTNx2q2NHrFkSi0EmCycFsNJmJ8nx8ed7FeSGahtZ8wVBkFK5Una4cl4gpFfmOXJar6ZmQzqIRE+xLEblpK/bZVmGHH9h1HVUNYLOne6IE8Z0oTRGTHxzLD4sVlixOqWx2U5PBgEbGJD26/EA9u5xLXG842YfulDuwXDJsTFqAQeNc8DvUP5W149i/n7ayUEomRz8cBgUtUiFO+MY6fwSk6lGozF0mTfj3BpRPX4cdeYtXQ2gZ/5gEJSlWscpOUHl0PV1LuegDNBD4makmViqN5KD/Md48UzfEjn75yTnpDDh16eObka4r0WPbTOpHcItAJYUyNemJUIZob/O52nPb8uS8z0lRVu5GTfyqRr16n5tkZZ0xWVWqY3nfSQMoP2Vh5BayTtxS1yEmBia3ygCMxHHgCkP3RwlluElEWK+O9ra50plCRnW/9SADYz3SipQNsgYocdUL7OZi/UBiq+cAqOUt0+YOSdvT8Amom1BXUCcboqjQqanpxrV1/+NmTddff2C032FtefdgPMLWagn9WEknL+xTg2xf/+LniPMQLe2KuWj1zeg69nHKM+CERc3smsRptBEMQsyz2EVc76Voh4F63rOrzhUPZ7ANE7SNu+MA6mcDMVCgV/fcGrURYhvm9ZRUcG3lPqgje+dPBL1RpGnAtzuwNr8c5kqQ4h5tWHG4ozi1u1b9JygcGGKrNRo3hk+gybSV4eef5XJjHRLFJU05HZYEGJhezlIn4ySvDvJBeSp3M/N7WBqRMWdr3FidrpBXORwcYWNAKwIAADS233J6v5pJ1LquhqFIByIGJfOeZyc9tOcfaly2S8R0lyT+N5zwaJKB64FW3vKFqm8JwvQFvHLP2sL53n56aLz7O9ZY0uB45R+XE5jP24P4jFl0XE3YXQLYQ/zPCnjQ2xnebdYLlnlhvbUjTkl8GeDDaZvHYjVX8558NYDXnsndQZKegqKoDic1A1WybDDk4aDr7zhpnN815fBLuAl+kTdlv9QN/MEj9dapZJoRz6y9Qr1owEr4Ip2cxVAkb8i/9d0tOZq4mSGjFtMJIRHlMFaNU4+6RMJvR9zVMj/vRgvLHzv+AeqRNxYxjgHHlyF52HQlk7NJ7Mi6R/aMh4oerpO05NBKVBTTmUUzi3WX1Nr0qyMgl3QfGmNTnqVMjK2fTbllXGwIqSRyLJUuEzJU67aZkwUdThed3CUn6OJhWsv0BM/IB7zH4Z9iog2b9/8HJGQwnHcyHIJcjyK39mnGC8sJdmgW4w9oj21spAkny0CGUngsiIi8AE4WhsX97iKHCpwaoaDoy7KgTO5uDRJ5o/5dGgcAUKqNXKMY8Spq9Ap0w3xAADkTITEfd88kuVAK+537wIrsS64bL2UaTv7aSuC3c4DF9Rq+ueuaoNIn1WaWWaBgWxFn/O2dfNF8UIH/VcaXImcib2SdBQed8Jp1740NLg4BDVAy0fzgNBzcwFQ+S799OTocQeB4ES6jpK28QlRa7qTkndXZRs8Dxb6N4ekgznXYtMMi4Hmh3x0U3IBoZTlXxlqC5/SV7YQZIMfZRjJ3RJDuvQHT/HhlLO2jkO+0mNXoTki08pXPYU3ZhmnO2GHX+/DQh/ezyXklbUv4mRSwlSkIzbZwlVJvXs0McSvDbDnZSSqGkfzjXL8AJ2KxyZSE+PLfIYFho8gvbj5hKgjsnk5VrbNtD+/bdVz5MffIsm7E4w6/ixEQ9afLlZnQ+Y9hweI3hrZWQUSs9lp13ReWKXXMAqV8+EDNBsSHMLI2nt6HOGyee1fmSDKMWnqKkKlKViSCQag4+8WghmTmUYn8v0/lJD/Hy4TNKGFRhnqHYvuT84ECRFmjbvh1YXylvLpubcmsqfE5PX8dSYwNPvSd66ILlG+cs3CjASqEojcTDSNoay4vEN0PA7K1WuPmiByNFM0T/R2HVt8sO8aYzmZGvCa+TV6Z3COmkhMfKc/NxjIUQcbAhsXS8tnZFJUqixpOcA77VPRXZ1EFjRABcTt1quZvskN+bkUWmDOkqNe4w7aBDULguegUMJs1/3DsXIGBrjV+0EeeoHUELpfaz/rc13WcLftAXoivCYpU2ab9LIngMTG8sg4Iu5z9+0jtmCs1XRhcUlFhHoMn8UxEjW/gca0PpcGGlMiIu0dx2CQ8d+FcH7GqCEsXt/dFAcRCxeE6LmygiAxfdec0SIwX4pXrd8932wiVV2UGJLAvABbo+deFODWc8I/w0BTpkAkqHWMRLSoKu2jPDaDNdZulbIHuDehCeZsNNFdH5y9WHFhGHsqFdtAZMil88axAj4JSHxKXw79JI1bBEJCHa4acLZHC0eHqjUemXYeo0Knrm6aL0AQlBl5FsKIs0halTyJlhVRbuiIPRJSUjXbLxuijUTfehY6eA8UXat6QRgp00vTTGSPbpinketa+V74t8fK7FLqajfnj0pxQsXFiS68usF2jWYdtzggKXFfrV4+jGtnVUOBNXOBPrLPWDyVQ+uZIX5AvnfVMGl5ts5iBnKV/l+PCQfuz6HM8Uknb0ZlH3sdmwh+8R7X7O3aHoIrVhdWLgX2bv3+PupxVk391GpB0u+k1HLQAPOOEHPNSDaniRIQHnI6ThCCMRoptYGJwRPvvPFRN5gtIFbFqMAvI4De/R9vEOpmUOeNgShaKnprsiRt+8uFDvaSjYSHEqyg/CN36/tVca8pjYyx4nhdgvxsFvz6nQZMdBrkb6JWNr6Gz8x0bvbEW6WVbOmHtMQA2B4iB/LDJc1rhEllkY3ppi5FalDofIVRE4lJq9zNqbyNTfjwwQAS73kFEn9p41yJDeI6PNtvbnUZbdz3AIxGKTq9tRWeMS2OwCCFDENCtXS2/moR+HjMW/V+RfpN0OxWEL3y8Lk863/Gq9yZKB0qRLA4zSXsW8npB84v4wZyiPSt3I5oKszmltUtTByQuU9KngSvJ0a9xp3Pxf0PoWctp1XV/9tPfbajRhkT1UqRNsY4+79ZwVdtET0INX9AkoB35HSALwuNB7kA4t+/XM8NJZV3QHE39Au6C+wDGXU0fLDevwLPuG+bRv/s7p//lyKuW+6dUgdWicE+22akWMGEXWNUGMepovDghNOjIi4L5lr7eyEpXBcMpXOCqWUS8W1wlfZbUXcgOVfUgNXsEyp3W3k4rWEnJxvB3sWtGCEWAbKbXDZJKGxznHN5Wx+kj3V6QNmV7mJ5/wMQzOC+Q2vuNayNlrk+r1lN6kCh9zS0Wk+snrXEA+6qAb4/VgAr0oyp7XynzVDLTHI3hqPG42p77+KhSBYxhNggRmF6AzXz4GSLcBZGabQAf31/Zo6s1xM9EmoUJWfJhDPPZhW74jMV0R97S1BgS3KNnFtZ++tZqOFDD51uKAwPWO2oUTUAdud+aE4UTCWsWfwjV54hNgqorIVBher7LRdVwNcSDv4ktC2UaNTTGa+GDLqSH9C+FrjZxL/K9hznwABylmFg9bmeYMwNeF4tTR6njVdK4AqUWbhOwGb275tX+gNnjNJbCZJY1ft1VPjWFd64PM3X4abC+y7jUq1QDedYqBd4HvQ6CGpYJ3xMWg7yaP+RHvI5E890lFT82o7CKdBVPUeZIVQL91qE1B+gjleiZefbe+bs2PbO98asqDRhnt9lo6tr8hIyN/O1DUenZs1c1QVysFV8E+rSvidKhvaZDQ9xp5yh7VStiW9tvAtU1+/8Fyi7JyoENsB5nFn+CWrsysUq/BrfEzpaom3D3vklkRAOiGhLonFI99adD6AmT4qN4xBHbvpJq/WGVstJpTxAPEAkcxC7lVNHnMc3wpWXMUd3WxS0gJ90Ivbyrhw7kmAwoGnRor27BJAWOKyOP4wqPUduS7xQNeEoNcfs6oQZvN7AmOgM6r3iXFxId6FW6fEHQRhsztyFV9LE/3NTaYQyl9yLhTQWUKnKV0hFSqNu9t/o5Mx1+4NYUrN3h3mYwJK1HASplW1yR9KmHseBaNKx6l5aL0PfEqNkzAelHUhDCIF29phyfcKExAFCc6cyUz38LUA0Y/cJJEP/2wjlcImVMksRX9yurqe1tIZwk3jbV40V4YD02Moak0fj0bd1i/QhOz4A4QOpaZAor4WXAMW3yorjuTuEyAlsV69s/wIjrVE8FRQxZqhphoRDCIUoTFQYyw/9GctlUoBUFGtpIW6vnDHe4YsONCwi8BiWXJzNU9lZzati7J63qRWonMv9DtBAGHbxpZHAohyKwWgYTjI2QiEjFOCnDS0QmJRAPHhUWmAez7MzBRd36IS3SsKYIAjyK5WeiLCkuGMoRPmsh2rPeSOcAz4FYxCDm07IDwwZle3tHsli1TTqYq46OxV5mgDjR1jw4X09Y5rysEhDUKAhoHGgqucF9dI1WmGOuat8P92Tg0O45X4RRKPCioNoFFJ3hyVNcK1cZIRQs67XOzitvWTJLMjtzg//26tNFowLZA9jdYfzzrWD33BoxzFKxgtooCeYf0jSJR4x59djC+1PYAdS85BJhLp+MQA3GxxcQqTCqgbPNBkMS2ECIPJtr8dgJVyIrfqSx+MKZ6e7kcCIYUvSERe6tWNApZc7CGtQ2peR7m41u1PA3tW+F27z5A11kznfr+ubzkLfek/o7O7X1aJwaSKdldL4Z3hATyAG+xv+aD/CkSTkpINT7Y+zimBjrKexoNUd6VmhW/6zBjDGN0IZuOXt3x2FrcVJKJ/ruHVOYMalZWzqPDQu7zquSMf+PUVCYy9G/GjyjZE9dgbjO1Mg0hXwbmRLDrzwoZP9iKIcMu6sf2RZWY5Lwlkbg8c7sl0UuGSsLevuhw6KObpd0vJupPFzIqDoHihL2VCqYZtAZdlOpejlCjYgWg6PEFJm0k+BsXKycfRqLQo+0OzScPbICb2gWlNq1siqS1EblXCq9cQecd8kmHbEgy3Urz328H1Ui199Dwbv3GkunfxgjyjfqMnAGHGylAVT8LbUof2iFjeMLWX8ayInzkuLQUmH4CTXvtwpl00MDZ/dzXMzkmzvAKfr2MezD70TC8SyPJFdv+Cqt6bX8uNA5dWIeW9RQtYKxU03sveW006D71y81jeZ5CFY+Czd+xUHNM6SXnvV1PaS4WbPjKHOxhGbuJy9KUPVfxKEsO++9lc3x/5aoLnbB2P++dghPPP64cAEzxyl6+D/DBtD3g664Irlgs8pjL1u5bn4cXYzdPzz7NeJDtV4vx5bcmTvuKmWUTVahGhC9RWMhI+dVkpdKp8T07Sg1oGkGO8D2uA2epnbP1peDyxuAlmiEEqTFBN/8n/JPjK09ZdiL2lppksjRHyJgiceCkUKqCWtjC9iItkwr2tTsNbyi/F6YwSBc4OeXoTnhleiT4n9YujJX3RT/p6HABx/cpm49mWWdx0R2JASWFYzB1r7cevFRRxuiYsq+FwGDq31twL1gXpUUojY5hZVGvEGwehaKZ0Eux3yO+jgeG0r/YWcY12XkAD/REMhGHjn4yZuMrrtNm5oR8KT2DCFobfqnq8BRlztkhxCEsMJZeLbv1/0EkBuz1+wxJ/iXtigd9qJHAQvz0dfKOT4hP3E5JWTyoCQYN0W+0jRr7F2rQoJ51fJbezuzxOoifWgM2EMo0PEvVsLN30meJjrOP+sN1lGbEVq0b4oD6x4kCE5/TLYxcSZsuYj6+8pnNA71ZDVc0GEYwV2Dfd682X+9qNX5DnRqGX0yC2k2CdTLk+BW/sjcA+H40ow+UYyYbKiIxGDGbE64+3FEsDxjwsnlPISXao7ELHWp+DYpAPLqs1/90Je+AMTOhhzdC/DOSCStZxp14TBd0EkbLfmCEgpfrRQmvGiCDEt6fE1yQHdVQo+5LyOA5o/BmJZXG5GIIDbmMK7WRX0PtkrHL2+k3PzJbdw/7ex0BOkNObZK5GrzelByYPAZYy5YNUaMO3VZ4mdAoQmq0KfrQVwgLDI6AfXcI4XpW8nKH3As0rCJpN7E9E1YWmzxRsLt6VHmBEA3pgC/Jjk0xQER5Qec2803A7k2gUqpU6JskPwqYj6mxZai7+il7J1W1QQPe1KvWi2XDXQBqD9q6iWQJO2yBCM3ykQY87dALJd+d1tG+NSzQ+V1j1MubCgrjY3nmd630ImWUuElHrxOM3hw5W+VOU0VpYu8xO1eycmhHSN5g0e3bPzVkBOTV9uAt0fiGeiR3kIU4Snbk7In12lbogwUiSjcKaUK6r0ApTyWmKVs1TMczCUAUR9qbKM0YTRb93Yd6nhsFuNZr2x6quW5mkOkew1l1rWVRYUFxFUV1lX5p01tp2tU9FnFhX22BXA2uLPF5jgOd11djb9yKRqAVH7KDe9hTDA6goYzn0/I4JXSU8N2MOuBrwayuqW1p7WqUkKDzqmN8mhN6di4fasyrF2ZnSl9VSjeI211EWyIM3uEm5lAVjevMRPVXzwdjvLFdvwjejhw6J41ccwhqQnLlO8Lv3fVtst+6Aqe12H1Zg1/QWuBnYzBXYBZxhXL4w9nweqi07yVMHUjqDNyu//GE650m+2q3+xFGG/+Sh5j6KwfBh00BJOQJcQ7FVXFil8oGhTfMwwyz1BKrzfHZF4MdKlxb07fkWYGPSFHYNR00NlqV4mmlZ+x5+foY7Btus+FZaJ4L710igd0gK9lw2x8KWi9jhful2Ljk7enUQZjLfuRn16b5r+PjQThAg3wfGCjzXPNy+LFNhPPrh2sR+JiQjUJUpq/Q0vo/J3SXF+0I/pigvdc926j2Qm3X2PHCPHhWtAIO0+1YKSjvHMcIR4VefgEfujzofvJShdXdwTzdDb55x2Dz86UF5WnRDI2X5elFfY5B44jzSrPFh8klclCC+xGlGZtNlUP3DGDCwqfRchQi0zH7MexrLVY0foMOLZpXSuw577eHZ5dYaveHk/J1/cTQSVCFcyIjWoRNzOiv28tKl105ve9018VcHleZTsu0PV0sPglXVhNE8VbL7Xqdk9DwlyKFi3QVfArZvECDSlFG17Q/LoNgCAeob6k9891vzs4nQcW/fNcsW5qFa+TN2ElR9RIWLdG88sGJuTgAObT+T0YZXMjg3l4lUQ5SkkmcvniLUXBc5NGv0v889QtdCEVYtDyX9xT4Wj7VN1B7gwLXmf9KZGa15rn+fFGy+UcAtq+bTTRWsZBuPOuKlvWJ12QNOwmORYcPviQ/ilgeKLGGE8cjpB2SPSq7sq/H/gvlMKi5ww3ph1fNhGRzmGWFMkUaV3jSxNrdEZv1VNbvBzHZwidPe45kP2cMu6dDODZ5cQla6bGR6zLRCpe/Wy5xjQG5EJT/8XUvuiEIqnRs/q/hdAShclFe3vWJRDThefzcgPBAOb70Dt8oG3pq8YU13s9d2IOHtArk30hfvodea+j94mD/MePJMWv8WKRo8rqSUtxrmoGrgFW77ru4Jwr5VGxDlupXMwptRVhdTJxt6npspmlp4Y4sWwbxrhooKy14k4IJdfaP9GkF8V2BXwbmAn3yRDbHysq3P4fU+4g1e2Ij5AEZEDErkfzzGUBxBnwYFUAybf0CP+DnZDLL8TAic257XagCDoZkLviWlFjS2tFhAL1341GPiBIpwY2L5COIDjCO81Lj1y39vZ9MuJwuBQ6Yz5I2bPmuOBqmOPsAX1c4mruEP4c+zPAOSNmbmxlrAQpv19JyXYvI9GVfQS8LbVyGDB4wl4Nyg8=';
      // var encryptedBytes = base64.decode(encryptedText);

      var key = Encrypt.Key.fromUtf8(keyString);
      var iv = Encrypt.IV.fromUtf8(ivString);
      var encrypted = Encrypt.Encrypted.from64(encryptedText);

      final plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';

      // final key = Key.fromLength(32);
      // final iv = IV.fromLength(16);
      final encrypter = Encrypt.Encrypter(Encrypt.AES(key, mode: Encrypt.AESMode.cbc));

      // final encrypted = encrypter.encrypt(plainText, iv: iv);
      // final decrypted = encrypter.decrypt(encrypted, iv: iv);

      final decrypted = encrypter.decrypt(encrypted, iv: iv);

      print("decrypted length : ${decrypted.length}");
      // print(encrypted.bytes);
      // print(encrypted.base16);
      // print(encrypted.base64);
    } on Exception catch (e) {
      print(e);
    }

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

// #region list banner sponsored horizontal
  Widget _listBannerSponsored(BuildContext context) {
    return Container(
      height: 160,
      child: Padding(
        padding: EdgeInsets.only(left: PADDING_PRIMARY_VIEW),
        child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return _itemBannerSponsored(context);
            }),
      ),
    );
  }

  Widget _itemBannerSponsored(BuildContext context) {
    final RADIUS_BANNER = 20.0;
    var mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width * 0.9;
    // const photoWidthCut = 20.0; // space of cutted

    return Container(
      margin: EdgeInsets.only(right: 10.0),
      padding: EdgeInsets.all(1.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(RADIUS_BANNER),
        child: Image(
          image: AssetImage(
            AssetsUtils.BG_SPONSORED,
          ),
          fit: BoxFit.cover,
          width: width,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(RADIUS_BANNER),
      ),
    );
  }
// #endregion

  Widget _listDoctorsNearbyYou(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: PADDING_PRIMARY_VIEW, vertical: PADDING_PRIMARY_VIEW),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Doctors nearby you',
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                'See all',
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          _listDoctorCards(context),
        ],
      ),
    );
  }

  Widget _listDoctorCards(BuildContext context) {
    final List<Map<String, String>> listDoctor = [
      {
        "title": "Dr. Vannesa James",
        "subtitle": "B.Sc MBBS DDVL MD-Dermitologist",
        "startCount": "4.2",
        "assetImg": AssetsUtils.BG_DOCTOR_1
      },
      {
        "title": "Dr. Steve",
        "subtitle": "B.Sc MBBS DDVL MDDL",
        "startCount": "3.6",
        "assetImg": AssetsUtils.BG_DOCTOR_3
      },
      {
        "title": "Dr. Luciana",
        "subtitle": "B.Sc MBBS MD-Dermitologist",
        "startCount": "3.0",
        "assetImg": AssetsUtils.BG_DOCTOR_2
      },
      {
        "title": "Dr. Vannesa James",
        "subtitle": "B.Sc MBBS DDVL MD-Dermitologist",
        "startCount": "4.2",
        "assetImg": AssetsUtils.BG_DOCTOR_1
      },
      {
        "title": "Dr. Steve",
        "subtitle": "B.Sc MBBS DDVL MDDL",
        "startCount": "3.6",
        "assetImg": AssetsUtils.BG_DOCTOR_3
      },
      {
        "title": "Dr. Luciana",
        "subtitle": "B.Sc MBBS MD-Dermitologist",
        "startCount": "3.0",
        "assetImg": AssetsUtils.BG_DOCTOR_2
      },
    ];
    return Container(
      height: 200,
      child: ListView.builder(
          itemCount: listDoctor.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            final item = listDoctor[index];
            return _itemDoctorCard(context, item["title"], item["subtitle"],
                item["startCount"], item["assetImg"]);
          }),
    );
  }

  Widget _itemDoctorCard(BuildContext context, String title, String subtitle,
      String startCount, String assetImg) {
    var mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width * 0.35;
    // const photoWidthCut = 20.0; // space of cutted

    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 30),
          width: width,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    subtitle,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: 11, fontWeight: FontWeight.w100),
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        startCount,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        CircleAvatar(
          radius: 31,
          backgroundColor: Colors.white,
          child: ClipOval(
            child: Image.asset(
              assetImg,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
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
