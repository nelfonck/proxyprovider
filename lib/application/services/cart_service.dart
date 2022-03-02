
import 'package:proxyprovider/application/services/greeting_service.dart';
import 'package:proxyprovider/application/services/users_service.dart';
import 'package:proxyprovider/domain/entities/user_data.dart';

class CartService {
  CartService(
    {
      GreetingService greetingService,
      UserService userService
    }
  ) : _greetingService = greetingService,
      _userService = userService ;

  final GreetingService _greetingService;
  final UserService _userService;

  String get cartGreetin => _greetingService.greeting;
  User get user => _userService.user;

}