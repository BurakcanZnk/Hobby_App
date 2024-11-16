import 'package:firebase_auth/firebase_auth.dart';

class Firebase_Ayarlar {
  final firebaseAuth = FirebaseAuth.instance;

  Future<String?> forgotPassword(String email) async {
    String? res;
    try {
      final result = await firebaseAuth.sendPasswordResetEmail(email: email);
      print("Mail kutunuzu kontrol ediniz");
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        res = "Mail Zaten Kayitli.";
      }
    }
    return null;
  }

  Future<String?> signIn(String email, String password) async {
    String? res;
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      res = "success";
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "user-not-found":
          res = "E-mail Yanlış";
          break;
        case "wrong-password":
          res = "Şifre Yanlış";
          break;
        default:
          res = "Hesap Bulunamadı Kayıt Olunuz Hesabınız var ise E-Postanızı veya Şifrenizi Kontrol Ediniz. ";
          break;
      }
    }
    return res;
  }
}