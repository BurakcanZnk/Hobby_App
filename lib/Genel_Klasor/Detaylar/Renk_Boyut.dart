import 'package:flutter/material.dart';
import 'package:Hobby_App/Genel_Klasor/Detaylar/Urun.dart';
import 'package:Hobby_App/Genel_Klasor/Detaylar/Metin.dart';

class Renk_Boyut extends StatelessWidget {
  const Renk_Boyut({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Renk Seçenekleri"),
              Row(
                children: <Widget>[
                  Renkler(
                    color: Colors.black,
                    isSelected: true,
                  ),
                  Renkler(
                    color: Colors.grey,
                    isSelected: true,
                  ),
                  Renkler(
                    color: Colors.blue,
                    isSelected: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

  class Renkler extends StatelessWidget {
  const Renkler({super.key, required this.color, required this.isSelected});

  final Color color;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: kDefaultPaddin / 4,
        right: kDefaultPaddin / 2,
      ),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
