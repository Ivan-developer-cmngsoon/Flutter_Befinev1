import 'package:befine_app/models/user_model.dart';

///servicio para guardar temporalmente a user
///Solo para pruebas, no almacena datos
class SessionService {
  static User? _currentUser;

  static void login (User user){
    _currentUser = user;
  }

  static User? get currentUser => _currentUser;

  static void logout (){
    _currentUser = null;
  }

  static bool get isLoggedIn => _currentUser != null;
}