import 'dart:convert';

import 'package:pixela/models/ai_model.dart';
import 'package:http/http.dart' as http;

Map<String, String> headers = {
  "accept": "*/*",
  "accept-language": "ru,en;q=0.9,pl;q=0.8,la;q=0.7,cy;q=0.6,tr;q=0.5",
  "content-type":
      "multipart/form-data; boundary=----WebKitFormBoundaryXnfGST3W2kr7Lu1a",
  "sec-ch-ua":
      "\"Chromium\";v=\"122\", \"Not(A:Brand\";v=\"24\", \"YaBrowser\";v=\"24.4\", \"Yowser\";v=\"2.5\"",
  "sec-ch-ua-mobile": "?0",
  "sec-ch-ua-platform": "\"Windows\"",
  "sec-fetch-dest": "empty",
  "sec-fetch-mode": "cors",
  "sec-fetch-site": "same-origin",
  "Referer": "https://avtor24.ru/ai-statja/",
  "Referrer-Policy": "strict-origin-when-cross-origin"
};

class ApiAI {
  String baseUrl = 'https://avtor24.ru/landingAiGpt/sendRequest';
  Future<AiModel> getInfo(String mess) async {
    String body =
        "------WebKitFormBoundaryXnfGST3W2kr7Lu1a\r\nContent-Disposition: form-data; name=\"type\"\r\n\r\nСтатью\r\n------WebKitFormBoundaryXnfGST3W2kr7Lu1a\r\nContent-Disposition: form-data; name=\"staticPageId\"\r\n\r\n12578\r\n------WebKitFormBoundaryXnfGST3W2kr7Lu1a\r\nContent-Disposition: form-data; name=\"subject\"\r\n\r\n${mess}\r\n------WebKitFormBoundaryXnfGST3W2kr7Lu1a--\r\n";
    http.Response res =
        await http.post(Uri.parse(baseUrl), headers: headers, body: body);
    try {
      if (res.statusCode == 200) {
        Map list = json.decode(res.body);

        AiModel respAI = AiModel(
            success: list['success'],
            title: list['title'],
            text: list['responseText']);
        return respAI;
      } else {
        return AiModel(success: false, title: '', text: '');
      }
    } catch (e) {
      return AiModel(success: false, title: '', text: '');
    }
  }
}
