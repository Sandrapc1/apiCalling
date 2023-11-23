// ignore_for_file: unnecessary_string_interpolations, non_constant_identifier_names

import 'package:api_study/views/widgets/container_buildcontent.dart';
import 'package:flutter/material.dart';
import '../../controller/todo_controller.dart';
import '../../model/todo_model.dart';

SafeArea SafeAreaBuildContent(
    AsyncSnapshot<List<Todo>> snapshot, TodoController todoController) {
  return SafeArea(
    child: ListView.separated(
        itemBuilder: (context, index) {
          var todo = snapshot.data?[index];
          return Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(flex: 1, child: Text('${todo?.id}')),
                Expanded(flex: 3, child: Text('${todo?.title}')),
                Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                            onTap: () {
                              todoController
                                  .updatePatchCompleted(todo!)
                                  .then((value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        content: Text('$value')));
                              });
                            },
                            child: BuildController('Patch',
                                const Color.fromARGB(255, 240, 214, 175))),
                        InkWell(
                            onTap: () {
                              todoController.updatePutCompleted(todo!);
                            },
                            child: BuildController('Put',
                                const Color.fromARGB(255, 238, 197, 238))),
                        InkWell(
                            onTap: () {
                              todoController.deleteTodo(todo!).then((value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        content: Text('$value')));
                              });
                            },
                            child: BuildController('Delete',
                                const Color.fromARGB(255, 238, 143, 143))),
                      ],
                    )),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 0.5,
            height: 0.5,
          );
        },
        itemCount: snapshot.data?.length ?? 0),
  );
}
