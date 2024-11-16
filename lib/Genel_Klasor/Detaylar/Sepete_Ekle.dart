import 'package:Hobby_App/Genel_Klasor/Detaylar/Satin_Al.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Hobby_App/Genel_Klasor/Detaylar/Urun.dart';

const kDefaultPaddin = 20.0;
class Sepete_Ekle extends StatelessWidget {
  const Sepete_Ekle({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: product.color,
              ),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/Iconlar/add_to_cart.svg",
                colorFilter: ColorFilter.mode(product.color, BlendMode.srcIn),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Ürün sepetinize eklendi.'),
                    duration: Duration(seconds: 3),
                  ),
                );
              },
            ),

          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Satin_Al(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)
                ),
                backgroundColor: product.color,
              ),
              child: Text(
                "Satın Al".toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}