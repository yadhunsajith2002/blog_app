import 'package:blog_app/core/common/widgets/loader.dart';
import 'package:blog_app/core/theme/app_pallette.dart';
import 'package:blog_app/core/utils/snackbar.dart';
import 'package:blog_app/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:blog_app/features/blog/presentation/pages/add_new_blogpage.dart';
import 'package:blog_app/features/blog/presentation/widgets/blog_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const BlogPage(),
      );
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  void initState() {
    super.initState();
    context.read<BlogBloc>().add(BlogFetchAllBlogs());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              backgroundColor: Colors.black,
              title: const Text('Blogs'),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context, AddNewBlogPage.route());
                  },
                  icon: const Icon(
                    CupertinoIcons.add_circled,
                  ),
                ),
              ],
            ),
            BlocConsumer<BlogBloc, BlogState>(
              listener: (context, state) {
                if (state is BlogFailure) {
                  showSnackBar(context, state.error);
                }
              },
              builder: (context, state) {
                if (state is BlogLoading) {
                  return const SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Loader(),
                      ],
                    ),
                  );
                }
                // if (state is BlogsDisplaySuccess) {
                //   return SliverList(
                //     delegate: SliverChildBuilderDelegate(
                //       (context, index) {
                //         final blog = state.blogs[index];
                //         return BlogCard(blog: blog, color: Colors.grey);
                //       },
                //       childCount: state.blogs.length,
                //     ),
                //   );
                // }
                if (state is BlogsDisplaySuccess) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final reversedIndex = state.blogs.length - 1 - index;
                        final blog = state.blogs[reversedIndex];
                        return BlogCard(blog: blog, color: Colors.grey);
                      },
                      childCount: state.blogs.length,
                    ),
                  );
                }
                return const SliverToBoxAdapter(child: SizedBox());
              },
            ),
          ],
        ),
      ),
    );
  }
}
