import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:wordpress_api_app/src/views/post.dart';
import 'package:wordpress_api_app/src/wp_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wordpress Tutorial"),
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchWpPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Map wppost = snapshot.data[index];
                  return PostTile(
                    href: wppost["_links"]["wp:featuredmedia"][0]["href"],
                    title: wppost["title"]["rendered"],
                    desc: wppost["excerpt"]["rendered"],
                    content: wppost["content"]["rendered"],
                  );
                },
              );
            }
            return Center(
              child: CupertinoActivityIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class PostTile extends StatefulWidget {
  final String href, title, desc, content;
  PostTile({this.content, this.desc, this.href, this.title});

  @override
  _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  var imageUrl = "";

  Widget shortDescriptionView() {
    return Html(data: widget.desc);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostPage(
              imageUrl: imageUrl,
              title: widget.title,
              desc: widget.content,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: fetchWpPostImageUrl(widget.href),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  imageUrl = snapshot.data["guid"]["rendered"];

                  return Image.network(snapshot.data["guid"]["rendered"]);
                }
                return CupertinoActivityIndicator();
              },
            ),
            SizedBox(height: 8.0),
            Text(
              widget.title,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 5.0),
            shortDescriptionView(),
          ],
        ),
      ),
    );
  }
}
