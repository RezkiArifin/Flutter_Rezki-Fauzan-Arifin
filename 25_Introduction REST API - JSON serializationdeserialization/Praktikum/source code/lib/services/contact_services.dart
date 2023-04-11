import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/contact_info_response.dart';
import '../models/contact_response.dart';

class ContactServices {
  Future<List<ContactResponse>> getContact() async {
    final response = await Dio().get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts');

    List<ContactResponse> contacts = (response.data as List)
        .map(
          (e) => ContactResponse(
            id: e["id"],
            name: e["name"],
            phone: e["phone"],
          ),
        )
        .toList();

    return contacts;
  }

  Future<ContactInfoResponse> getInfoContact(
    String idContact,
  ) async {
    final response = await Dio().get(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/$idContact',
    );

    return ContactInfoResponse.fromJson(response.data);
  }

  Future<void> postContact(
    BuildContext context, {
    required String name,
    required String phone,
  }) async {
    final response = await Dio().post(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
      data: {
        "name": name,
        "phone": phone,
      },
    );
    return;
  }

  Future<void> putContact({
    required String name,
    required String phone,
    required String idContact,
  }) async {
    final response = await Dio().put(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/$idContact',
      data: {
        "name": name,
        "phone": phone,
      },
    );
    // print(response.data);
    // print(response.statusCode);
    return;
  }
}
