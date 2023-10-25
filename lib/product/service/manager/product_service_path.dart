// Project service path
// ignore_for_file: public_member_api_docs

enum ProductServicePath {
  userV1('user'),
  posts('posts'),
  usersV2('v2/users');

  final String value;
  const ProductServicePath(this.value);

  /// [withQuery] is add query to path
  ///
  /// Example: users/123
  String withQuery(String value) {
    return '${this.value}/$value';
  }
}
