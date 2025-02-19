import 'package:chatter_box_flutter/auth/auth_service.dart';
import 'package:chatter_box_flutter/components/my_drawer.dart';
import 'package:chatter_box_flutter/pages/chat_page.dart';
import 'package:chatter_box_flutter/services/chat/chat_service.dart';
import 'package:flutter/material.dart';
import '../components/user_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // chat & auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }
  // build a list of users except for the current logged user
  Widget _buildUserList(){
    return StreamBuilder(
        stream: _chatService.getUsersStream(),
        builder: (context,snapshot){
          // error
          if(snapshot.hasError){
            return Text('Error');
          }

          // loading
          if(snapshot.connectionState == ConnectionState.waiting){
            return Text('Laoding');
          }

          // return list view
          return ListView(
            children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData,context)).toList(),
          );
        },
    );
  }
  Widget _buildUserListItem(Map<String,dynamic>userData, BuildContext context){
    // display all user
    if(userData['email']!=_authService.getCurrentUser()!.email){
      return UserTile(
        text: userData['email'],
        onTap: (){
          // tapped on a user -> go to chat page
          Navigator.push(context,
            MaterialPageRoute(
                builder: (context)=>ChatPage(receiverEmail: userData['email'],)
            ),
          );
        },
      );
    }else{
      return Container();
    }

  }
}
