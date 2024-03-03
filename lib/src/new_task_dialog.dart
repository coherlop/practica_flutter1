import 'package:flutter/material.dart';

class NewTaskDialog extends StatelessWidget {
	const NewTaskDialog({
		super.key
	});

	@override
	Widget build(BuildContext context) {
		String? task;
		return AlertDialog(
			titleTextStyle: const TextStyle(fontFamily: 'Typoround', fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 23),
			title: const Text('Nueva tarea'),
			content: TextField(
				decoration: const InputDecoration(
					focusedBorder: UnderlineInputBorder(
						borderSide: BorderSide(color: Colors.orangeAccent))
				),
				autofocus: true,
				onChanged: (String value) {
					task = value;
				},
			),
			actions: [
				TextButton(
					onPressed: () {
						Navigator.of(context).pop(null);
					},
					style: TextButton.styleFrom(foregroundColor: Colors.blue,
						textStyle: const TextStyle(fontFamily: 'Typoround',
						fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 16),),
					child: const Text('Cancelar'),
				),
				TextButton(
					onPressed: () {
						Navigator.of(context).pop(task);
					},
					style: TextButton.styleFrom(foregroundColor: Colors.blue,textStyle: const TextStyle(fontFamily: 'Typoround',
		fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 16),),
					child: const Text('Aceptar'),
				)
			],
		);
	}
}