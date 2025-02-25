import 'package:chatter_box_flutter/auth/auth_service.dart';
import 'package:chatter_box_flutter/components/chat_bubble.dart';
import 'package:chatter_box_flutter/components/my_textfield.dart';
import 'package:chatter_box_flutter/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {

  final String receiverEmail;
  final String receiverID;

  ChatPage({
    super.key,
    required this.receiverEmail,
    required this.receiverID,
  });

  // text controller
  final TextEditingController _messageController = TextEditingController();

  // chat & auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  // send message
  void sendMessage()async{
    if(_messageController.text.isNotEmpty){
      // send the message
      await _chatService.sendMessage(receiverID, _messageController.text);

      // clear text controller
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Column(
        children: [
          // display all the message
          Expanded(
              child: _buildMessageList(),
          ),

          // user input
          _buildUserInput(),

        ],
      ),
    );
  }

  Widget _buildMessageList(){
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatService.getMessages(receiverID, senderID),
        builder: (context,snapshot) {
          // error
          if(snapshot.hasError){
            return Text('error');
          }

          // loading
          if(snapshot.connectionState == ConnectionState.waiting){
            return Text('Loading..');
          }

          // return list view
          return ListView(
            children:
            snapshot.data!.docs.map((doc)=> _buildMessageItem(doc)).toList(),
          );
        },
    );
  }

  // build message item
  Widget _buildMessageItem(DocumentSnapshot doc){
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // is current user
    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;

    // align message to the right if sender is the current user, otherwise left
    var alignment = isCurrentUser? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: ChatBubble(
          message: data['message'],
          isCurrentUser: isCurrentUser,
      ),
    );
  }

  // build message input
  Widget _buildUserInput(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          // text field should take up most of the space
          Expanded(
              child: MyTextfield(
                  hintText: 'Type a message',
                  obscureText: false,
                  controller: _messageController,
              ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.only(right: 15),
            child: IconButton(
                onPressed: sendMessage,
                icon: Icon(Icons.arrow_upward,color: Colors.white,),
            ),
          ),
        ],
      ),
    );
  }
}
