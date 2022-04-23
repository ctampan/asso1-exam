class Constants {
  static const serverUrl = 'https://absol-chat-app-server.herokuapp.com';
// static const localUrl = 'http://localhost:8080';
}

class RandomChatDTO {
  const RandomChatDTO(
      {required this.uuid, required this.name, required this.roomId});

  final String uuid;
  final String name;
  final String roomId;
}
