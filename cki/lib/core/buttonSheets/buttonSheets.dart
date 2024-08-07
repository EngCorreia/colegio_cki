import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';

void onClickModalBottomSheet() {
  Asuka.showModalBottomSheet(
    builder: (context) => Material(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      elevation: 7,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: ListView(
          children: [
            const ListTile(
              title: Text('Option 1'),
            ),
            const ListTile(
              title: Text('Option 2'),
            ),
            ListTile(
              title: const Text('Cancel'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    ),
    backgroundColor: Colors.transparent,
  );
}
