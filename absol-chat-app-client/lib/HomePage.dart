import 'package:absol_chat_app_client/ChatPage.dart';
import 'package:absol_chat_app_client/constants.dart';
import 'package:absol_chat_app_client/services/RandomChat.service.dart';
import 'package:absol_chat_app_client/widgets/error_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:localstorage/localstorage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final LocalStorage storage = LocalStorage('localstorage_app');

  static const routeName = '/';

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  late TextEditingController _nameController;
  bool _randomButtonLoading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FutureBuilder(
        future: widget.storage.ready,
        builder: (BuildContext context, snapshot) {
          if (snapshot.data == true) {
            String _name = widget.storage.getItem('name');

            _nameController.text = _name;

            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Absol Chat App",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 45,
                          color: theme.indicatorColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 250,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hello, ",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 30,
                                color: theme.indicatorColor),
                          ),
                          SizedBox(
                            width: 150,
                            child: TextField(
                              controller: _nameController,
                              maxLength: 10,
                              decoration: const InputDecoration(
                                  isDense: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 0)),
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 30,
                                  color: theme.indicatorColor),
                              onChanged: (String value) async {
                                await widget.storage.setItem('name', value);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: theme.primaryColor),
                        onPressed: () {
                          if (_randomButtonLoading) return;

                          setState(() {
                            _randomButtonLoading = true;
                          });
                          postEnterRandomChat(widget.storage)
                              .then((response) => {
                                    if (response.status != 200)
                                      {errorAlert(context)}
                                    else
                                      {
                                        Navigator.pushNamed(
                                            context, ChatPage.routeName,
                                            arguments: RandomChatDTO(
                                                uuid: response.uuid,
                                                name: response.name,
                                                roomId: response.roomId))
                                      },
                                    setState(() {
                                      _randomButtonLoading = false;
                                    })
                                  })
                              .catchError((error) => {
                                    errorAlert(context),
                                    setState(() {
                                      _randomButtonLoading = false;
                                    })
                                  });
                        },
                        child: _randomButtonLoading
                            ? const SpinKitRing(
                                color: Colors.white,
                                size: 30,
                              )
                            : const Text(
                                'Random Chat',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                      ),
                    )
                  ],
                ),
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
