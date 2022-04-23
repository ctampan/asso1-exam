import 'dart:async';
import 'dart:convert';

import 'package:absol_chat_app_client/constants.dart';
import 'package:absol_chat_app_client/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  final LocalStorage storage = LocalStorage('localstorage_app');

  static const routeName = '/chatPage';

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _MessageBody {
  const _MessageBody(
      {required this.message, required this.sender, required this.roomId});

  final String message;
  final String sender;
  final String roomId;
}

class _ChatPageState extends State<ChatPage> {
  late SocketIO socketIO;
  late List<_MessageBody> messages;
  String otherName = '';
  late double height, width;
  late double keyboardHeight;
  late TextEditingController textController;
  late ScrollController scrollController;
  late String uuid;
  late String name;
  late String roomId;
  bool initialRender = true;

  scrollToBottom() {
    if (scrollController.hasClients) {
      Future.delayed(const Duration(milliseconds: 500)).then((value) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
        );
      });
    }
  }

  @override
  void initState() {
    messages = [];
    textController = TextEditingController();
    scrollController = ScrollController();

    socketIO = SocketIOManager().createSocketIO(
      Constants.serverUrl,
      '/',
    );
    socketIO.init();

    widget.storage.ready.then((ready) {
      if (ready) {
        String name = widget.storage.getItem('name');
        String uuid = widget.storage.getItem('uuid');
        String roomId =
            json.decode(widget.storage.getItem('currentRoom'))['roomId'];

        socketIO.subscribe('receive_message_' + roomId, (jsonData) {
          Map<String, dynamic> data = json.decode(jsonData);
          setState(() => messages.add(_MessageBody(
              message: data['message'],
              sender: data['sender'],
              roomId: data['roomId'])));
          scrollToBottom();
        });

        socketIO.subscribe('participant_' + roomId, (jsonData) {
          Map<String, dynamic> data = json.decode(jsonData);
          if (data['uuid'] != uuid) {
            String type = data['type'];
            setState(() {
              otherName = type == 'join' ? data['otherName'] : '';
              messages.add(_MessageBody(
                  message: data['otherName'] +
                      ' has ' +
                      (type == 'join' ? 'joined' : 'leave') +
                      ' the chat',
                  sender: 'system',
                  roomId: roomId));
            });
            scrollToBottom();
          }
        });

        socketIO.connect();

        socketIO.sendMessage(
            'join_room',
            json.encode({
              'otherName': name,
              'roomId': roomId,
              'uuid': uuid,
              'type': 'join'
            }));
      }
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (initialRender) {
      final args = ModalRoute.of(context)!.settings.arguments as RandomChatDTO;

      setState(() {
        uuid = args.uuid;
        name = args.name;
        roomId = args.roomId;
        initialRender = false;
      });

      final url = Uri.parse(
          Constants.serverUrl + '/random-chat/' + roomId + '/participants');
      http.get(url).then((response) {
        Map<String, dynamic> data = json.decode(response.body);

        if (data != {}) {
          var other =
              data['participants'].where((person) => person['uuid'] != uuid);

          setState(() {
            otherName = other.isEmpty ? otherName : other.first['name'];
          });
        }
      });
    }

    super.didChangeDependencies();
  }

  Widget buildSingleMessage(int index, LocalStorage storage) {
    String uuid = storage.getItem('uuid');
    String messageSender = messages[index].sender;

    return Container(
      alignment: messageSender == 'system'
          ? Alignment.center
          : uuid == messageSender
              ? Alignment.centerRight
              : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.only(
            top: 10, bottom: 10.0, left: 20.0, right: 20.0),
        decoration: BoxDecoration(
          color: messageSender == 'system'
              ? Colors.blueGrey
              : uuid == messageSender
                  ? Colors.blueAccent
                  : Colors.deepPurple,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          messages[index].message,
          style: const TextStyle(color: Colors.white, fontSize: 15.0),
        ),
      ),
    );
  }

  Widget buildMessageList(LocalStorage storage) {
    return SizedBox(
      height: (height * 0.8) - (keyboardHeight),
      width: width,
      child: ListView.builder(
        controller: scrollController,
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          return buildSingleMessage(index, storage);
        },
      ),
    );
  }

  Widget buildChatInput() {
    return Container(
      width: width * 0.7,
      padding: const EdgeInsets.all(2.0),
      margin: const EdgeInsets.only(left: 40.0),
      child: TextField(
        decoration: const InputDecoration.collapsed(
          hintText: 'Send a message...',
        ),
        controller: textController,
      ),
    );
  }

  Widget buildSendButton(LocalStorage storage) {
    final theme = Theme.of(context);
    String uuid = storage.getItem('uuid');
    String roomId = json.decode(storage.getItem('currentRoom'))['roomId'];

    return FloatingActionButton(
      backgroundColor: theme.primaryColor,
      onPressed: () {
        if (textController.text.isNotEmpty) {
          socketIO.sendMessage(
              'send_message',
              json.encode({
                'message': textController.text,
                'sender': uuid,
                'roomId': roomId
              }));
          setState(() => messages.add(_MessageBody(
              message: textController.text, sender: uuid, roomId: roomId)));
          textController.text = '';
          scrollToBottom();
        }
      },
      child: const Icon(
        Icons.send,
        size: 30,
      ),
    );
  }

  Widget buildInputArea(LocalStorage storage) {
    return Container(
      height: height * 0.1,
      width: width,
      color: Colors.white70,
      child: Row(
        children: <Widget>[
          buildChatInput(),
          buildSendButton(storage),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return FutureBuilder(
        future: widget.storage.ready,
        builder: (BuildContext context, snapshot) {
          if (snapshot.data == true) {
            String name = widget.storage.getItem('name');
            String uuid = widget.storage.getItem('uuid');
            String roomId =
                json.decode(widget.storage.getItem('currentRoom'))['roomId'];

            return Scaffold(
              appBar: appBarWidget(
                  context,
                  otherName,
                  widget.storage,
                  () => {
                        socketIO.sendMessage(
                            'leave_room',
                            json.encode({
                              'otherName': name,
                              'roomId': roomId,
                              'uuid': uuid,
                              'type': 'leave'
                            }))
                      }),
              body: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SingleChildScrollView(
                      child: Column(
                    children: [
                      buildMessageList(widget.storage),
                      SizedBox(
                        height: height * 0.1,
                      )
                    ],
                  )),
                  buildInputArea(widget.storage),
                ],
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: Column(
                  children: [
                    SpinKitFoldingCube(
                      color: theme.indicatorColor,
                      size: 50,
                    )
                  ],
                ),
              ),
            );
          }
        });
  }
}