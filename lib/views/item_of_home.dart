import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pattern_bloc2/bloc/home_event.dart';
import 'package:pattern_bloc2/bloc/update_bloc.dart';
import '../bloc/home_bloc.dart';
import '../model/post_model.dart';
import '../pages/update_page.dart';

Widget itemOfPost(BuildContext context, HomeBloc homeBloc, Post post) {
  return Slidable(
    startActionPane: ActionPane(
      motion: const ScrollMotion(),
      dismissible: DismissiblePane(onDismissed: () {}),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            homeBloc.callUpdatePage(context, post);
          },
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: "Update",
        )
      ],
    ),
    endActionPane: ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          // An action can be bigger than the others.
          onPressed: (BuildContext context) {
            BlocProvider.of<HomeBloc>(context).add(DeletePostEvent(post: post));
          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ],
    ),
    child: Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title!.toUpperCase(),
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            post.body!,
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
    ),
  );
}
