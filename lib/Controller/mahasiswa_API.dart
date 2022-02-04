import 'dart:convert';
import 'package:mahasiswa_api/Model/mahasiswa_model.dart';
import 'package:http/http.dart' as http;

class MahasiswaAPI{
  static String baseUrl = 'https://61fbca453f1e34001792c5f1.mockapi.io/api/v1/SIM/';
  static var client = http.Client();

  static Future<List<Mahasiswa>> getMahasiswa() async {
    try {
      final response = await client.get(Uri.parse(baseUrl));
      final body = json.decode(response.body.toString());
      List<Mahasiswa> result = body.map<Mahasiswa>(Mahasiswa.fromJSON).toList();
      print(result[0].name);
      return body.map<Mahasiswa>(Mahasiswa.fromJSON).toList();
    } finally {
      // client.close();
    };
  }

  static Future<void> addMahasiswa({String name = '', String foto = '',
  String nim = '', String jurusan = ''}) async {

    try {
      final response = await client.post(Uri.parse(baseUrl),
        body: {
        "name": name,
        "foto": foto,
        "createdAt": DateTime.now().toIso8601String(),
        "nim": nim,
        "jurusan": jurusan
        }
      );
      final body = json.decode(response.body.toString());
      print(body);
    } finally{
      // client.close();
    };
  }

  static Future<void> editMahasiswa({String? id, String? name, String? foto, String? nim, String? jurusan}) async {
    final response = await client.put(Uri.parse(baseUrl+'$id'),
        body: {
        "name": name,
        "foto": foto,
        "createdAt": DateTime.now().toIso8601String(),
        "nim": nim,
        "jurusan": jurusan
        }
      );
      final body = json.decode(response.body.toString());
      print(body);
    if (response.statusCode == 200) {
     // return Mahasiswa.fromJSON(jsonDecode(response.body));
    };
  }


  static Future<void> deleteMahasiswa(String? id) async {
    final http.Response response = await http.delete(Uri.parse(baseUrl+'$id'));
    if (response.statusCode == 200) {
     // return Mahasiswa.fromJSON(jsonDecode(response.body));
    };
  }
}