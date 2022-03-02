import 'package:proxyprovider/application/services/users_service.dart';

class GreetingService {

  GreetingService({ UserService userService})
  : _userService = userService ;

  UserService _userService ;

  String get greeting => "Hello, ${_userService.user.username}";
}