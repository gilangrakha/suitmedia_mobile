import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia/login_page.dart';
import 'services/selected_user.dart';
import 'user_page.dart';

class SecondScreen extends StatelessWidget {
  final String name;

  SecondScreen({required this.name});

  @override
  Widget build(BuildContext context) {
    final selectedUserNameProvider = Provider.of<SelectedUserNameProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FirstScreen(),
              ),
            );
          },
        ),
        title: Text(
          'Second Screen', 
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '$name',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '${selectedUserNameProvider.selectedUserName}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 310,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF2B637B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThirdScreen(),
                      ),
                    );
                  },
                  child: Text('Choose a User'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
