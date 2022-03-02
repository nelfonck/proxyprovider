import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxyprovider/application/services/cart_service.dart';
import 'package:proxyprovider/application/services/greeting_service.dart';
import 'package:proxyprovider/application/services/users_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  static Route<dynamic> route() => MaterialPageRoute(builder: (context) => const HomePage());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home')
      ),
      body: Center(
        child: Text(
          Provider.of<CartService>(context).cartGreetin
        )
      )
    );
  }
}