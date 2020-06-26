import 'package:meta/meta.dart';

import '../common.dart';

class UserRepository {
  RestClient client;

  UserRepository() {
    this.client = RestClient();
  }

  Future<String> login({
    @required String username,
    @required String password,
  }) async {
    await this.client.login(username, password);
    return "Success";
  }

  bool isLoggedIn() {
    return this.client == null;
  }

  Future<void> logout() async {
    this.client = null;
  }
}
