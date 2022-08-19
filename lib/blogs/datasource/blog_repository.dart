import 'dart:convert';
import 'dart:developer';

import 'package:spice_blog/blogs/datasource/models.dart';
import 'package:spice_blog/common/network_client/network_client.dart';

class BlogRepository {
  static BlogRepository? _instance;
  BlogRepository._(); // Private Constructor
  factory BlogRepository() {
    _instance ??= BlogRepository._(); // ??= is called Elvis Operator
    return _instance!;
  }

  Future<List<Blog>> fetchAllBlogs() async {
    try {
      final res = await NetworkClient.get('fetchAllBlogs');
      final data = json.decode(res.body);
      return data.map<Blog>((e) => Blog.fromJson(e)).toList();
    } catch (_) {
      return <Blog>[];
    }
  }

  Future<void> addBlog(Blog blog) async {
    final res = await NetworkClient.post('addBlog', data: blog.toJson());
    log(res.body);
  }

  Future<bool> deleteBlog(int id) async {
    final res = await NetworkClient.delete('deleteBlog?id=$id');
    return res.statusCode == 200;
  }
}
