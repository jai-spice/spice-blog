import 'package:spice_blog/blogs/datasource/blog_repository.dart';
import 'package:spice_blog/blogs/datasource/models.dart';
import 'package:spice_blog/common/observable/observable.dart';

class BlogFeedBloc {
  final IBlogRepository _blogRepository;

  late final Observable<List<Blog>> blogs = Observable.seeded(<Blog>[]);
  late final Observable<bool> isLoading = Observable.seeded(false);

  BlogFeedBloc(this._blogRepository) {
    _blogRepository.fetchAllBlogs().listen((event) {
      blogs.addValue(event);
    });
  }

  Future<void> deleteBlog(int id) async {
    await _blogRepository.deleteBlog(id);
  }

  void dispose() {
    blogs.dispose();
    isLoading.dispose();
  }
}
