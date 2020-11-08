import 'dart:convert';

import 'package:flutter/services.dart';

class AppConfig {
  final String tokenUrl;
  final String refreshTokenUrl;
  final String validateAccessTokenUrl;
  final String accessTokenKey;
  final String refreshTokenKey;
  final String userUrl;

  AppConfig(
      {this.tokenUrl,
        this.refreshTokenUrl,
      this.validateAccessTokenUrl,
      this.accessTokenKey,
      this.refreshTokenKey,
      this.userUrl});

  static Future<AppConfig> getConfig() async {
    final content = await rootBundle.loadString('assets/config.json');
    final json = jsonDecode(content);
    return new AppConfig(
        tokenUrl: json['tokenUrl'],
        refreshTokenUrl: json['refreshAccessTokenUrl'],
        validateAccessTokenUrl: json['validateAccessTokenUrl'],
        accessTokenKey: json['accessTokenKey'],
        refreshTokenKey: json['refreshTokenKey'],
        userUrl: json['userUrl']);
  }
}