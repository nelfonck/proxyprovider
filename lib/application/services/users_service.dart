
import 'package:proxyprovider/domain/entities/user_data.dart';

class UserService {

  User _user ;

  User get user => _user ;
  
  setUser(User user) {
    _user = user ;
  }

  
}