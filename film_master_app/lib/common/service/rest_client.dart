import 'package:oauth2/oauth2.dart' as oauth2;

class RestClient {
  final clientId = "my-trusted-client";
  final clientSecret = "secret";
  final authUrl = Uri.parse("http://localhost:8080/user-service/oauth/token");
  var client;

  Future<void> login(String username, String password) async {
    this.client = await oauth2.resourceOwnerPasswordGrant(
        authUrl, username, password,
        identifier: clientId, secret: clientSecret);
  }
}
