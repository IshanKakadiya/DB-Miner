// ignore_for_file: unused_local_variable, body_might_complete_normally_nullable

import 'dart:convert';
import 'package:animal_biograpy_app/model/api.dart';
import 'package:http/http.dart' as http;

class ImageAPIHelper {
  ImageAPIHelper._();
  static final ImageAPIHelper imageAPIHelper = ImageAPIHelper._();

  Future<List<AnimalAndImages>?> getImage({required String name}) async {
    String uri = "https://api.api-ninjas.com/v1/animals?name=$name";
    String uri2 = "https://source.unsplash.com/random/?$name,wild animal";

    http.Response res2 = await http.get(
      Uri.parse(uri2),
    );

    http.Response res = await http.get(
      Uri.parse(uri),
      headers: {'X-Api-Key': "oaqzVwLu9nEI/OvnhS4SrA==QYbFg5sjhsgqKuxm"},
    );

    if (res.statusCode == 200) {
      List decodeData = jsonDecode(res.body);

      List<AnimalAndImages> animalData =
          decodeData.map((e) => AnimalAndImages.formMap(data: e)).toList();

      animalData[0].image = uri2;

      return animalData;
    }
  }
}
