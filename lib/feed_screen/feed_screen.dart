import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final List<Map<String, dynamic>> posts = [
    {
      'username': 'john_doe',
      'profileImage': 'https://via.placeholder.com/50',
      'postImage': 'https://via.placeholder.com/400',
      'caption': 'Enjoying the sunset! 🌅',
      'likes': 120,
    },
    {
      'username': 'emma_smith',
      'profileImage': 'https://via.placeholder.com/50',
      'postImage': 'https://via.placeholder.com/400',
      'caption': 'Weekend vibes! 🍃',
      'likes': 240,
    },
    {
      'username': 'mike_adams',
      'profileImage': 'https://via.placeholder.com/50',
      'postImage': 'https://via.placeholder.com/400',
      'caption': 'Coffee time ☕',
      'likes': 90,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forrestors'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];

          return PostCard(
            username: post['username'],
            profileImage: post['profileImage'],
            postImage: post['postImage'],
            caption: post['caption'],
            likes: post['likes'],
          );
        },
      ),
    );
  }
}

class PostCard extends StatefulWidget {
  final String username;
  final String profileImage;
  final String postImage;
  final String caption;
  final int likes;

  const PostCard({
    Key? key,
    required this.username,
    required this.profileImage,
    required this.postImage,
    required this.caption,
    required this.likes,
  }) : super(key: key);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLiked = false;
  int likeCount = 0;

  @override
  void initState() {
    super.initState();
    likeCount = widget.likes;
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info Row
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.profileImage),
            ),
            title: Text(widget.username, style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.more_vert),
          ),

          // Post Image
          GestureDetector(
            onDoubleTap: toggleLike,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.network(widget.postImage, width: double.infinity, fit: BoxFit.cover),
                if (isLiked)
                  Icon(Icons.favorite, color: Colors.red, size: 100),
              ],
            ),
          ),

          // Like, Comment, Share Icons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: toggleLike,
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.black,
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.comment_outlined)),
                IconButton(onPressed: () {}, icon: Icon(Icons.send_outlined)),
              ],
            ),
          ),

          // Like Count and Caption
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '$likeCount likes',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${widget.username} ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: widget.caption),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



