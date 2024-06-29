import 'database_helper.dart';
import 'user.dart';

class AuthService {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<bool> registerUser(
      String username, String password, String birthDate) async {
    try {
      User user =
          User(username: username, password: password, birthDate: birthDate);
      int id = await _dbHelper.insertUser(user.toMap());
      return id != 0;
    } catch (e) {
      print("Error in registerUser: $e");
      return false;
    }
  }

  Future<bool> loginUser(String username, String password) async {
    try {
      Map<String, dynamic>? user = await _dbHelper.getUser(username, password);
      return user != null;
    } catch (e) {
      print("Error in loginUser: $e");
      return false;
    }
  }
}
