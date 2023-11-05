
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url}) async
  {

    return await  http.get(Uri.parse(url));


  }
}