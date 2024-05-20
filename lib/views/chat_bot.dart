import 'package:flutter/material.dart';

class ChatBot extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> _messages = <Message>[];
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.insert(0, Message(text: text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('web/assets/media/steps/7/FONDO.png'), // Image path
            fit: BoxFit.cover, // Cover the whole area
          ),
        ),
        child:       Column(
          children: <Widget>[
            SafeArea(
                child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('web/assets/media/steps/7/DOCTOR.png'),
                        width: 130,
                        height: 130,// Replace 'path/to/image.png' with the actual file path
                      ),
                      Image(
                        image: AssetImage('web/assets/media/steps/7/HI.png'), // Replace 'path/to/image.png' with the actual file path
                      ),
                    ],
              ),
            )
,
            Flexible(
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
            Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextComposer(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Colors.indigo),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(hintText: 'Send a message'),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Message extends StatelessWidget {
  final String text;

  const Message({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              child: Text('Tú'),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'User',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(text),
              ),
            ],
          ),
        ],
      ),
    );
  }
}