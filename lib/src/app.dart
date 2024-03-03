import 'package:flutter/material.dart';
import 'package:practica_flutter/src/appbarwidget.dart';
import 'package:practica_flutter/src/list_widget.dart';
import 'package:practica_flutter/src/new_task_dialog.dart';
import 'package:practica_flutter/src/to_do_item.dart';

class App extends StatefulWidget {
	const App({ super.key });
	
	@override
	State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
	List<ToDoItemWidget> list = [];

	ToDoItemWidget createNewItem(String taskText) {
		ToDoItemData data = ToDoItemData(
			title: taskText,
			index: list.length
		);
		return ToDoItemWidget(
			data: data,
			onDataChange: (ToDoItemData newData) {
				setState(() {
					data = newData;
				});
			},
			onRemove: (ToDoItemData newData) {
				setState(() {
					data.isRemoved = true;
				});
			}
		);
	}

	Future<String?> showTaskTextDialog() {
		return showDialog<String> (
			context: context,
			builder: (BuildContext context) {
				return const NewTaskDialog();
			}
		);
	}
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBarWidget(
				onReset: () {
					setState(list.clear);
				},
			),
			body: Center(
				child: Container(
					padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
					decoration: const BoxDecoration(
						image: DecorationImage(
							opacity: 0.12,
							image: AssetImage('media/images/background.jpg'),
						)
					),
					child: ListWidget(items: list)
				)
			),
			floatingActionButton: 
				FloatingActionButton(
					onPressed: () async {
						String? task = await showTaskTextDialog();
						setState(() {
							list = [...list, createNewItem(task!)];
						});
					},
					backgroundColor: Colors.orangeAccent,
					child: const Icon(Icons.add),
				)
		);
	}
}