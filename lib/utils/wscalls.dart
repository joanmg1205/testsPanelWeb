import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:cross_file/cross_file.dart';
import 'dart:convert';
import 'dart:html';

class Wscalls {
  static String baseUrl = 'https://wallets.snowcode.app';

  static Future<String> updateClass({
    XFile? imageLogo,
    //required List<int> imageHeroActions,
    //List<XFile>? imagesHero,
    XFile? imageHero,
    XFile? imageWordMark,
    required String backgroundColor,
    required String pointsStart,
    required String pointsLabel,
    required String title,
    required String subtitle,
    required String stamp,
    required String id,
  }) async {
    final url = Uri.parse('$baseUrl/updateClass');

    try {
      var request = http.MultipartRequest('POST', url);

      request.headers['Content-Type'] = 'multipart/form-data';

      if (imageLogo != null) {
        request.files.add(http.MultipartFile.fromBytes('imageLogo', await imageLogo.readAsBytes(), filename: 'image_logo.jpg'));
      }
      if (imageHero != null) {
        request.files.add(http.MultipartFile.fromBytes('imageHero', await imageHero.readAsBytes(), filename: 'image_logo.jpg'));
      }
      if (imageWordMark != null) {
        request.files.add(http.MultipartFile.fromBytes('imageWordMark', await imageWordMark.readAsBytes(), filename: 'image_logo.jpg'));
      }
      request.fields['backgroundColor'] = backgroundColor;
      request.fields['pointsStart'] = pointsStart;
      request.fields['pointsLabel'] = pointsLabel;
      request.fields['title'] = title;
      request.fields['subtitle'] = subtitle;
      request.fields['idCompany'] = id;
      request.fields['stamp'] = stamp;

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == 'success') {
          return 'Update successful';
        } else {
          throw Exception(jsonResponse['message']);
        }
      } else {
        throw Exception('Failed to update class');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }

  static Future<Map<String, dynamic>> getClass(String idClass) async {
    final url = Uri.parse('$baseUrl/getClass?idClass=$idClass');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body.substring(0, response.body.length));
        return jsonResponse;
      } else {
        throw Exception('Failed to load class: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }

  static Future<String> createClass(String companyName, String phone, String passTypeIdentifier) async {
    // Prepare the JSON payload
    Map<String, dynamic> data = {
      'name': companyName,
      'phone': phone,
      'passTypeIdentifier': passTypeIdentifier,
    };

    // Convert data to JSON
    String jsonData = jsonEncode(data);

    try {
      // Make the HTTP POST request
      final response = await http.post(
        Uri.parse('$baseUrl/createClass'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonData,
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, return the company ID
        return response.body;
      } else {
        // If the server returns an error response, throw an exception
        throw Exception('Failed to create company: ${response.reasonPhrase}');
      }
    } catch (e) {
      // Handle any errors that occurred during the request
      throw Exception('Failed to create company: $e');
    }
  }

  static Future<String> createForm(String idCompany, String colorPrimary, String colorSecondary, String colorTertiary, String colorQuaternary, String template) async {
    // Prepare the JSON payload
    Map<String, dynamic> data = {
      'idCompany': idCompany,
      'colorPrimary': colorPrimary,
      'colorSecondary': colorSecondary,
      'colorTertiary': colorTertiary,
      'colorQuaternary': colorQuaternary,
      'template': template,
    };

    // Convert data to JSON
    String jsonData = jsonEncode(data);

    try {
      // Make the HTTP POST request
      final response = await http.post(
        Uri.parse('$baseUrl/createForm'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonData,
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, return the success message
        return response.body;
      } else {
        // If the server returns an error response, throw an exception
        throw Exception('Failed to create form: ${response.reasonPhrase}');
      }
    } catch (e) {
      // Handle any errors that occurred during the request
      throw Exception('Failed to create form: $e');
    }
  }
}
