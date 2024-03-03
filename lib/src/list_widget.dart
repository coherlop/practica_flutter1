import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica_flutter/src/to_do_item.dart';

class ListWidget extends StatelessWidget {
	const ListWidget({
		super.key,
		required this.items
	});

	final List<ToDoItemWidget> items;

	@override
	Widget build(BuildContext context) {
		List<ToDoItemWidget> doneTaskList = List.empty(growable: true);
		List<ToDoItemWidget> undoneTaskList = List.empty(growable: true);
		for (var element in items) {
			if (element.data.isRemoved) continue;
			if (element.data.isDone) {
			  doneTaskList.add(element);
			} else {
			  undoneTaskList.add(element);
			}
		}

		TextStyle? titleStyle = const TextStyle(
			fontFamily: 'Typoround',
			fontWeight: FontWeight.bold,
			fontSize: 30,
			color: Colors.blue
		);
		
		return Column(
			children: [
				Expanded(child: ListView(
					children: [
						Text('Tareas pendientes', style: titleStyle, ),
						...undoneTaskList,
						const Divider(color: Colors.orangeAccent, height: 50, thickness: 3,),
						Text('Tareas terminadas', style: titleStyle),
						...doneTaskList
					],
				))
			]
		);
	}
}