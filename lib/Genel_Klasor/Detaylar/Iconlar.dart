import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Hobby_App/Genel_Klasor/Detaylar/Sepete_Ekle.dart';
import 'package:Hobby_App/Genel_Klasor/Detaylar/Renk_Boyut.dart';
import 'package:Hobby_App/Genel_Klasor/Detaylar/Alisveris_Sepeti.dart';
import 'package:Hobby_App/Genel_Klasor/Detaylar/Aciklama.dart';
import 'package:Hobby_App/Genel_Klasor/Detaylar/Resim_UrunBaslıgı.dart';

const kDefaultPaddin = 20.0;

class Iconlar extends StatelessWidget {
  const Iconlar({super.key, required this.product});

  final product;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/Iconlar/back.svg',
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/Iconlar/search.svg"),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset("assets/Iconlar/cart.svg"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Alisveris_Sepeti(),
                ),
              );
            },
          ),
          SizedBox(width: kDefaultPaddin / 2)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Renk_Boyut(product: product),
                        SizedBox(height: kDefaultPaddin / 2),
                        Aciklama(product: product),
                        SizedBox(height: kDefaultPaddin / 2),
                        SizedBox(height: kDefaultPaddin / 2),
                        Sepete_Ekle(product: product)
                      ],
                    ),
                  ),
                  Resim_UrunBasligi(product: product)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
