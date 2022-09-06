import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spice_blog/blogs/datasource/models.dart';
import 'package:spice_blog/di.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class IBlogRepository {
  Stream<List<Blog>> fetchAllBlogs();
  Future<void> addBlog(Blog blog);
  Future<bool> deleteBlog(int id);
}

class BlogRepository implements IBlogRepository {
  final Ref _ref;

  late final WebSocketChannel _channel = WebSocketChannel.connect(
      Uri.parse('wss://spiceblogserver-production.up.railway.app/ws'));

  BlogRepository(this._ref); // Private Constructor

  @override
  Stream<List<Blog>> fetchAllBlogs() async* {
    yield* _channel.stream.map((event) {
      try {
        final data = json.decode(event);
        return data.map<Blog>((e) => Blog.fromJson(e)).toList();
      } catch (e) {
        print(e);
        return <Blog>[];
      }
    });
  }

  @override
  Future<void> addBlog(Blog blog) async {
    final res = await _ref
        .read(networkClientProvider)
        .post('addBlog', data: blog.toJson());
    log(res.body);
  }

  @override
  Future<bool> deleteBlog(int id) async {
    final res =
        await _ref.read(networkClientProvider).delete('deleteBlog?id=$id');
    return res.statusCode == 200;
  }
}
