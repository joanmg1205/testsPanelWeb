import 'dart:convert';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:cross_file/cross_file.dart';
import 'package:http/http.dart' as http;

class Wscalls {
  static String baseUrl = 'https://wallets.snowcode.app';

  static Future<String> updateClass({
    required XFile imageLogo,
    required XFile imageHero,
    required XFile imageWordMark,
    required String backgroundColor,
    required String pointsStart,
    required String pointsLabel,
    required String title,
    required String subtitle,
    required String id,
  }) async {
    final url = Uri.parse('$baseUrl/updateClass');

    try {
      final request = http.MultipartRequest('POST', url);
      request.fields['backgroundColor'] = backgroundColor;
      request.fields['pointsStart'] = pointsStart;
      request.fields['pointsLabel'] = pointsLabel;
      request.fields['title'] = title;
      request.fields['subtitle'] = subtitle;
      request.fields['id'] = id;

      var compressedImageLogo = await FlutterNativeImage.compressImage(imageLogo.path, quality: 80);
      var compressedImageLogoFile = await http.MultipartFile.fromPath('image', compressedImageLogo.path);
      request.files.add(compressedImageLogoFile);

      var compressedImageHero = await FlutterNativeImage.compressImage(imageHero.path, quality: 80);
      var compressedImageHeroFile = await http.MultipartFile.fromPath('image', compressedImageHero.path);
      request.files.add(compressedImageHeroFile);

      var compressedImageWordMark = await FlutterNativeImage.compressImage(imageWordMark.path, quality: 80);
      var compressedImageWordMarkFile = await http.MultipartFile.fromPath('image', compressedImageWordMark.path);
      request.files.add(compressedImageWordMarkFile);

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

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
        final jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else {
        throw Exception('Failed to load class');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }

  static Future<String> createCompany(String companyName, String phone, String passTypeIdentifier) async {
    try {
      // Make the HTTP POST request
      final response = await http.post(
        Uri.parse('$baseUrl/create_company/$companyName/$phone/$passTypeIdentifier'),
      );
      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, return the company ID
        return response.body;
      } else {
        // If the server returns an error response, throw an exception
        throw Exception('Failed to create company: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error creating company: $e');
    }
  }
}
