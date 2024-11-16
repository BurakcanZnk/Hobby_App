import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, id;
  final Color color;

  Product({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.id,
    required this.color,
  });

  Product copyWith({
    String? image,
    String? title,
    String? description,
    int? price,
    int? id,
    Color? color,
  }) {
    return Product(
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      id: id ?? this.id,
      color: color ?? this.color,
    );
  }
}

List<Product> products = [
  Product(
    id: 1,
    title: 'Araç Adı',
    price: 2500,
    description: 'Araç Detayları',
    image: "assets/Resimler/1.18BTF.png",
    color: Colors.grey,
  ),
  Product(
    id: 2,
    title: "Araç Adı",
    price: 3250,
    description: '''Bu klasik 1967 model Ford Mustang, su soğutmalı 390 kübik inç V8 motorla çalışır. Dökme demir blok, otomotiv endüstrisinin en iyilerindendir. Bu sportif model 4800 rpm'de maksimum 320 beygir gücü yapıyor. 3.200 rpm'de 578.93 Nm torka sahiptir. -Kapılar ve Kaput Açılır ''',
    image: "assets/Resimler/Shelby.png",
    color: Colors.blue.shade900,
  ),
  Product(
    id: 3,
    title: "Araç Adı",
    price: 3000,
    description: '''LaFerrari 2013 yılının mart ayında Cenevre Otomobil Fuarı'nda tanıtılmıştır. Ferrari'nin 6.Nesil Arabasıdır. Special Limited Series kapsamında 499 adet üretilmiştir. Elektrik motoru taşıması bakımından Ferrari tarihinde bir ilktir. Toplam 963 hp gücündedir.''',
    image: "assets/Resimler/Ferrari.png",
    color: Colors.red,
  ),
  Product(
    id: 4,
    title: "Araç Adı",
    price: 1500,
    description: '''Dodge Charger R/T (1970) Özellikleri; 4-Vites Nesil; Charger II Segment; S Silindir; V8 Silindir Hacmi; 7206cm3 Valf Sayısı; 16 Beygir Gücü; 375 HP / 4600 rpm Maksimum Tork; 654 Nm / 3200 rpm Maksimum Hızı ise 211 Km'dir''',
    image: "assets/Resimler/Dodge.png",
    color: Colors.grey,
  ),
  Product(
    id: 5,
    title: "Araç Adı",
    price: 4500,
    description: '''4 litre hacimli bir motora sahip olan DB5 290 beygirlik güç üretiyor. Yeniden üretilen modelde Goldfinger filminde Bond'un kullandığı teçhizatlar da yer alıyor. Arka tarafında kurşun geçirmez bir levha, arka farlarda 'yağ püskürtme' sistemi, duman makinesi, 'makineli tüfek' ve 'lastik patlatıcılar' bulunuyor.''',
    image: "assets/Resimler/DB5.png",
    color: Colors.grey,
  ),
  Product(
    id: 6,
    title: "Araç Adı",
    price: 2500,
    description: '''1/18 Ölçekli Kara Şimşek dizisinin efsanevi arabası !''',
    image: "assets/Resimler/KITT.png",
    color: Colors.brown,
  ),
];
