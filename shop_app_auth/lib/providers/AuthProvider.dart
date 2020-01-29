import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/HttpException.dart';

class AuthProvider with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  bool get isAuthenticated {
    return this.token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return this._token;
    }

    return null;
  }

  String get userId {
    return this.token != null ? this._userId : null;
  }

  Future<void> signUp(String email, String password) async {
    try {
      const url =
          'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBzzeJNfO-gFbmAJwJCzLl2A0ym447sgmM';

      final http.Response response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));

      final responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      print(json.decode(response.body));
    } catch (e) {
      throw (e);
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      const url =
          'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBzzeJNfO-gFbmAJwJCzLl2A0ym447sgmM';

      final http.Response response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));

      final responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }

      this._token = responseData['idToken'];
      this._userId = responseData['localId'];
      this._expiryDate = DateTime.now().add(
        Duration(seconds: int.parse(responseData['expiresIn'])),
      );

      notifyListeners();
    } catch (e) {
      print(e);
      throw (e);
    }
  }
}
