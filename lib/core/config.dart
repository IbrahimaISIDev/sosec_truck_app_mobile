import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String get openAiApiKey => dotenv.env['OPEN_AI_API_KEY'] ?? '';
}