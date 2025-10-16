import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/coin_list/screens/coin_list_screen.dart';
import 'package:http/http.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CoinListScreen(),
    );
  }
}
