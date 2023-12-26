import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'services/user_model.dart';

import 'package:suitmedia/services/selected_user.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users?per_page=10'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        users = (jsonData['data'] as List).map((user) => User.fromJson(user)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Third Screen',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: RefreshIndicator(
        onRefresh: fetchUsers,
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: ListTile(
                    title: Text(
                      '${users[index].firstName} ${users[index].lastName}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      users[index].email,
                      style: TextStyle(fontSize: 12),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(users[index].avatar),
                      radius: 24,
                    ),
                    onTap: () {
                      final selectedUserNameProvider = Provider.of<SelectedUserNameProvider>(context, listen: false);
                      selectedUserNameProvider.setSelectedUserName('${users[index].firstName} ${users[index].lastName}');
                      Navigator.pop(context);
                    },
                  ),
                ),
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 1.0,
                  indent: 20,
                  endIndent: 20,
                ),
              ],
            );
          },
        )
      ),
    );
  }
}
