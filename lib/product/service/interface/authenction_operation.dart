import 'package:gen/gen.dart';

abstract class AuthenticationOperation {
  Future<List<User>> users();
}
