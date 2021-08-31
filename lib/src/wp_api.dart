import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> fetchWpPosts() async {
  final String url = "http://cannabook.local/index.php/wp-json/wp/v2/posts";

  // Fetch data from url
  final response = await http.get(
    Uri.parse(url),
    headers: {"Accept": "application/json"},
  );

  // Format json data
  var convertedDataToJson = jsonDecode(response.body);

  // Return data on call of function
  return convertedDataToJson;
}

Future fetchWpPostImageUrl(href) async {
  final String url = href;

  // Fetch data from url
  final response = await http.get(
    Uri.parse(url),
    headers: {"Accept": "application/json"},
  );

  // Format json data
  var convertedDataToJson = jsonDecode(response.body);

  // Return data on call of function
  return convertedDataToJson;
}
