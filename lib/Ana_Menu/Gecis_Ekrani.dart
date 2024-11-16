import 'package:flutter/material.dart';
import 'package:Hobby_App/Ana_Menu/Ana_Ekran.dart';
import 'dart:async';

class Gecis_Ekrani extends StatefulWidget {
  const Gecis_Ekrani({Key? key}) : super(key: key);

  @override
  State<Gecis_Ekrani> createState() => _Gecis_EkraniState();
}

class _Gecis_EkraniState extends State<Gecis_Ekrani> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2), vsync: this,)
    ..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
      parent: _controller, curve: Curves.fastOutSlowIn);

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) =>
              Ana_Menu()), (Route<dynamic> route) => false);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[400],
      child: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Image.asset(
            "assets/Resimler/Logo.png",
          ),
        ),
      ),
    );
  }
}
