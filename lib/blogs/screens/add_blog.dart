import 'package:flutter/material.dart';
import 'package:spice_blog/auth/datasource/auth_repository.dart';
import 'package:spice_blog/blogs/datasource/blog_repository.dart';
import 'package:spice_blog/blogs/datasource/models.dart';
import 'package:spice_blog/common/widgets/input_field.dart';
import 'package:spice_blog/common/widgets/vertical_spacing.dart';

class AddBlogPage extends StatefulWidget {
  const AddBlogPage({Key? key}) : super(key: key);

  @override
  State<AddBlogPage> createState() => _AddBlogPageState();
}

class _AddBlogPageState extends State<AddBlogPage> {
  final BlogRepository repo = BlogRepository();
  final AuthRepository _authRepo = AuthRepository();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  bool _isLoading = false;

  Future<void> addBlog() async {
    if (_titleController.text.length >= 10) {
      final blog = Blog(
        title: _titleController.text,
        content: _contentController.text,
        imageUrl: _imageController.text,
        author: Author(email: _authRepo.currentUser!.email, photoUrl: ""),
        updatedAt: DateTime.now(),
      );

      setState(() {
        _isLoading = true;
      });
      _titleController.clear();
      _contentController.clear();
      _imageController.clear();
      await repo.addBlog(blog);
      setState(() {
        _isLoading = false;
      });
    }

    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 48.0,
            horizontal: MediaQuery.of(context).size.width / 6,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Add Blog',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const VerticalSpacing(),
              InputField(
                controller: _titleController,
                hintText: 'Title',
                labelText: 'Title',
              ),
              const VerticalSpacing(),
              InputField(
                controller: _contentController,
                hintText: 'Content',
                labelText: 'Content',
              ),
              const VerticalSpacing(),
              InputField(
                controller: _imageController,
                hintText: 'Image Url',
                labelText: 'Image Url',
              ),
              const VerticalSpacing(),
              ElevatedButton(
                  onPressed: _isLoading ? null : addBlog,
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : const Text('Add Blog'))
            ],
          ),
        ),
      ),
    );
  }
}
