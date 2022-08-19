import 'package:flutter/material.dart';
import 'package:spice_blog/blogs/datasource/blog_repository.dart';
import 'package:spice_blog/blogs/datasource/models.dart';
import 'package:spice_blog/blogs/screens/add_blog.dart';
import 'package:spice_blog/blogs/screens/blog_details.dart';

class BlogFeed extends StatefulWidget {
  const BlogFeed({Key? key}) : super(key: key);

  @override
  State<BlogFeed> createState() => _BlogFeedState();
}

class _BlogFeedState extends State<BlogFeed> {
  final BlogRepository repo = BlogRepository();

  List<Blog> _blogs = [];
  bool _isLoading = false;

  Future<void> fetchAllBlogs() async {
    setState(() {
      _isLoading = true;
    });
    final List<Blog> blogs = await repo.fetchAllBlogs();
    setState(() {
      _blogs = blogs;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAllBlogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'All Blogs',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0.25,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh, color: Colors.black),
              onPressed: fetchAllBlogs,
            )
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddBlogPage()));
          fetchAllBlogs();
        },
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await fetchAllBlogs();
        },
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BlogDetails(blog: _blogs[index]),
                      ),
                    );
                  },
                  trailing: IconButton(
                      onPressed: () async {
                        final isDeleted =
                            await repo.deleteBlog(_blogs[index].id!);
                        if (isDeleted) {
                          fetchAllBlogs();
                        }
                      },
                      icon: const Icon(Icons.delete)),
                  leading: Image.network(_blogs[index].imageUrl),
                  title: Text(_blogs[index].title),
                  subtitle: Text('by ${_blogs[index].author.email}'),
                ),
                itemCount: _blogs.length,
              ),
      ),
    );
  }
}
