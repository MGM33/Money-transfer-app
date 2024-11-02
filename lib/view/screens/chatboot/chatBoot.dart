import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/chatBoot_Controller.dart';
import 'package:gradp2p/core/constants/routes.dart';

class ChatScreen extends StatelessWidget {
  final ChatbootControllerImp chatController = Get.put(ChatbootControllerImp());
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 32,
            color: Colors.black54,
          ),
          onPressed: () {
            Get.toNamed(AppRoute.Bottomnavbar);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: chatController.messages.length,
                itemBuilder: (context, index) {
                  var message = chatController.messages[index];
                  var content = message['content'] ?? ''; // Add null check
                  bool isUserMessage = message['role'] == 'user';
                  return Align(
                    alignment: isUserMessage
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: isUserMessage
                            ? Colors.blueAccent
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        content,
                        style: TextStyle(
                            color: isUserMessage ? Colors.white : Colors.black),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (textController.text.isNotEmpty) {
                      chatController.sendMessage(textController.text);
                      textController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
