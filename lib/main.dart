import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxyprovider/application/services/cart_service.dart';
import 'package:proxyprovider/application/services/greeting_service.dart';
import 'package:proxyprovider/application/services/users_service.dart';
import 'package:proxyprovider/presentation/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider( create: ( _ ) => UserService(),),
        ProxyProvider<UserService, GreetingService>(
          update: (BuildContext context, UserService userService, GreetingService greetingService) => GreetingService(
            userService: userService
          )
        ),
        ProxyProvider2<UserService, GreetingService, CartService>(
          update: (BuildContext context, UserService userService, GreetingService greetingService, CartService previous)
          => CartService(
            userService: userService,
            greetingService: greetingService
          )
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  const LoginPage(),
      ),
    );
  }
}

