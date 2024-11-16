import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Ayarlar(),
  ));
}

class Ayarlar extends StatefulWidget {
  @override
  _AyarlarSayfasiState createState() => _AyarlarSayfasiState();
}

class _AyarlarSayfasiState extends State<Ayarlar> {
  bool bildirimAcik = false;
  bool karanlikModAcik = false;
  String dilSecimi = 'Türkçe';
  String ulkeSecimi = 'Türkiye';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        elevation: 0,
        title: Text('Ayarlar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bildirim Ayarları',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: Text('Bildirimleri Al'),
              value: bildirimAcik,
              onChanged: (bool value) {
                setState(() {
                  bildirimAcik = value;
                  _showBildirimler(bildirimAcik);
                });
              },
              secondary: Icon(Icons.message),
            ),
            Divider(),
            Text(
              'Genel Ayarlar',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('Uygulama Dili'),
              subtitle: Text(dilSecimi),
              onTap: () {},
            ),
            ListTile(
              title: Text('Yaşadığınız Ülke'),
              subtitle: Text(ulkeSecimi),
              onTap: () {},
            ),
            Divider(),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'İletişim Bilgilerimiz',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ListTile(
                      title: Text('Adresimiz :'),
                      subtitle: Text('Paşabahçe, Soğuksu Mah. Beykoz/İstanbul'),
                    ),
                    ListTile(
                      title: Text('E-postamız :'),
                      subtitle: Text('BCZDiecast@hotmail.com'),
                    ),
                    ListTile(
                      title: Text('Telefon Numaramız :'),
                      subtitle: Text('444 444 444'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _showBildirimler(bool bildirimAcik) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bildirimler'),
          content: Text(bildirimAcik ? 'Bildirimler Açılmıştır' : 'Bildirimler Kapanmıştır'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Tamam'),
            ),
          ],
        );
      },
    );
  }
}
