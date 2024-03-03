import 'package:flutter/material.dart';

class ToDoItemData {
	ToDoItemData({
		required this.title,
		required this.index,
		this.isDone = false,
		this.isRemoved = false
	});

	final String title;
	final int index;
	bool isRemoved;
	bool isDone;
}

class ToDoItemWidget extends StatelessWidget {
	final ToDoItemData data;
	final Function onDataChange;
	final Function onRemove;

	const ToDoItemWidget({
		super.key,
		required this.data,
		required this.onDataChange,
		required this.onRemove,
	});

	@override
	Widget build(BuildContext context) {
		Checkbox check = Checkbox(
			value: data.isDone,
			onChanged: (bool? value) {
				data.isDone = value!;
				onDataChange(data);
			},
			fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
				if (!data.isDone) {
					return Colors.white.withOpacity(0.1);
				}
				return Colors.orangeAccent;
			})
		);

		IconButton deleteButton = IconButton(
			onPressed: () {
				data.isRemoved = true;
				onRemove(data);
			},
			icon: const Icon(Icons.delete)
		);

		return Row(
			children: [
				check,
				Text(data.title, style: const TextStyle(fontFamily: 'Typoround', fontWeight: FontWeight.w400, color: Colors.black, fontSize: 18)),
				deleteButton
			],
		);
	}
}