import 'dart:convert';

import 'package:absol_chat_app_client/constants.dart';
import 'package:absol_chat_app_client/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:localstorage/localstorage.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  final LocalStorage storage = LocalStorage('localstorage_app');

  static const routeName = '/chatPage';

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late SocketIO socketIO;
  late List<String> messages;
  late double height, width;
  late TextEditingController textController;
  late ScrollController scrollController;

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
    socketIO.subscribe('receive_message', (jsonData) {
      Map<String, dynamic> data = json.decode(jsonData);
      setState(() => messages.add(data['message']));
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 600),
        curve: Curves.ease,
      );
    });
    socketIO.connect();
    super.initState();
  }

  Widget buildSingleMessage(int index) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.only(top: 10, bottom: 10.0, left: 20.0),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          messages[index],
          style: const TextStyle(color: Colors.white, fontSize: 15.0),
        ),
      ),
    );
  }

  Widget buildMessageList() {
    return SizedBox(
      height: height * 0.8,
      width: width,
      child: ListView.builder(
        controller: scrollController,
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          return buildSingleMessage(index);
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

  Widget buildSendButton() {
    final theme = Theme.of(context);
    return FloatingActionButton(
      backgroundColor: theme.primaryColor,
      onPressed: () {
        if (textController.text.isNotEmpty) {
          socketIO.sendMessage(
              'send_message', json.encode({'message': textController.text}));
          setState(() => messages.add(textController.text));
          textController.text = '';
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 600),
            curve: Curves.ease,
          );
        }
      },
      child: const Icon(
        Icons.send,
        size: 30,
      ),
    );
  }

  Widget buildInputArea() {
    return Container(
      height: height * 0.1,
      width: width,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          buildChatInput(),
          buildSendButton(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return FutureBuilder(
        future: widget.storage.ready,
        builder: (BuildContext context, snapshot) {
          if (snapshot.data == true) {
            return Scaffold(
              appBar: appBarWidget(context, 'Please Wait', widget.storage),
              body: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SingleChildScrollView(
                      child: Column(
                    children: [
                      buildMessageList(),
                      SizedBox(height: height * 0.1),
                    ],
                  )),
                  SizedBox(height: height * 0.1),
                  buildInputArea(),
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