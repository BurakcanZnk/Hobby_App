import 'package:Hobby_App/Giris_Yap/Giris_Yap.dart';
import 'package:flutter/material.dart';
import 'package:Hobby_App/Genel_Klasor/Detaylar/Alisveris_Sepeti.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Hobby_App/Genel_Klasor/Detaylar/Metin.dart';
import 'package:firebase_auth/firebase_auth.dart';

  class Kayit_Ol extends StatefulWidget {
  const Kayit_Ol({Key? key}) : super(key: key);

  @override
  _Kayit_OlState createState() => _Kayit_OlState();
}

  class _Kayit_OlState extends State<Kayit_Ol> {
  late String email, fullname, password;
  final formKey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
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
                builder: (context) => Giris_Yap(),
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
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
                          fullNameTextField(),
                          customSizedBox(),
                          emailTextField(),
                          customSizedBox(),
                          passwordTextField(),
                          customSizedBox(),
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
      "BCZ Diecast'a \nHoşgeldiniz Kayıt Olunuz",
      style: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  TextFormField fullNameTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Lütfen Bu Alanı Doldurunuz";
        } else {}
        return null;
      },
      onSaved: (value) {
        fullname = value!;
      },
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Adınız Soyadınız',
      ),
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
        labelText: 'E-Posta Giriniz',
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
        labelText: 'Şifre Giriniz',
      ),
    );
  }
  Center signUpButton() {
    return Center(
      child: TextButton(
        onPressed: signUp,
        child: Container(
          height: 50,
          width: 160,
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

  void signUp() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      try {
        var userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        formKey.currentState!.reset();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:
          Text("Kayıt Başarılı"))
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Giris_Yap(),
          ),
        );
      } catch (e) {
        print(e.toString());
      }
    } else {
    }
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