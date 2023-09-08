import 'package:flutter/material.dart';

import 'Post.dart';
import 'PostList.dart';
import 'TextInputWidget.dart';

class MyHomePage extends StatefulWidget {
  final String name;
  const MyHomePage({super.key, required this.name});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String newText) {
    setState(() {
      posts.add(Post(body: newText, author: widget.name));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arifs Blogs'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: PostList(listItems: posts)),
          TextInputWidget(newPost),
        ],
      ),
    );
  }
}
