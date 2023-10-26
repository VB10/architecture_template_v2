import 'package:architecture_template_v2/product/service/interface/authenction_operation.dart';
import 'package:gen/gen.dart';
import 'package:mockito/mockito.dart';

final class LoginServiceMock extends Mock implements AuthenticationOperation {
  @override
  Future<List<User>> users() async {
    return [
      User(body: 'body1', id: 1, title: 'title', userId: 1),
      User(body: 'body2', id: 2, title: 'title2', userId: 2),
      User(body: 'body3', id: 3, title: 'title3', userId: 3),
    ];
  }
}
