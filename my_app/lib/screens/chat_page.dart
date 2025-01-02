import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Chat',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];

  // Base URL for the Go API server
  final String baseURL = "https://ietp-backend-1e46.onrender.com/chat";

  Future<void> sendMessage(String userMessage) async {
    setState(() {
      _messages.add({'role': 'user', 'content': userMessage});
    });

    try {
      final response = await http.post(
        Uri.parse(baseURL),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'messages': [
            {
              'role': 'system',
              'content':
                  'You are an insect farming expert. Be descriptive and helpful.'
            },
            {'role': 'user', 'content': userMessage},
          ],
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final aiMessage = data['ai_response'];

        setState(() {
          _messages.add({'role': 'ai', 'content': aiMessage});
        });
      } else {
        setState(() {
          _messages.add({
            'role': 'ai',
            'content': 'Error: ${response.reasonPhrase}',
          });
        });
      }
    } catch (e) {
      setState(() {
        _messages.add({
          'role': 'ai',
          'content': 'Failed to connect to the AI API.',
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AI Chat Assistant',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUser = message['role'] == 'user';

                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.teal[300] : Colors.grey[300],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: isUser ? Radius.circular(15) : Radius.zero,
                        bottomRight: isUser ? Radius.zero : Radius.circular(15),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (!isUser)
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.teal[700],
                            child: Icon(
                              Icons.android,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        if (!isUser) SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            message['content']!,
                            style: TextStyle(
                              fontSize: 16,
                              color: isUser ? Colors.white : Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Colors.teal,
                  ),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      sendMessage(_controller.text);
                      _controller.clear();
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
