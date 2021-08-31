import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class PostPage extends StatefulWidget {
  final String imageUrl, title, desc;

  const PostPage({this.imageUrl, this.title, this.desc});

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  Widget postContent(htmlContent) {
    return Html(data: htmlContent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(widget.imageUrl),
              SizedBox(height: 8.0),
              Text(
                widget.title,
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 4.0),
              postContent(widget.desc),
            ],
          ),
        ),
      ),
    );
  }
}
