import 'package:flutter/material.dart';
import 'package:Hobby_App/Ana_Menu/Ana_Ekran.dart';
import 'package:Hobby_App/Genel_Klasor/Detaylar/Alisveris_Sepeti.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Hobby_App/Genel_Klasor/Detaylar/Metin.dart';
import 'package:Hobby_App/Giris_Yap/Kayit_Ol.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Hobby_App/Firebase/Firebase_Ayarlar.dart';

class Giris_Yap extends StatefulWidget {
  const Giris_Yap({Key? key}) : super(key: key);

  @override
  _Giris_YapState createState() => _Giris_YapState();
}

class _Giris_YapState extends State<Giris_Yap> {
  late String email, password;
  final formKey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  final Firebase_Ayarlar authService = Firebase_Ayarlar();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    String topImage = "assets/Resimler/Logo.png";

    return Scaffold(
      appBar: AppBar(
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
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/Iconlar/cart.svg",
              colorFilter: ColorFilter.mode(kTextColor, BlendMode.srcIn),
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
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Container(
                          height: height * 0.25,
                          child: Image.asset(
                            topImage,
                            fit: BoxFit.contain,
                          ),
                        ),
                        titleText(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          customSizedBox(),
                          emailTextField(),
                          customSizedBox(),
                          passwordTextField(),
                          customSizedBox(),
                          signInButton(),
                          signUpButton(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text titleText() {
    return Text(
      "BCZ Diecast'a \nHoşgeldiniz",
      style: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  TextFormField emailTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Lütfen Bu Alanı Doldurunuz";
        }
        return null;
      },
      onSaved: (value) {
        email = value!;
      },
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'E-Postanız',
      ),
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Lütfen Bu Alanı Doldurunuz";
        }
        return null;
      },
      onSaved: (value) {
        password = value!;
      },
      obscureText: true,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Şifreniz',
      ),
    );
  }

  Center signInButton() {
    return Center(
      child: TextButton(
        onPressed: signIn,
        child: Container(
          height: 50,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[400],
          ),
          child: Center(
            child: customText("Giriş Yap", Colors.black),
          ),
        ),
      ),
    );
  }

  void signIn() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final result = await authService.signIn(email, password);
      formKey.currentState!.reset();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:
          Text("Giriş Yapıldı !"))
      );
      if (result == "success") {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Ana_Menu()),
                (route) => false);
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Hata"),
                content: Text(result!),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Tamam"))
                ],
              );
            });
      }
    }
  }


  Center signUpButton() {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Kayit_Ol(),
            ),
          );
        },
        child: Container(
          height: 50,
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[400],
          ),
          child: Center(
            child: customText("Kayıt Ol", Colors.black),
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
