import 'package:flutter/material.dart';
import 'home_page.dart';

class FirstScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController sentenceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background 1.png'),
                fit: BoxFit.cover, // Cover the entire screen
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/ic_photo.png'),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 310,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white.withOpacity(0.7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(hintText: 'Name', hintStyle: TextStyle(color: Colors.grey.shade500), border: InputBorder.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 310,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white.withOpacity(0.7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextField(
                        controller: sentenceController,
                        decoration: InputDecoration(hintText: 'Sentence', hintStyle: TextStyle(color: Colors.grey.shade500),border: InputBorder.none),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: 310,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        ),
                        primary: Color(0xFF2B637B)
                      ),
                      onPressed: () {
                        String sentence = sentenceController.text;
                        bool isPalindrome = checkPalindrome(sentence);
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Palindrome Check'),
                            content: Text(isPalindrome ? 'Palindrome' : 'Not Palindrome'),
                          ),
                        );
                      },
                      child: Text('CHECK'),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 310,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        ),
                        primary: Color(0xFF2B637B)
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondScreen(name: nameController.text,),
                          ),
                        );
                      },
                      child: Text('NEXT'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool checkPalindrome(String text) {
    String cleanText = text.replaceAll(' ', '').toLowerCase();
    String reversedText = cleanText.split('').reversed.join('');
    return cleanText == reversedText;
  }
}
