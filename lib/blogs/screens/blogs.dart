import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spice_blog/blogs/logic/blog_feed_bloc/blog_feed_bloc.dart';
import 'package:spice_blog/blogs/logic/blog_feed_bloc/blog_feed_event.dart';
import 'package:spice_blog/blogs/screens/add_blog.dart';

final blocProvider =
    Provider<BlogFeedBloc>((ref) => BlogFeedBloc(ref)..add(OnFeedLoadEvent()));

final _blogFeedProvider =
    StreamProvider((ref) => ref.watch(blocProvider).stream);

class BlogFeed extends ConsumerWidget {
  const BlogFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(blocProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Blogs ',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0.25,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/blogs/${AddBlogPage.route}');
        },
        child: const Icon(Icons.add),
      ),
      body: ref.watch(_blogFeedProvider).when(
            data: (blogs) => ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, index) {
                final blog = blogs.blogs[index];
                return ListTile(
                  key: ValueKey(blog.id),
                  onTap: () {
                    context.go('/blogs/details', extra: blog);
                  },
                  trailing: IconButton(
                      onPressed: () => bloc.add(OnDeleteBlogEvent(blog.id!)),
                      icon: const Icon(Icons.delete)),
                  leading: Image.network(
                    blog.imageUrl,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  title: Text(blog.title),
                  subtitle: Text('by ${blog.author.email}'),
                );
              },
              itemCount: blogs.blogs.length,
            ),
            error: (err, _) => Center(
              child: Text(
                '$err',
                style: const TextStyle(color: Colors.red),
              ),
            ),
            loading: () => const CircularProgressIndicator(),
          ),
    );
  }
}
