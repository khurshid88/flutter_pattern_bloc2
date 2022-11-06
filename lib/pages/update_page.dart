import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc2/bloc/create_bloc.dart';
import 'package:pattern_bloc2/bloc/create_event.dart';
import 'package:pattern_bloc2/bloc/create_state.dart';
import 'package:pattern_bloc2/bloc/home_event.dart';
import 'package:pattern_bloc2/bloc/update_bloc.dart';
import 'package:pattern_bloc2/bloc/update_state.dart';

import '../bloc/update_event.dart';
import '../model/post_model.dart';

class UpdatePage extends StatefulWidget {
  final Post? post;

  const UpdatePage({Key? key, required this.post}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late UpdateBloc updateBloc;
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.post!.title!;
    bodyController.text = widget.post!.body!;

    updateBloc = BlocProvider.of<UpdateBloc>(context);
    updateBloc.stream.listen((state) {
      if (state is UpdatedPostState) {
        _finish(context);
      }
      if (state is UpdateErrorState) {}
    });
  }

  _finish(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Post"),
      ),
      body: BlocBuilder<UpdateBloc, UpdateState>(
        builder: (BuildContext context, UpdateState state) {
          if (state is UpdateLoadingState) {
            return viewOfUpdate(true, context, titleController, bodyController);
          }
          return viewOfUpdate(false, context, titleController, bodyController);
        },
      ),
    );
  }

  Widget viewOfUpdate(
      bool isLoading,
      BuildContext context,
      TextEditingController titleController,
      TextEditingController bodyController) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Stack(
        children: [
          Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    hintText: "Title",
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
              TextField(
                controller: bodyController,
                decoration: const InputDecoration(
                    hintText: "Body", hintStyle: TextStyle(color: Colors.grey)),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  updateBloc.add(UpdatePostEvent(post: widget.post!));
                },
                color: Colors.blue,
                child: const Text(
                  "Update a Post",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
