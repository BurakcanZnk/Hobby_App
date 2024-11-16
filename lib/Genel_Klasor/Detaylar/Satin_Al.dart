import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Hobby_App/Ana_Menu/Ana_Ekran.dart';
import 'package:Hobby_App/Genel_Klasor/Detaylar/Alisveris_Sepeti.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Hobby_App/Genel_Klasor/Detaylar/Metin.dart';
import 'package:Hobby_App/Giris_Yap/Giris_Yap.dart';

const kDefaultPaddin = 20.0;
void main() => runApp(const Satin_Al());

class Satin_Al extends StatefulWidget {
  const Satin_Al({Key? key}) : super(key: key);

  @override
  _Satin_AlState createState() => _Satin_AlState();
}

class _Satin_AlState extends State<Satin_Al> {
  late String name ,address, card;
  final formKey = GlobalKey<FormState>();
  String selectedGender = "";
  late TextEditingController _card;

  @override
  void initState() {
    super.initState();
    _card = TextEditingController();
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[400],
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Ana_Menu(),
            ),
          );
        },
      ),
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ' Ödeme Sayfası  ',
              style: TextStyle(color: Colors.black),
            ),
            Icon(
              Icons.verified_user,
              color: Colors.black,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/Iconlar/cart.svg",
            colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Alisveris_Sepeti(),
              ),
            );
          },
        ),
        SizedBox(width: kDefaultPaddin / 5),
        IconButton(
          icon: Icon(
            Icons.login,
            color: kTextColor,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Giris_Yap(),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customSizedBox(),
                    nameTextField(),
                    customSizedBox(),
                    addressTextField(),
                    customSizedBox(),
                    Divider(),
                    customSizedBox(),
                    payRadioButtons(),
                    customSizedBox(),
                    Divider(),
                    customSizedBox(),
                    cardTextField(),
                    customSizedBox(),
                    cardRadioButtons(),
                    Divider(),
                    buyButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField addressTextField() {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Adres Bilgileriniz',
      ),
    );
  }
  TextFormField nameTextField() {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Adınız Soyadınız',
      ),
    );
  }

  Widget payRadioButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Ödeme Türünü Seçin :",
          style: TextStyle(fontSize: 18),
        ),
        RadioListTile(
          title: Text('Kart İle Öde'),
          value: 'Kart İle Öde',
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value.toString();
            });
          },
        ),
        RadioListTile(
          title: Text('Kapıda Öde'),
          value: 'Kapıda Öde',
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value.toString();
            });
          },
        ),
        Text(
          "Kapıda Ödemeyi Seçtiyseniz Satın Alabilirsiniz",
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  TextFormField cardTextField() {
    return TextFormField(
      controller: _card,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Kart Bilgileriniz',
      ),
    );
  }


  Widget cardRadioButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Taksit Seçenekleri :",
          style: TextStyle(fontSize: 18),
        ),
        RadioListTile(
          title: Text('2'),
          value: '2',
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value.toString();
            });
          },
        ),
        RadioListTile(
          title: Text('4'),
          value: '4',
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value.toString();
            });
          },
        ),
        RadioListTile(
          title: Text('6'),
          value: '6',
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value.toString();
            });
          },
        ),
      ],
    );
  }

  Center buyButton() {
    return Center(
      child: TextButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Tebrikler !"),
                  content: Text("Satın Alma Başarılı!"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Ana_Menu(),
                            ),
                          );
                        },
                        child: Text("Tamam"))
                  ],
                );
              });
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[400],
          ),
          child: Center(
            child: customText("Satın Al", Colors.black),
          ),
        ),
      ),
    );
  }

  Widget customSizedBox() => SizedBox(
    height: 20,
  );

  Widget customText(String text, Color color) => Text(
    text,
    style: TextStyle(color: color),
  );

  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
    );
  }
}
