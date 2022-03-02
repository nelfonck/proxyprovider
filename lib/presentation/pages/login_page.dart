import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxyprovider/application/services/users_service.dart';
import 'package:proxyprovider/domain/entities/user_data.dart';
import 'package:proxyprovider/presentation/pages/home_page.dart';
import 'package:proxyprovider/presentation/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text("Login"), ),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogginForm(
              onFormSaved: (User user ) { 
                Provider.of<UserService>(context, listen: false).setUser(user);
               
                //Navigate to a HomePage
                Navigator.of(context).pushReplacement(HomePage.route());
               },

            ),
          ],
        ),
      )
    );
  }
}