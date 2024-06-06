import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/src/pages/home/provider/todo_list_provider.dart';
import 'package:todo_window_app/style/component/button/custom_circular_dropdown.dart';

class BasicScreen extends ConsumerWidget {
  const BasicScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoLists = ref.watch(todoListProvider);
    print(todoLists.length);
    return Expanded(
      child: Container(
          width: double.infinity,
          color: ref.theme.color.surface,
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: CustomCircularDropdown(
                  firstValue: todoLists.isNotEmpty ? todoLists[0].name : "",
                  items: [for (var todo in todoLists) todo.name],
                  onChanged: (value) {},
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: todoLists.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(todoLists[index].name),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
