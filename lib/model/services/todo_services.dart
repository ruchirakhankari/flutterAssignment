import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutterassignment/model/todo.dart';
import '../Featured.dart';
import '../Popular.dart';

class TopService {
  Future<List<Top>> getAll() async {
    const url = 'https://jsonplaceholder.typicode.com/photos';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final top = json.map((e) {
        return Top(
            albumId: e['albumId'],
            id: e['id'],
            title: e['title'],
            url: e['url'],
            thumbnailUrl: e['thumbnailUrl']);
      }).toList();
      return top;
    }
    return [];
    // throw "Something went wrong";
  }

  Future<List<Popular>> getAllpopular() async {
    const url = 'https://picsum.photos/v2/list?page=2&limit=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final popular = json.map((e) {
        return Popular(
          id: e['id'],
          author: e['author'],
          width: e['width'],
          height: e['height'],
          url: e['url'],
          download_url: e['download_url'],
        );
      }).toList();
      return popular;
    }
    return [];
    // throw "Something went wrong";
  }

  Future<List<Featured>> getAllfeatured() async {
    const url = 'https://picsum.photos/v2/list';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    print("Response>>>>>>>>>${response.toString()}");
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final featured = json.map((e) {
        return Featured(
          id: e['id'],
          author: e['author'],
          width: e['width'],
          height: e['height'],
          url: e['url'],
          download_url: e['download_url'],
        );
      }).toList();
      return featured;
    }
    return [];
    // throw "Something went wrong";
  }
}


