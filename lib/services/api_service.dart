import 'dart:convert';

import 'package:flutter_clock/model/world_time_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const _baseUrl = 'https://worldtimeapi.org/api/timezone/';

  static Future<WorldTimeModel> getTimeInfo(String region) async {
    final url = Uri.parse('$_baseUrl/$region');
    final res = await http.get(url);

    if (res.statusCode != 200) {
      throw Error();
    }

    final info = jsonDecode(res.body);
    return WorldTimeModel.fromJSON(info);
  }
}
