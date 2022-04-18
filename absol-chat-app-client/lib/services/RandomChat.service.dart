import 'dart:convert';

import 'package:absol_chat_app_client/constants.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:uuid/uuid.dart';

Future<int> postEnterRandomChat(LocalStorage storage) async {
  final url = Uri.parse(Constants.serverUrl + '/random-chat/join');

  var uuid = const Uuid().v4();

  storage.setItem('uuid', uuid);

  String name = storage.getItem('name') ?? '';

  var response = await http.post(url, body: {'uuid': uuid, 'name': name});

  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);

    storage.setItem('currentRoom',
        json.encode({'type': 'random', 'roomId': data['roomId']}));
  }

  return response.statusCode;
}

Future<int> postLeaveRandomChat(LocalStorage storage) async {
  final url = Uri.parse(Constants.serverUrl + '/random-chat/leave');

  var uuid = storage.getItem('uuid');

  var roomId = json.decode(storage.getItem('currentRoom'))['roomId'];

  var response = await http.post(url, body: {'uuid': uuid, 'roomId': roomId});

  if (response.statusCode == 200) {
    storage.deleteItem('currentRoom');
  }

  return response.statusCode;
}
