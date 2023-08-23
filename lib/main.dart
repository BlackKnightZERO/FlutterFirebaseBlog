import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.deepPurpleAccent,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class Post {
  String body;
  String author;
  int likes = 0;
  bool unserLiked = false;

  Post({required this.body, required this.author});

  void likePost() {
    unserLiked = !unserLiked;
    likes = unserLiked ? likes += 1 : likes -= 1;
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String newText) {
    setState(() {
      posts.add(Post(body: newText, author: "Author"));
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

class TextInputWidget extends StatefulWidget {
  final Function(String) callback;
  const TextInputWidget(this.callback);

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void click() {
    widget.callback(controller.text);
    controller.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.message),
        labelText: "Type a message",
        suffixIcon: IconButton(
          icon: const Icon(Icons.send),
          splashColor: const Color.fromARGB(255, 187, 22, 47),
          tooltip: "Post Message",
          onPressed: () => {click()},
        ),
      ),
    );
  }
}

class PostList extends StatefulWidget {
  final List<Post> listItems;
  const PostList({super.key, required this.listItems});
  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void like(Function callBack) {
    setState(() {
      callBack();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listItems.length,
      itemBuilder: (context, index) {
        var post = widget.listItems[index];
        return Card(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: Text(post.body),
                  subtitle: Text(post.author),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Text(
                      post.likes.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  IconButton(
                    onPressed: () => like(post.likePost),
                    icon: const Icon(Icons.thumb_up),
                    color: post.unserLiked ? Colors.green : Colors.black,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
