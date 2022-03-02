import 'package:flutter/material.dart';
import 'package:proxyprovider/domain/entities/user_data.dart';

class LogginForm extends StatefulWidget {

   final Function(User) onFormSaved;

   const LogginForm({ Key key, this.onFormSaved }) : super(key: key);


  @override
  _LogginFormState createState() => _LogginFormState();
}

class _LogginFormState extends State<LogginForm> {

   bool _autoValidate ;

   GlobalKey<FormState> _formKey ;

   TextEditingController _userController ;
   TextEditingController _passwordController ;

  @override
  void initState() {
    super.initState();
    _autoValidate = false ;
    _formKey = GlobalKey<FormState>();
    _userController = TextEditingController();
    _passwordController = TextEditingController();


  }

  @override
  void dispose() {
    super.dispose();
    _userController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate:  _autoValidate,
       child: Column(
         children: [
           TextFormField(
             controller: _userController,
             decoration: const InputDecoration(
               labelText: "Username"
             ),
             validator: ( String value ) =>  _validateFormField(value, "UserName")
           ),
           TextFormField(
             controller: _passwordController,
             decoration: const InputDecoration(
               labelText: "Password"
             ),
             validator: ( String value ) =>  _validateFormField(value, "Password")
           ),
           ElevatedButton(
             onPressed: _onLoginPressed,
             child: const Text("Login")
          )
         ],
       ),
      
    );
  }

  void _onLoginPressed(){
    setState(() {
      _autoValidate = true ;
    });

    if (_formKey.currentState.validate()){
      widget.onFormSaved(
        User(
          username: _userController.text
        )
      );
    }
  }

  String _validateFormField(String value, String fieldName){
    if ( value.isEmpty ){
      return "$fieldName cannot be empty";
    }
    return null ;
  }
}