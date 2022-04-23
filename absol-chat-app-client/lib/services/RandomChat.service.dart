import 'dart:convert';

import 'package:absol_chat_app_client/constants.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:uuid/uuid.dart';

class EnterDTO {
  const EnterDTO({required this.status, required this.uuid, required this.name, required this.roomId});

  final int status;
  final String uuid;
  final String name;
  final String roomId;
}

Future<EnterDTO> postEnterRandomChat(LocalStorage storage) async {
  final url = Uri.parse(Constants.serverUrl + '/random-chat/join');

  var uuid = const Uuid().v4();

  storage.setItem('uuid', uuid);

  String name = storage.getItem('name') ?? '';

  var response = await http.post(url, body: {'uuid': uuid, 'name': name});

  String roomId = '';

  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);

    roomId = data['roomId'];

    storage.setItem('currentRoom',
        json.encode({'type': 'random', 'roomId': roomId}));
  }

  return EnterDTO(status: response.statusCode, uuid: uuid, name: name, roomId: roomId);
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
