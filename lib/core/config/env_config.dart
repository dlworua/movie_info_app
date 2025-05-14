import 'package:flutter_dotenv/flutter_dotenv.dart';

/// 환경 설정을 관리하는 클래스
class EnvConfig {
  /// TMDB API 키
  static String get apiKey {
    return '8c247ea0b4b56ed2ff7d41c9a833aa77'; // TMDB API 키
  }

  /// TMDB API 기본 URL
  static String get baseUrl {
    return 'https://api.themoviedb.org/3'; // TMDB API 기본 URL
  }

  /// 환경 설정 초기화
  static Future<void> init() async {
    try {
      await dotenv.load(fileName: '.env');
    } catch (e) {
      // .env 파일이 없어도 계속 진행
    }
  }
}
