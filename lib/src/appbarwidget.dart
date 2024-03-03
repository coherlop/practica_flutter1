import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
	const AppBarWidget({
		super.key,
		required this.onReset
	});

	final Function onReset;

	@override
	Widget build(BuildContext context) {
		return AppBar(
				leading: Container(width: 50, padding: const EdgeInsets.only(left:25.0), child: Image.asset('media/images/noteicon.png')),
				title: 	const Text('TareApp', style: TextStyle(color: Colors.white, fontFamily: 'Monserga', fontSize: 48)),
				centerTitle: true,
				actions: [
					MenuBar(
						children: [
							SubmenuButton(
								menuChildren: [
									MenuItemButton(
										child: const MenuAcceleratorLabel('Vaciar lista',),
										onPressed: () {
											onReset();
										}
									)
								], 
								child: const Icon(Icons.menu),
							)
						]
					)
				],
				backgroundColor: const Color.fromARGB(255, 83, 202, 223),
			);
	}
	
	@override
	Size get preferredSize => AppBar().preferredSize;

}