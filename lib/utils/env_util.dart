import 'dart:io' show Platform;
import 'package:flutter_config/flutter_config.dart' show FlutterConfig;

class EnvUtil {
  static final String? _uriApi = Platform.isIOS
      ? FlutterConfig.get('URI_FLUTTER_DELIVERY_SERVER_IOS')
      : FlutterConfig.get('URI_FLUTTER_DELIVERY_SERVER_ANDROID');
  static final String? _cloudName = FlutterConfig.get('CLOUD_NAME');
  static final String? _uploadPreset = FlutterConfig.get('UPLOAD_PRESET');

  static String get cloudName => _cloudName ?? '';
  static String get uploadPreset => _uploadPreset ?? '';
  static String get uriApi => _uriApi ?? '';
}
