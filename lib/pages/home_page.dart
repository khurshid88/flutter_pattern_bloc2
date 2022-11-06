import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../model/post_model.dart';
import '../views/item_of_home.dart';
import 'create_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(LoadPostsEvent());
    homeBloc.stream.listen((state) {
      if (state is HomeDeletePostState) {
        homeBloc.add(LoadPostsEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BloC"),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeErrorState) {
              return viewOfError(state.errorMessage);
            }

            if (state is HomePostListState) {
              var items = state.posts;
              return viewOfPostList(items);
            }

            return viewOfLoading();
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            homeBloc.callCreatePage(context);
          },
          child: const Icon(Icons.add),
        ));
  }

  Widget viewOfError(String err) {
    return Center(
      child: Text("Error occurred $err"),
    );
  }

  Widget viewOfLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget viewOfPostList(List<Post> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (ctx, index) {
        Post post = items[index];
        return itemOfPost(ctx, homeBloc, post);
      },
    );
  }
}
